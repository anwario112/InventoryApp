using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.Messaging;
using Microsoft.EntityFrameworkCore;
using store.Api;
using store.Data;
using store.Messages;
using store.Models;
using store.Observation;
using store.ViewModels;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Threading;

namespace store.View
{
    public partial class TransferData : ContentPage
    {
        private readonly DBContext db;
       
        private readonly ItemCardEntity itemCardEntity;
        private readonly InsertDataApi _insertDataApi;
        private readonly ItemArchiveEntity _itemArchiveEntity;
        private CancellationTokenSource _cancellationTokenSource;
        private readonly ItemBarcodeEntity _itemBarcode;
        private int sectionID;

        private ObservableCollection<ItemCard> _itemCards = new ObservableCollection<ItemCard>();
        private Dictionary<int, ItemCard> _itemCardsDictionary = new Dictionary<int, ItemCard>();
        private HashSet<int> _existingIds = new HashSet<int>();




        public TransferData(int SectionID)
        {
            InitializeComponent();
            var httpHelper = new HttpHelper();

            db = new DBContext();
          
            itemCardEntity = new ItemCardEntity();
           
            _itemBarcode = new ItemBarcodeEntity();
            _itemArchiveEntity = new ItemArchiveEntity();

            _insertDataApi = new InsertDataApi(httpHelper);
            BindingContext = this;
            sectionID = SectionID;

        }

        public ObservableCollection<ItemCard> ItemCards
        {
            get => _itemCards;
            set
            {
                _itemCards = value;
                OnPropertyChanged(nameof(ItemCards));
            }
        }


        protected override void OnAppearing()
        {
            base.OnAppearing();
            LoadItemCardsAsync();
            Barcode.Focus();
            SubscribeToMessages();



        }


        private void SubscribeToMessages()
        {

            MessagingCenter.Subscribe<ChangePopup, ItemCard>(this, "ItemUpdated", (sender, updatedItemCard) =>
            {
                var existingItemCard = ItemCards.FirstOrDefault(ic => ic.ID == updatedItemCard.ID);
                if (existingItemCard != null)
                {
                    existingItemCard.ItemBarcode = updatedItemCard.ItemBarcode;
                    existingItemCard.Unit = updatedItemCard.Unit;
                }
            });

            MessagingCenter.Subscribe<PackingPopupFunction, int>(this, "ItemCardUpdated", async (sender, id) =>
            {          

                var existingItemCard = ItemCards.FirstOrDefault(ic => ic.ID == id);
                if (existingItemCard != null)
                {
                    ItemCards.Remove(existingItemCard);
                    Debug.WriteLine($"Removed existing ItemCard with ID {id}.");
                }
             

                var updatedItem = await itemCardEntity.GetItemCardById(id); 

                if (updatedItem != null)
                {
                    var newItemCard = new ItemCard
                    {

                        ID = updatedItem.ID,

                        ItemBarcode = updatedItem.ScanningNum,

                        ItemName = updatedItem.ItemName,

                        Quantity = updatedItem.Quantity,

                        Unit = updatedItem.Unit

                    };


                 

                    ItemCards.Add(newItemCard);

                    Debug.WriteLine($"Added updated ItemCard with Barcode: {newItemCard.ItemBarcode}.");

                }

            });


            MessagingCenter.Subscribe<ItemCard, int>(this, "ItemCardDeleted", (sender, id) =>
            {
                var itemCardToRemove = ItemCards.FirstOrDefault(ic => ic.ID == id);
                if (itemCardToRemove != null)
                {
                    ItemCards.Remove(itemCardToRemove);
                    Debug.WriteLine($"ItemCard with ID {id} has been removed from the UI.");
                }

            });


            WeakReferenceMessenger.Default.Register<QuantityUpdatedMessage>(this, (recipient, message) =>
            {
                Debug.WriteLine($"Received QuantityUpdated message with ID: {message.Value.ID}, Quantity: {message.Value.Quantity}");

                var existingItemCard = ItemCards.FirstOrDefault(ic => ic.ID == message.Value.ID);
                if (existingItemCard != null)
                {
                    existingItemCard.Quantity = message.Value.Quantity;
                    Debug.WriteLine($"Quantity for ItemCard with ID {message.Value.ID} has been updated to {message.Value.Quantity}.");
                }
            });
        }
        


        private async void LoadItemCardsAsync()
        {
            await LoadItemCards();
        }

        private async void Entry_TextChanged(object sender, TextChangedEventArgs e)
        {
            string barcode = e.NewTextValue;
            Debug.WriteLine($"{barcode}");

            _cancellationTokenSource?.Cancel();
            _cancellationTokenSource = new CancellationTokenSource();

            if (string.IsNullOrWhiteSpace(barcode))
                return;

            try
            {
                (ItemBarcode itemBarcode, string itemName, string unitDesc) = await _itemBarcode.GetItemByBarcode(barcode);

                if (itemBarcode == null)
                {
                    Debug.WriteLine("No item found for the entered barcode.");
                    return;
                }

                Barcode.Text = string.Empty;
                bool existingItemCard = await itemCardEntity.BarcodeSearch(barcode, sectionID);
                Debug.WriteLine($"existingItemCard: {existingItemCard}");

                if (existingItemCard)
                {
                    Debug.WriteLine($"Updated existing ItemCard");
                }
                else
                {
                    var quantityPopup = new QuantityPopup(itemName, itemBarcode.Barcode, unitDesc, sectionID, itemBarcode.ItemID);

                    Debug.WriteLine($"The data that will be saved: ItemName: {itemName}, UnitDesc: {unitDesc}, Barcode: {itemBarcode.Barcode}");
                    quantityPopup.OnQuantitySet = async (quantity, itemName, barcode, unitDesc, sectionId) =>
                    {
                        Debug.WriteLine($"saving data:quantity:{quantity},Name:{itemName},barcode:{barcode},unit:{unitDesc},sectionID:{sectionId}");
                        await _insertDataApi.SaveItemCard(itemName, barcode, unitDesc, quantity, sectionId);
                        var updatedItem = await _insertDataApi.GetItemDetails(barcode);
                        if (updatedItem != null)
                        {
                            var itemCard = new ItemCard
                            {
                                ID = updatedItem.ID,
                                ItemBarcode = updatedItem.ScanningNum,
                                ItemName = updatedItem.ItemName,
                                Quantity = quantity,
                                Unit = updatedItem.Unit
                            };

                            Debug.WriteLine($"Setting ItemCard: Barcode={updatedItem.ScanningNum}, Name={updatedItem.ItemName}, Quantity={quantity}, Unit={updatedItem.Unit}");

                            ItemCards.Add(itemCard);
                        }
                    };

                    this.ShowPopup(quantityPopup);
                }
            }
            catch (TaskCanceledException)
            {
                
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error occurred: {ex.Message}");
            }
        }





        private async Task LoadItemCards()
        {
            try
            {
                var items = await Task.Run(() => _insertDataApi.GetAllItems(sectionID));
                Debug.WriteLine($"Loaded {items.Count} items from the database.");

                foreach (var item in items)
                {
                    if (_itemCardsDictionary.TryGetValue(item.ID, out var existingCard))
                    {
                        // Update the existing card
                        existingCard.ItemBarcode = item.ScanningNum;
                        existingCard.ItemName = item.ItemName;
                        existingCard.Quantity = item.Quantity;
                        existingCard.Unit = item.Unit;
                    }
                    else if (!_existingIds.Contains(item.ID))
                    {
                        // Add the new card
                        var newCard = new ItemCard
                        {
                            ID = item.ID,
                            ItemBarcode = item.ScanningNum,
                            ItemName = item.ItemName,
                            Quantity = item.Quantity,
                            Unit = item.Unit
                        };

                        ItemCards.Add(newCard);
                        _itemCardsDictionary[item.ID] = newCard;
                        _existingIds.Add(item.ID);
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error loading item cards: {ex.Message}");
            }
        }
        private void ItemCard_ItemUpdated(object sender, EventArgs e)
        {
            LoadItemCardsAsync();
        }



        private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {
            try
            {
                // Fetch item cards by section ID
                var itemCards = await itemCardEntity.GetItemCardsBySectionID(sectionID);

                if (itemCards != null && itemCards.Any())
                {
                   
                    var itemArchives = new List<ItemArchive>();

                    foreach (var card in itemCards)
                    {
                        
                        var itemArchive = new ItemArchive
                        {
                            ScanningNum = card.ScanningNum,
                            ItemName = card.ItemName,
                            Quantity = card.Quantity,
                            Unit = card.Unit,
                            SectionID = card.SectionID
                        };

                      
                        itemArchives.Add(itemArchive);
                    }

                    
                    await _itemArchiveEntity.AddDataRange(itemArchives);
                    Debug.WriteLine("Item cards archived successfully.");

                    await itemCardEntity.DeleteData(sectionID);

                     LoadItemCardsAsync();
                   
                }
                else
                {
                    Debug.WriteLine("No item cards found to archive.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"An error occurred: {ex.Message}");
            }
        }
        private async void SaveData(object sender, TappedEventArgs e)
        {
            await _insertDataApi.SaveExportData(sectionID);
        }
    }
}
