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
    public class InventoryViewModel: INotifyPropertyChanged
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
            
            itemCardsInventoryEntity =new ItemCardsInventoryEntity();
            SectionID = sectionId;
            sectionInventoryEntity = new SectionInventoryEntity();
            exportedRakInventoryEntity = new ExportedRakInventoryEntity();
            exportedSectionInventoryEntity = new ExportedSectionInventoryEntity();
            exportedItemCardInventory = new ExportedCardsInventoryEntity();
            rakInventoryEntity = new RakInventoryEntity();
          






        }


        public async Task LoadCards(int SectionID)
        {
            try
            {
                Debug.WriteLine($"Starting LoadCards for SectionID: {SectionID}");

                var items = await itemCardsInventoryEntity.GetAllItemCards(SectionID);
                Debug.WriteLine($"Retrieved {items?.Count ?? 0} items from database");

                ItemCards = new ObservableCollection<ItemCardsInventory>(items);
                Debug.WriteLine($"ItemCards collection set with {ItemCards.Count} items");

                OnPropertyChanged(nameof(ItemCards));
                Debug.WriteLine("Property change notification sent for ItemCards");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error loading cards: {ex}");
            }
        }




        public async Task LoadSingleItem(int itemId)
        {
            try
            {
                Debug.WriteLine($"Loading single item with ID: {itemId}");

             
                var updatedItem = await itemCardsInventoryEntity.GetItemById(itemId);

                if (updatedItem != null)
                {
                    await MainThread.InvokeOnMainThreadAsync(() => {
                     
                        var existingItemIndex = -1;
                        for (int i = 0; i < ItemCards.Count; i++)
                        {
                            if (ItemCards[i].ID == itemId)
                            {
                                existingItemIndex = i;
                                break;
                            }
                        }

                        if (existingItemIndex != -1)
                        {
                         
                            ItemCards.RemoveAt(existingItemIndex);
                            ItemCards.Insert(existingItemIndex, updatedItem);

                            Debug.WriteLine($"Updated item at index {existingItemIndex} with quantity {updatedItem.Quantity}");
                        }
                        else
                        {
                            ItemCards.Add(updatedItem);
                            Debug.WriteLine($"Added new item with ID {itemId} and quantity {updatedItem.Quantity}");
                        }
                    });
                }
                else
                {
                    Debug.WriteLine($"Item {itemId} not found in database");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error loading single item: {ex}");
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
                                    if (result is int quantityToAdd) 
                                    {
                                       
                                        await LoadCards(SectionID);
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
                                    await mainPage.ShowPopupAsync(popup);
                                }
                                await LoadCards(SectionID);
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
                                await LoadCards(SectionID);
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
                                await itemCardsInventoryEntity.AddData(newItem);
                                await LoadCards(SectionID);
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

                                if (result is int newQuantity)
                                {
                                    await LoadCards(SectionID);
                                    Debug.WriteLine("Cards reloaded after popup operation");
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
                            await itemCardsInventoryEntity.AddData(newItem);
                            Debug.WriteLine("New item added to the database");

                            await LoadCards(SectionID);
                            BarcodeText = string.Empty;
                            Debug.WriteLine("Cards reloaded after adding new item");
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
                Debug.WriteLine($"the rakname that will be inserted:{rakName}");

                var rakNameExists = await rakInventoryEntity.RakNameExists(rakName);
                var sectionNameExists = await exportedSectionInventoryEntity.SectionNameExists(sectionName);

              
                    var exportRak = new ExportedRakInventory
                    {
                        ExportedRakName = rakName
                    };
                    await exportedRakInventoryEntity.AddData(exportRak);
                    Debug.WriteLine($"Data saved in export: ExportedRakName={rakName}");

                    var rakID = await exportedRakInventoryEntity.GetIdByRakName(rakName);
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
                            Debug.WriteLine($"The saved data in ExportedCard: ScanningNum={itemCard.ScanningNum},  Quantity={itemCard.Quantity},  SectionID={exportedSectionID.Value}");
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

        public async Task<bool> DeletedCard(int ID,int SectionID)
        {
            await itemCardsInventoryEntity.DeleteCard(ID,SectionID);
            return true;
        }




        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
