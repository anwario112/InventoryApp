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

        private readonly DBContext db;

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
        }





        public async Task InsertApiData()
        {
            string url = " https://7962-185-114-88-228.ngrok-free.app/api/items";

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

                List<ApiQueryDTO> queryResults;
                try
                {
                    var wrapper = JsonSerializer.Deserialize<ApiResponseWrapper>(jsonResponse);
                    queryResults = wrapper?.DataQuery1;
                }
                catch (JsonException ex)
                {
                    Debug.WriteLine($"JSON deserialization failed: {ex.Message}");
                    return;
                }

                if (queryResults == null || queryResults.Count == 0)
                {
                    Debug.WriteLine("No data to process.");
                    return;
                }

               

                
                await _itemUnit.ClearData();

                
                var distinctItemFileData = queryResults
                    .DistinctBy(q => q.ItemNum)
                    .Select(q =>
                    {
                        if (!int.TryParse(q.ItemID, out int itemId))
                        {
                            itemId = 0;
                        }

                        if (!double.TryParse(q.Price, out double priceDouble))
                        {
                            priceDouble = 0;
                        }
                        decimal price = (decimal)priceDouble;

                        return new ItemFile
                        {
                            ItemID = itemId,
                            ItemNum = q.ItemNum,
                            ItemName = q.ItemName,
                            Price = price.ToString(),
                            ImageUrl = q.ImageUrl
                        };
                    })
                    .ToList();

             
           

              
                await _itemFile.AddDataRange(distinctItemFileData);
                Debug.WriteLine("Data inserted into ItemFile table successfully.");

               
                var itemBarcodeData = queryResults
                    .Select(q =>
                    {
                        if (!int.TryParse(q.ItemID, out int itemId))
                        {
                            itemId = 0;
                        }

                        if (!double.TryParse(q.BarcodePrice, out double barcodePriceDouble))
                        {
                            barcodePriceDouble = 0;
                        }
                        decimal barcodePrice = (decimal)barcodePriceDouble;

                        return new ItemBarcode
                        {
                            ItemID = itemId,
                            Barcode = q.Barcode,
                            price = barcodePrice,
                            UnitDesc = q.UnitDesc
                        };
                    })
                    .ToList();

              
                await _itemBarcode.AddDataRange(itemBarcodeData);
                Debug.WriteLine("Data inserted into ItemBarcode table successfully.");


                var unitData = queryResults
                .GroupBy(q => new { q.ItemID, q.ItemNumUnit }) 
                .Select(g => g.First()) 
                .Select(q =>
                {
                    int itemId = int.TryParse(q.ItemID, out int parsedId) ? parsedId : 0;
                    string unitDesc = string.IsNullOrEmpty(q.ItemNumUnit) ? "N/A" : q.ItemNumUnit;
                    return new ItemUnit
                    {
                        ItemID = itemId,
                        UnitDesc = unitDesc
                    };
                })
                .ToList();



                await _itemUnit.AddDataRange(unitData);
                Debug.WriteLine("Data inserted into UnitFile table successfully.");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error inserting data: {ex.Message}");
                if (ex.InnerException != null)
                {
                    Debug.WriteLine($"Inner exception: {ex.InnerException.Message}");
                }
            }
        }


        public async Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            Debug.WriteLine($"Scanned barcode: {barcode}");


            var (itemBarcode, itemName, unitDesc) = await _itemBarcode.GetItemByBarcode(barcode);

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

        public async Task SaveItemCard(string itemName, string barcode, string unitDesc, int quantity, int sectionID)
        {
            Debug.WriteLine($"itemName pssed to savedIetmcard:itemName{itemName},unit:{unitDesc}");
            var itemData = new ItemCard
            {
                ItemName = itemName,
                ScanningNum = barcode,
                Unit = unitDesc,
                Quantity = quantity,
                SectionID = sectionID
            };

            Debug.WriteLine($"after itemCard is set:ItemName:{itemData.ItemName},unit:{itemData.Unit}");

            try
            {
                await _itemCardEntity.AddData(itemData);
                Debug.WriteLine($"Item Card is saved successfully:ItemName:{itemData.ItemName},Scanned barcode:{itemData.ScanningNum},Unit:{itemData.Unit},Quantity:{itemData.Quantity},{itemData.SectionID}");
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

        public async Task SaveExportData(int sectionID)
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
                                existingCard.Unit = itemCard.Unit;

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
                                    Unit = itemCard.Unit,
                                    SectionID = existingSectionID.Value
                                };

                                await _exportedCardEntity.AddData(exportedCard);
                                Debug.WriteLine($"Saved new card: ScanningNum={itemCard.ScanningNum}, ItemName={itemCard.ItemName}, Quantity={itemCard.Quantity}, Unit={itemCard.Unit}, SectionID={existingSectionID.Value}");
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
                                    Unit = itemCard.Unit,
                                    SectionID = exportedSectionID.Value
                                };

                                await _exportedCardEntity.AddData(exportedCard);
                                Debug.WriteLine($"The saved data in ExportedCard: ScanningNum={itemCard.ScanningNum}, ItemName={itemCard.ItemName}, Quantity={itemCard.Quantity}, Unit={itemCard.Unit}, SectionID={exportedSectionID.Value}");
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
                                Unit = itemCard.Unit,
                                SectionID = exportedSectionID.Value
                            };

                            await _exportedCardEntity.AddData(exportedCard);
                            Debug.WriteLine($"The saved data in ExportedCard: ScanningNum={itemCard.ScanningNum}, ItemName={itemCard.ItemName}, Quantity={itemCard.Quantity}, Unit={itemCard.Unit}, SectionID={exportedSectionID.Value}");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in SaveExportData for SectionID {sectionID}: {ex.Message}");
            }
        }





        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }




    }
}