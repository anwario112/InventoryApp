
using Microsoft.EntityFrameworkCore;
using store.Api;
using store.Data;
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
        }





        public async Task InsertApiData()
        {
            string url = "https://33fa-213-204-95-59.ngrok-free.app/api/items";

            try
            {
                var response = await _httpHelper.GetResponse(url).ConfigureAwait(false);
                Debug.WriteLine($"Raw API Response: {response}");

                if (!string.IsNullOrEmpty(response))
                {
                    await InsertDataToDatabase(response);
                }
                else
                {
                    Debug.WriteLine("Data not found");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching data from API: {ex}");
            }
        }


        private async Task InsertDataToDatabase(string jsonResponse)
        {
            try
            {

                var data = JsonSerializer.Deserialize<Dictionary<string, List<object>>>(jsonResponse);
                if (data == null)
                {
                    Debug.WriteLine("No data to process.");
                    return;
                }


                await _itemUnit.ClearData();
                Debug.WriteLine("Item data cleared.");


                if (data.ContainsKey("data_query1"))
                {
                    var options = new JsonSerializerOptions
                    {

                        Converters = { new IntConverter() }

                    };
                    var items = JsonSerializer.Deserialize<List<ItemFile>>(JsonSerializer.Serialize(data["data_query1"]));
                    if (items != null && items.Count > 0)
                    {
                        await _itemFile.AddDataRange(items);
                        Debug.WriteLine("Data from query1 inserted into ItemFile table successfully.");
                    }
                    else
                    {
                        Debug.WriteLine("No items to insert from query1.");
                    }
                }
               

                if (data.ContainsKey("data_query2"))
                {
                    var options = new JsonSerializerOptions
                    {
                        Converters = { new IntConverter() }

                    };
                    var unitItems = JsonSerializer.Deserialize<List<ItemBarcode>>(JsonSerializer.Serialize(data["data_query2"]));
                    if (unitItems != null && unitItems.Count > 0)
                    {
                        await _itemBarcode.AddDataRange(unitItems);
                        Debug.WriteLine("Data from query2 inserted into ItemBarcode table successfully.");
                    }
                    else
                    {
                        Debug.WriteLine("No unit items to insert from query2.");
                    }
                }

                if (data.ContainsKey("data_query3"))
                {
                    var options = new JsonSerializerOptions
                    {
                        Converters = { new IntConverter() }

                    };
                    var unitItems = JsonSerializer.Deserialize<List<ItemUnit>>(JsonSerializer.Serialize(data["data_query2"]));
                    if (unitItems != null && unitItems.Count > 0)
                    {
                        await _itemUnit.AddDataRange(unitItems);
                        Debug.WriteLine("Data from query3 inserted into UnitItem table successfully.");
                    }
                    else
                    {
                        Debug.WriteLine("No unit items to insert from query2.");
                    }
                }
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
                    // RakName exists
                    var existingSectionID = await _exportedSectionEntity.GetSectionIdByName(sectionName);

                    if (sectionNameExists && existingSectionID.HasValue && itemCards != null && itemCards.Any())
                    {
                        // Both RakName and SectionName exist, update the item cards
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
                        // SectionName does not exist, create a new section and insert item cards
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
