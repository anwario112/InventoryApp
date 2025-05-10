using CommunityToolkit.Maui.Views;
using Microsoft.EntityFrameworkCore;
using store.Data;
using store.Models;
using store.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.ViewModels
{
    public class InventoryViewModel : INotifyPropertyChanged
    {
        private readonly SectionInventoryEntity sectionInventoryEntity;
        private readonly RakInventoryEntity rakInventoryEntity;
        private readonly ExportedRakInventoryEntity exportedRakInventoryEntity;
        private readonly ExportedSectionInventoryEntity exportedSectionInventoryEntity;
        private readonly ExportedCardsInventoryEntity exportedItemCardInventory;


        private CancellationTokenSource _debounceTokenSource;

        private string _barcodeText;

        public string BarcodeText
        {
            get => _barcodeText;
            set
            {
                if (_barcodeText != value)
                {
                    _barcodeText = value;
                    OnPropertyChanged(nameof(BarcodeText));


                    _debounceTokenSource?.Cancel();


                    _debounceTokenSource = new CancellationTokenSource();
                    var token = _debounceTokenSource.Token;

                    Task.Run(async () =>
                    {
                        try
                        {

                            await Task.Delay(1000, token);


                            if (!token.IsCancellationRequested && !string.IsNullOrEmpty(_barcodeText))
                            {
                                await MainThread.InvokeOnMainThreadAsync(() =>
                                    ShowQuantityPopup(_barcodeText));
                            }
                        }
                        catch (TaskCanceledException)
                        {

                        }
                    });
                }
            }
        }


        private ObservableCollection<ItemCardsInventory> _ItemCards;
        public ObservableCollection<ItemCardsInventory> ItemCards
        {
            get => _ItemCards;
            set
            {
                _ItemCards = value;
                OnPropertyChanged(nameof(ItemCards));
            }
        }

        public int SectionID { get; set; }

        private readonly ItemCardsInventoryEntity itemCardsInventoryEntity;
        public InventoryViewModel(int sectionId)
        {

            itemCardsInventoryEntity = new ItemCardsInventoryEntity();
            SectionID = sectionId;
            sectionInventoryEntity = new SectionInventoryEntity();
            exportedRakInventoryEntity = new ExportedRakInventoryEntity();
            exportedSectionInventoryEntity = new ExportedSectionInventoryEntity();
            exportedItemCardInventory = new ExportedCardsInventoryEntity();
            rakInventoryEntity = new RakInventoryEntity();


            ItemCards = new ObservableCollection<ItemCardsInventory>();

            MessagingCenter.Subscribe<QuantityInventoryPopupViewModel, ItemCardsInventory>(this, "ItemUpdated", (sender, item) =>
            {
                if (item.SectionID == SectionID)
                {

                    var existingItem = ItemCards.FirstOrDefault(i => i.ID == item.ID);
                    if (existingItem != null)
                    {
                        int index = ItemCards.IndexOf(existingItem);
                        ItemCards[index] = item;
                    }
                    else
                    {
                        ItemCards.Insert(0, item);
                    }
                }
            });
        }

        public async Task LoadCards(int SectionID)
        {
            var stopwatch = Stopwatch.StartNew();
            try
            {
                Debug.WriteLine($"Starting LoadCards for SectionID: {SectionID}");

               
                var firstBatchSize = 7;
                var firstItems = await itemCardsInventoryEntity.GetItemCardsBySectionID(SectionID, 1, firstBatchSize);
                ItemCards = new ObservableCollection<ItemCardsInventory>(firstItems);
                OnPropertyChanged(nameof(ItemCards));

                Debug.WriteLine($"First batch of items loaded in {stopwatch.ElapsedMilliseconds}ms");

            
                var batchSize = 10;
                var page = 2;

                await Task.Run(async () =>
                {
                    while (true)
                    {
                        var items = await itemCardsInventoryEntity.GetItemCardsBySectionID(SectionID, page, batchSize);
                        if (items.Count == 0)
                        {
                            break; 
                        }

                        foreach (var item in items)
                        {
                            Device.BeginInvokeOnMainThread(() =>
                            {
                                ItemCards.Add(item);
                            });
                        }

                        page++;
                        await Task.Delay(100); 
                    }
                });

                Debug.WriteLine($"All items loaded in {stopwatch.ElapsedMilliseconds}ms");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error loading cards: {ex}");
            }
            finally
            {
                stopwatch.Stop();
                Debug.WriteLine($"Total LoadCards execution: {stopwatch.ElapsedMilliseconds}ms");
            }
        }






        public void ShowQuantityPopup(string barcode)
        {
            bool isMergeQuantityChecked = Preferences.Get("MergeQuantityPreference", false);
            bool isQuantityPopupChecked = Preferences.Get("QuantityPopupPreference", false);

            MainThread.BeginInvokeOnMainThread(async () =>
            {
                try
                {
                    var existingItems = await itemCardsInventoryEntity.GetItemsByBarcode(barcode, SectionID);
                    var existingItem = existingItems.FirstOrDefault();

                    if (isMergeQuantityChecked)
                    {
                        if (isQuantityPopupChecked)
                        {
                            if (existingItem != null)
                            {
                                var popup = new QuantityInventoryPopup(
                                    QuantityInventoryPopup.InputType.Inventory,
                                    SectionID,
                                    barcode,
                                    existingItem.ID,
                                    existingItem.Quantity);

                                if (Application.Current?.MainPage is Page mainPage)
                                {
                                    var result = await mainPage.ShowPopupAsync(popup);
                                    if (result is float quantityToAdd)
                                    {

                                        var updatedItem = await itemCardsInventoryEntity.GetItemById(existingItem.ID);
                                        var itemInCollection = ItemCards.FirstOrDefault(i => i.ID == existingItem.ID);
                                        if (itemInCollection != null && updatedItem != null)
                                        {
                                            int index = ItemCards.IndexOf(itemInCollection);
                                            ItemCards[index] = updatedItem;
                                        }
                                        BarcodeText = string.Empty;
                                    }
                                }
                            }
                            else
                            {
                                var popup = new QuantityInventoryPopup(
                                    QuantityInventoryPopup.InputType.Inventory,
                                    SectionID,
                                    barcode);

                                if (Application.Current?.MainPage is Page mainPage)
                                {
                                    var result = await mainPage.ShowPopupAsync(popup);
                                    if (result is float quantity)
                                    {

                                        var newItems = await itemCardsInventoryEntity.GetItemsByBarcode(barcode, SectionID);
                                        var newItem = newItems.FirstOrDefault();
                                        if (newItem != null && !ItemCards.Any(i => i.ID == newItem.ID))
                                        {
                                            ItemCards.Insert(0, newItem);
                                        }
                                    }
                                }
                                BarcodeText = string.Empty;
                            }
                        }
                        else
                        {
                            if (existingItem != null)
                            {
                                existingItem.Quantity += 1;
                                existingItem.LastUpdate = DateTime.Now;
                                await itemCardsInventoryEntity.UpdateData(existingItem, existingItem.ID);


                                var itemInCollection = ItemCards.FirstOrDefault(i => i.ID == existingItem.ID);
                                if (itemInCollection != null)
                                {
                                    int index = ItemCards.IndexOf(itemInCollection);
                                    ItemCards[index] = existingItem;
                                }
                                BarcodeText = string.Empty;
                            }
                            else
                            {
                                var newItem = new ItemCardsInventory
                                {
                                    ScanningNum = barcode,
                                    Quantity = 1,
                                    SectionID = SectionID,
                                    LastUpdate = DateTime.Now
                                };


                                int newItemId = await itemCardsInventoryEntity.AddData(newItem);
                                newItem.ID = newItemId;

                                ItemCards.Insert(0, newItem);
                                BarcodeText = string.Empty;
                            }
                        }
                    }
                    if (!isMergeQuantityChecked)
                    {
                        if (isQuantityPopupChecked)
                        {
                            var popup = new QuantityInventoryPopup(
                                QuantityInventoryPopup.InputType.Inventory,
                                SectionID,
                                barcode);

                            if (Application.Current?.MainPage is Page mainPage)
                            {
                                Debug.WriteLine("Showing QuantityInventoryPopup");
                                var result = await mainPage.ShowPopupAsync(popup);
                                Debug.WriteLine($"Popup result received: {result}");

                                if (result is float newQuantity)
                                {

                                    var newItems = await itemCardsInventoryEntity.GetItemsByBarcode(barcode, SectionID);
                                    var newItem = newItems.OrderByDescending(i => i.ID).FirstOrDefault();
                                    if (newItem != null && !ItemCards.Any(i => i.ID == newItem.ID))
                                    {
                                        ItemCards.Insert(0, newItem);
                                    }
                                    BarcodeText = string.Empty;
                                }
                            }
                        }
                        else
                        {
                            Debug.WriteLine("Creating new item with default quantity 1");
                            var newItem = new ItemCardsInventory
                            {
                                ScanningNum = barcode,
                                Quantity = 1,
                                SectionID = SectionID,
                                LastUpdate = DateTime.Now
                            };


                            int newItemId = await itemCardsInventoryEntity.AddData(newItem);
                            newItem.ID = newItemId;


                            ItemCards.Insert(0, newItem);
                            BarcodeText = string.Empty;
                            Debug.WriteLine("New item added to the collection");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Debug.WriteLine($"Error in ShowQuantityPopup: {ex.Message}");
                    await Application.Current?.MainPage?.DisplayAlert("Error", "Failed to process barcode", "OK");
                }
            });
        }

        public async Task<bool> SaveItems(int sectionID)
        {
            try
            {
                var sectionDetails = await sectionInventoryEntity.GetSectionRakDetailsBySectionID(sectionID);
                string sectionName = sectionDetails.sectionName;
                string rakName = sectionDetails.rakName;
                List<ItemCardsInventory> ItemCardsInventory = sectionDetails.itemCardsInventory;
                Debug.WriteLine($"The rakname that will be processed: {rakName}");


                var sectionNameExists = await exportedSectionInventoryEntity.SectionNameExists(sectionName);

                if (sectionNameExists)
                {

                    var exportedSectionID = await exportedSectionInventoryEntity.GetSectionIdByName(sectionName);
                    Debug.WriteLine($"Section already exists with ID: {exportedSectionID}");

                    if (exportedSectionID.HasValue)
                    {

                        await exportedItemCardInventory.DeleteCardsBySectionID(exportedSectionID.Value);
                        Debug.WriteLine($"Deleted existing cards for SectionID: {exportedSectionID.Value}");


                        if (ItemCardsInventory != null && ItemCardsInventory.Any())
                        {
                            foreach (var itemCard in ItemCardsInventory)
                            {
                                var exportedCard = new ExportedItemCardInventory
                                {
                                    ScanningNum = itemCard.ScanningNum,
                                    Quantity = itemCard.Quantity,
                                    SectionID = exportedSectionID.Value
                                };

                                await exportedItemCardInventory.AddData(exportedCard);
                                Debug.WriteLine($"Updated card in ExportedItemCardInventory: ScanningNum={itemCard.ScanningNum}, Quantity={itemCard.Quantity}, SectionID={exportedSectionID.Value}");
                            }
                        }
                    }
                }
                else
                {

                    Debug.WriteLine("Section doesn't exist, creating new entries");


                    var rakNameExists = await rakInventoryEntity.RakNameExists(rakName);
                    var rakID = await exportedRakInventoryEntity.GetIdByRakName(rakName);

                    if (!rakID.HasValue)
                    {
                        var exportRak = new ExportedRakInventory
                        {
                            ExportedRakName = rakName
                        };
                        await exportedRakInventoryEntity.AddData(exportRak);
                        Debug.WriteLine($"Data saved in export: ExportedRakName={rakName}");


                        rakID = await exportedRakInventoryEntity.GetIdByRakName(rakName);
                    }

                    Debug.WriteLine($"The RakID that will be inserted in ExportedSection: RakID={rakID}");


                    var exportSection = new ExportedSectionInventory
                    {
                        ExportedSectionName = sectionName,
                        ExportedakID = rakID.Value
                    };

                    await exportedSectionInventoryEntity.AddData(exportSection);
                    Debug.WriteLine($"Data saved in ExportedSection with: SectionName={sectionName}, RakID={rakID}");

                    var exportedSectionID = await exportedSectionInventoryEntity.GetSectionIdByName(sectionName);
                    Debug.WriteLine($"The received SectionID: {exportedSectionID}");


                    if (ItemCardsInventory != null && ItemCardsInventory.Any())
                    {
                        foreach (var itemCard in ItemCardsInventory)
                        {
                            var exportedCard = new ExportedItemCardInventory
                            {
                                ScanningNum = itemCard.ScanningNum,
                                Quantity = itemCard.Quantity,
                                SectionID = exportedSectionID.Value
                            };

                            await exportedItemCardInventory.AddData(exportedCard);
                            Debug.WriteLine($"The saved data in ExportedCard: ScanningNum={itemCard.ScanningNum}, Quantity={itemCard.Quantity}, SectionID={exportedSectionID.Value}");
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
        public async Task<bool> DeletedCard(int ID, int SectionID)
        {
            await itemCardsInventoryEntity.DeleteCard(ID, SectionID);


            var itemToRemove = ItemCards.FirstOrDefault(i => i.ID == ID);
            if (itemToRemove != null)
            {
                ItemCards.Remove(itemToRemove);
            }
            return true;
        }




        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}