using Microsoft.EntityFrameworkCore;
using store.Api;
using store.Data;
using store.DTO;
using store.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Windows.Input;
using static System.Collections.Specialized.BitVector32;

namespace store.ViewModels
{
    public class InsertDataApi
    {

      
        private readonly HttpHelper _httpHelper;


        private readonly ItemCardEntity _itemCardEntity;
        private readonly ItemFileEntity _itemFile;
        private readonly ItemBarcodeEntity _itemBarcode;
        private readonly ItemUnitEntity _itemUnit;
        private readonly SectionEntity _sectionEntity;
        private readonly ConnectionEntity connectionEntity;

        private readonly ExportedRakEntity _exportedRakEntity;
        private readonly ExportedSectionEntity _exportedSectionEntity;
        private readonly ExportedCardEntity _exportedCardEntity;
        private string _searchDate;
        private readonly CategoryEntity categoryEntity;


        public string SearchDate
        {
            get => _searchDate;
            set
            {
                _searchDate = value;
                OnPropertyChanged(nameof(SearchDate));
            }
        }


        public InsertDataApi(HttpHelper httpHelper)
        {
            _httpHelper = httpHelper;

            _itemCardEntity = new ItemCardEntity();
            _itemBarcode = new ItemBarcodeEntity();
            _itemFile = new ItemFileEntity();
            _itemUnit = new ItemUnitEntity();
            _sectionEntity = new SectionEntity();

            _exportedRakEntity = new ExportedRakEntity();
            _exportedSectionEntity = new ExportedSectionEntity();
            _exportedCardEntity = new ExportedCardEntity();
            connectionEntity = new ConnectionEntity();
            categoryEntity = new CategoryEntity();
        }





        public async Task InsertApiData()
        {
            string url = "http://192.168.1.9:8000/api/items";

            try
            {
                string apiKey = "12345-ABCDE-67890-FGHIJ";
                string secretKey = "S3cr3tK3y!@#2023";

                var connectionData = await connectionEntity.FetchConnectionData();
                if (connectionData == null)
                {
                    Debug.WriteLine("Connection data is null. Cannot proceed with API request.");
                    return;
                }

                var httpHelper = new HttpHelper(apiKey, secretKey);
                var response = await _httpHelper.GetResponse(url, connectionData.ServerName, connectionData.DatabaseName, connectionData.Username, connectionData.Password, connectionData.Year).ConfigureAwait(false);
                Debug.WriteLine($"Raw API Response: {response}");

                if (!string.IsNullOrEmpty(response))
                {
                    await InsertDataToDatabase(response);
                }
                else
                {
                    Debug.WriteLine("No data received from the API.");
                }
            }
            catch (HttpRequestException httpEx)
            {
                Debug.WriteLine($"HTTP request failed: {httpEx.Message}");
                if (httpEx.StatusCode.HasValue)
                {
                    Debug.WriteLine($"HTTP status code: {httpEx.StatusCode}");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching data from API: {ex.Message}");
                if (ex.InnerException != null)
                {
                    Debug.WriteLine($"Inner exception: {ex.InnerException.Message}");
                }
            }
        }




        private async Task InsertDataToDatabase(string jsonResponse)
        {
            try
            {
                Debug.WriteLine($"Raw API Response: {jsonResponse}");

                if (string.IsNullOrWhiteSpace(jsonResponse))
                {
                    Debug.WriteLine("JSON response is empty.");
                    return;
                }

            
                if (jsonResponse.Length > 5_000_000) 
                {
                    Debug.WriteLine("Warning: Very large JSON response detected");
                }

              
                Debug.WriteLine($"First 100 chars: {jsonResponse.Substring(0, Math.Min(100, jsonResponse.Length))}");
                if (jsonResponse.Length > 200)
                {
                    Debug.WriteLine($"Last 100 chars: {jsonResponse.Substring(jsonResponse.Length - 100)}");
                }

              
                if (!ValidateJsonStructure(jsonResponse))
                {
                    Debug.WriteLine("Invalid JSON structure detected. Attempting to repair...");
                    jsonResponse = TryRepairJson(jsonResponse);

                    if (jsonResponse == null)
                    {
                        Debug.WriteLine("Could not repair JSON. Aborting deserialization.");
                        return;
                    }
                }

                List<ApiQueryDTO> queryResults;
                try
                {
                  
                    var options = new JsonSerializerOptions
                    {
                        AllowTrailingCommas = true,
                        ReadCommentHandling = JsonCommentHandling.Skip,
                        MaxDepth = 64
                    };

                    var wrapper = JsonSerializer.Deserialize<ApiResponseWrapper>(jsonResponse, options);
                    queryResults = wrapper?.DataQuery1;

                    if (queryResults == null || queryResults.Count == 0)
                    {
                        Debug.WriteLine("No data found in DataQuery1 property or wrapper is null.");
                        return;
                    }
                }
                catch (JsonException ex)
                {
                    Debug.WriteLine($"JSON deserialization failed: {ex.Message}");
                    Debug.WriteLine($"Path: {ex.Path}, LineNumber: {ex.LineNumber}, BytePositionInLine: {ex.BytePositionInLine}");

                   
                    string fixedJson = AttemptJsonFix(jsonResponse, ex);
                    if (fixedJson != null)
                    {
                        try
                        {
                            var options = new JsonSerializerOptions
                            {
                                AllowTrailingCommas = true,
                                ReadCommentHandling = JsonCommentHandling.Skip
                            };

                            var wrapper = JsonSerializer.Deserialize<ApiResponseWrapper>(fixedJson, options);
                            queryResults = wrapper?.DataQuery1;

                            if (queryResults == null || queryResults.Count == 0)
                            {
                                Debug.WriteLine("Repair attempt succeeded but no data found in result.");
                                return;
                            }

                            Debug.WriteLine("JSON repair successful, continuing with processing.");
                        }
                        catch (Exception repairEx)
                        {
                            Debug.WriteLine($"Repair attempt failed: {repairEx.Message}");
                            return;
                        }
                    }
                    else
                    {
                        Debug.WriteLine("Could not repair the JSON response. Processing aborted.");
                        return;
                    }
                }

               
                // Process ItemFile data
                var distinctItemFileData = queryResults
                    .GroupBy(q => q.ItemNum)
                    .Select(g => g.First())
                    .Select(q => new ItemFile
                    {
                        ItemID = int.TryParse(q.ItemID, out int itemId) ? itemId : 0,
                        ItemNum = q.ItemNum,
                        ItemName = q.ItemName,
                        Price = q.Price,
                        ImageUrl = q.ImageUrl,
                        ItemFileCategoryID = !string.IsNullOrEmpty(q.ItemFileCategoryID) &&
                                            int.TryParse(q.ItemFileCategoryID, out int categoryId) ?
                                            categoryId : 0 
                    })
                    .ToList();
                await _itemFile.UpsertItemFileData(distinctItemFileData);
                Debug.WriteLine($"itemfile saved");

                // Process ItemBarcode data
                var itemBarcodeData = queryResults
                    .Select(q => new ItemBarcode
                    {
                        ItemID = int.TryParse(q.ItemID, out int itemId) ? itemId : 0,
                        Barcode = q.Barcode,
                        price = decimal.TryParse(q.BarcodePrice, out decimal price) ? price : 0,
                        UnitDesc = q.UnitDesc,
                        UnitID = int.TryParse(q.UnitIDBarcode, out int unitId) ? unitId : 0,
                    })
                    .ToList();

                await _itemBarcode.UpsertItemBarcodeData(itemBarcodeData);
                Debug.WriteLine($"itemBarcode saved");

                // Process ItemUnit data
                var unitData = queryResults
                    .GroupBy(q => new { q.ItemID, q.ItemNumUnit })
                    .Select(g => g.First())
                    .Select(q => new ItemUnit
                    {
                        ItemID = int.TryParse(q.ItemID, out int itemId) ? itemId : 0,
                        UnitID = int.TryParse(q.UnitID, out int unitId) ? unitId : 0,
                        UnitDesc = q.ItemNumUnit ?? "N/A"
                    })
                    .ToList();

                await _itemUnit.UpsertItemUnitData(unitData);



                var distinctCategories = queryResults
                  .Where(q => !string.IsNullOrEmpty(q.CategoryID) && !string.IsNullOrEmpty(q.CategoryName))
                  .GroupBy(q => q.CategoryID)
                  .Select(g => g.First())
                  .Select(q => new Category 
                  {
                      CategoryID = int.TryParse(q.CategoryID, out int catId) ? catId : 0,
                      CategoryName = q.CategoryName
                  })
                  .ToList();

                if (distinctCategories.Any())
                {
                    
                
                    await categoryEntity.UpsertCategoryData(distinctCategories);
                    Debug.WriteLine($"Saved {distinctCategories.Count} distinct categories");
                }

                Debug.WriteLine("Data insertion/update completed successfully.");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error inserting/updating data: {ex.Message}");
                if (ex.InnerException != null)
                {
                    Debug.WriteLine($"Inner exception: {ex.InnerException.Message}");
                }
            }
        }

       
        private bool ValidateJsonStructure(string json)
        {
            if (string.IsNullOrWhiteSpace(json))
                return false;

       
            int curlyBraceCount = 0;
            int squareBracketCount = 0;
            bool inString = false;
            bool escaped = false;

            foreach (char c in json)
            {
                if (escaped)
                {
                    escaped = false;
                    continue;
                }

                if (c == '\\' && inString)
                {
                    escaped = true;
                    continue;
                }

                if (c == '"')
                {
                    inString = !inString;
                    continue;
                }

                if (!inString)
                {
                    if (c == '{') curlyBraceCount++;
                    else if (c == '}') curlyBraceCount--;
                    else if (c == '[') squareBracketCount++;
                    else if (c == ']') squareBracketCount--;

                    
                    if (curlyBraceCount < 0 || squareBracketCount < 0)
                        return false;
                }
            }

           
            return curlyBraceCount == 0 && squareBracketCount == 0 && !inString;
        }

      
        private string TryRepairJson(string json)
        {
            if (string.IsNullOrWhiteSpace(json))
                return null;

            
            int curlyBraceCount = 0;
            int squareBracketCount = 0;
            bool inString = false;
            bool escaped = false;

            foreach (char c in json)
            {
                if (escaped)
                {
                    escaped = false;
                    continue;
                }

                if (c == '\\' && inString)
                {
                    escaped = true;
                    continue;
                }

                if (c == '"')
                {
                    inString = !inString;
                    continue;
                }

                if (!inString)
                {
                    if (c == '{') curlyBraceCount++;
                    else if (c == '}') curlyBraceCount--;
                    else if (c == '[') squareBracketCount++;
                    else if (c == ']') squareBracketCount--;
                }
            }

          
            StringBuilder repairedJson = new StringBuilder(json);

       
            for (int i = 0; i < squareBracketCount; i++)
            {
                repairedJson.Append("]");
            }

          
            for (int i = 0; i < curlyBraceCount; i++)
            {
                repairedJson.Append("}");
            }

            return repairedJson.ToString();
        }

        private string AttemptJsonFix(string json, JsonException ex)
        {
            if (string.IsNullOrWhiteSpace(json))
                return null;

            try
            {
               
                if (ex.BytePositionInLine > 0)
                {
                   
                    int lastValidPos = FindLastValidJsonBrace(json);
                    if (lastValidPos > 0 && lastValidPos < json.Length)
                    {
                    
                        string truncated = json.Substring(0, lastValidPos + 1);
                        return TryRepairJson(truncated);
                    }
                }

              
                return TryRepairJson(json);
            }
            catch (Exception fixEx)
            {
                Debug.WriteLine($"Error during JSON fix attempt: {fixEx.Message}");
                return null;
            }
        }

     
        private int FindLastValidJsonBrace(string json)
        {
            if (string.IsNullOrWhiteSpace(json))
                return -1;

          
            int lastCloseBrace = json.LastIndexOf("}");
            int lastCloseBracket = json.LastIndexOf("]");

          
            return Math.Max(lastCloseBrace, lastCloseBracket);
        }



        public async Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            Debug.WriteLine($"Scanned barcode: {barcode}");


            var (itemBarcode, itemName, unitDesc,price,ItemID,UnitID) = await _itemBarcode.GetItemByBarcode(barcode);

            if (itemBarcode == null)
            {
                Debug.WriteLine($"No item found for barcode: {barcode}");
            }
            else
            {

                Debug.WriteLine($"Item found: Barcode={itemBarcode.Barcode}, Name={itemName}, UnitDesc={unitDesc}");
            }

            return itemBarcode;
        }

        public async Task<ItemCard> GetItemDetails(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            Debug.WriteLine($"ItemCard barcode: {barcode}");

            var items = await _itemCardEntity.GetItemsByBarcode(barcode);


            if (items == null || items.Count == 0)
            {
                Debug.WriteLine($"No item found for barcode: {barcode}");
                return null;
            }


            var item = items.FirstOrDefault();

            Debug.WriteLine($"Item found: Barcode = {item.ScanningNum}, Name = {item.ItemName}");

            return item;
        }

        public async Task<List<ItemCard>> GetAllItems(int sectionID)
        {
            return await _itemCardEntity.GetAllItemCards(sectionID);
        }


        public void SearchData()
        {
            SearchDate = DateTime.Now.ToString("MMMM dd, yyyy");
            Debug.WriteLine($"{SearchData}");
        }

        public async Task SaveItemCard(string itemName, string barcode, string unitDesc, int quantity, int sectionID, string price,int ItemID,int UnitID)
        {
            Debug.WriteLine($"itemName passed to SaveItemCard: {itemName}, unit: {unitDesc}");

            try
            {

                bool isMergeQuantityChecked = Preferences.Get("MergeQuantityPreference", false);

                if (isMergeQuantityChecked)
                {

                    var existingItem = await _itemCardEntity.GetItemCardByBarcodeAndSection(barcode, sectionID);

                    if (existingItem != null)
                    {

                        existingItem.ItemName = itemName;
                        existingItem.Unit = unitDesc;
                        existingItem.Quantity = quantity;
                        existingItem.Price = price;
                        existingItem.UnitID = UnitID;
                        existingItem.LastUpdate= DateTime.Now;

                        Debug.WriteLine($"Updating existing ItemCard: ItemName={existingItem.ItemName}, Barcode={existingItem.ScanningNum}, Unit={existingItem.Unit}, Quantity={existingItem.Quantity}, SectionID={existingItem.SectionID},UnitID:{existingItem.UnitID}");

                        await _itemCardEntity.UpdateData(existingItem);
                    }
                    else
                    {

                        var itemData = new ItemCard
                        {
                            ItemName = itemName,
                            ScanningNum = barcode,
                            Unit = unitDesc,
                            Quantity = quantity,
                            SectionID = sectionID,
                            Price = price,
                            ItemID=ItemID,
                            UnitID=UnitID,
                            LastUpdate=DateTime.Now

                        };

                        Debug.WriteLine($"Adding new ItemCard: ItemName={itemData.ItemName}, Barcode={itemData.ScanningNum}, Unit={itemData.Unit}, Quantity={itemData.Quantity}, SectionID={itemData.SectionID},price={itemData.Price},itemID:{itemData.ItemID},unitID:{itemData.UnitID}");

                        await _itemCardEntity.AddData(itemData);
                    }
                }
                else
                {

                    var itemData = new ItemCard
                    {
                        ItemName = itemName,
                        ScanningNum = barcode,
                        Unit = unitDesc,
                        Quantity = quantity,
                        SectionID = sectionID,
                        Price = price,
                        ItemID=ItemID,
                        UnitID=UnitID

                    };

                    Debug.WriteLine($"Adding new ItemCard: ItemName={itemData.ItemName}, Barcode={itemData.ScanningNum}, Unit={itemData.Unit}, Quantity={itemData.Quantity}, SectionID={itemData.SectionID},price={itemData.Price},itemID:{itemData.ItemID},unitID:{itemData.UnitID}");

                    await _itemCardEntity.AddData(itemData);
                }
            }
            catch (DbUpdateException dbEx)
            {
                Debug.WriteLine($"Database update error: {dbEx.InnerException?.Message}");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"An error occurred: {ex.Message}");
            }
        }

        public async Task<bool> SaveExportData(int sectionID)
        {
            try
            {
                var (sectionName, rakName, itemCards) = await _sectionEntity.GetSectionRakDetailsBySectionID(sectionID);

                var rakNameExists = await _exportedRakEntity.RakNameExists(rakName);
                var sectionNameExists = await _exportedSectionEntity.SectionNameExists(sectionName);

              

                if (rakNameExists)
                {
                    var existingSectionID = await _exportedSectionEntity.GetSectionIdByName(sectionName);

                    if (sectionNameExists && existingSectionID.HasValue && itemCards != null && itemCards.Any())
                    {
                        foreach (var itemCard in itemCards)
                        {
                            var existingCard = await _exportedCardEntity.GetItemByScanningNum(itemCard.ScanningNum);

                            if (existingCard != null)
                            {
                                // Update existing card
                                existingCard.Quantity += itemCard.Quantity;
                                existingCard.ItemName = itemCard.ItemName;
                                existingCard.UnitID = itemCard.UnitID ?? 0;
                                existingCard.Price = itemCard.Price;

                                await _exportedCardEntity.UpdateData(existingCard);
                                Debug.WriteLine($"Updated existing card: ScanningNum={itemCard.ScanningNum}, Quantity={existingCard.Quantity}");
                            }
                            else
                            {
                                // If the card does not exist, create a new one
                                var exportedCard = new ExportedCard
                                {
                                    ScanningNum = itemCard.ScanningNum,
                                    ItemName = itemCard.ItemName,
                                    Quantity = itemCard.Quantity,
                                    UnitID=itemCard.UnitID ?? 0,
                                    Price=itemCard.Price,     
                                    ItemID=itemCard.ItemID.ToString(),
                                    SectionID = existingSectionID.Value
                                };

                                await _exportedCardEntity.AddData(exportedCard);
                                Debug.WriteLine($"Saved new card: ScanningNum={itemCard.ScanningNum}, ItemName={itemCard.ItemName}, Quantity={itemCard.Quantity}, Unit={itemCard.Unit}, SectionID={existingSectionID.Value},unitID:{itemCard.UnitID}");
                            }
                        }
                    }
                    else if (!sectionNameExists)
                    {
                        var rakID = await _exportedRakEntity.GetIdByRakName(rakName);
                        Debug.WriteLine($"The RakID that will be inserted in ExportedSection: RakID={rakID}");

                        var exportSection = new ExportedSection
                        {
                            ExportedSectionName = sectionName,
                            ExportedakID = rakID.Value
                        };

                        await _exportedSectionEntity.AddData(exportSection);
                        Debug.WriteLine($"Data saved in ExportedSection with: SectionName={sectionName}, RakID={rakID}");

                        var exportedSectionID = await _exportedSectionEntity.GetSectionIdByName(sectionName);
                        Debug.WriteLine($"The received SectionID: {exportedSectionID}");

                        if (itemCards != null && itemCards.Any())
                        {
                            foreach (var itemCard in itemCards)
                            {
                                var exportedCard = new ExportedCard
                                {
                                    ScanningNum = itemCard.ScanningNum,
                                    ItemName = itemCard.ItemName,
                                    Quantity = itemCard.Quantity,
                                    UnitID=itemCard.UnitID ?? 0,
                                    Price=itemCard.Price,
                                    ItemID=itemCard.ItemID.ToString(),
                                    SectionID = exportedSectionID.Value
                                };

                                await _exportedCardEntity.AddData(exportedCard);
                                Debug.WriteLine($"The saved data in ExportedCard: ScanningNum={itemCard.ScanningNum}, ItemName={itemCard.ItemName}, Quantity={itemCard.Quantity}, Unit={itemCard.Unit}, SectionID={exportedSectionID.Value},untiID:{itemCard.UnitID}");
                            }
                        }
                    }
                }
                else
                {
                    var exportRak = new ExportedRak
                    {
                        ExportedRakName = rakName,
                    };
                    await _exportedRakEntity.AddData(exportRak);
                    Debug.WriteLine($"Data saved in export: ExportedRakName={rakName}");

                    var rakID = await _exportedRakEntity.GetIdByRakName(rakName);
                    Debug.WriteLine($"The RakID that will be inserted in ExportedSection: RakID={rakID}");

                    var exportSection = new ExportedSection
                    {
                        ExportedSectionName = sectionName,
                        ExportedakID = rakID.Value
                    };

                    await _exportedSectionEntity.AddData(exportSection);
                    Debug.WriteLine($"Data saved in ExportedSection with: SectionName={sectionName}, RakID={rakID}");

                    var exportedSectionID = await _exportedSectionEntity.GetSectionIdByName(sectionName);
                    Debug.WriteLine($"The received SectionID: {exportedSectionID}");

                    if (itemCards != null && itemCards.Any())
                    {
                        foreach (var itemCard in itemCards)
                        {
                            var exportedCard = new ExportedCard
                            {
                                ScanningNum = itemCard.ScanningNum,
                                ItemName = itemCard.ItemName,
                                Quantity = itemCard.Quantity,
                                UnitID=itemCard.UnitID ?? 0,
                                Price=itemCard.Price,
                                ItemID=itemCard.ItemID.ToString(),
                                SectionID = exportedSectionID.Value
                            };

                            await _exportedCardEntity.AddData(exportedCard);
                            Debug.WriteLine($"The saved data in ExportedCard: ScanningNum={itemCard.ScanningNum}, ItemName={itemCard.ItemName}, Quantity={itemCard.Quantity}, Unit={itemCard.Unit}, SectionID={exportedSectionID.Value},unitID:{itemCard.UnitID}");
                        }
                    }
                }

               
                return true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in SaveExportData for SectionID {sectionID}: {ex.Message}");
              
                return false;
            }
        }





        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }




    }
}