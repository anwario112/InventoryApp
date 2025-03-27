using CommunityToolkit.Maui.Alerts;
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
using ZXing.Net.Maui;
using ZXing.Net.Maui.Controls;
using ZXing.QrCode.Internal;
using CommunityToolkit.Maui.Core;
using System.IO.Pipelines;
using System.ComponentModel;
using store.View;
using System.Windows.Input;

namespace store.ViewModels
{
    public class TransferDataViewModel : INotifyPropertyChanged
    {
        private readonly DBContext db;
        private readonly ItemCardEntity itemCardEntity;
        private readonly InsertDataApi _insertDataApi;
        private readonly ItemArchiveEntity _itemArchiveEntity;
        private CancellationTokenSource _cancellationTokenSource;
        private readonly ItemBarcodeEntity _itemBarcode;
        private readonly ItemFileEntity itemFileEntity;

        private int sectionID;


        private QuantityPopup quantityPopup;
        private SettingsClearData viewModel;

        private string _barcodeText;
        public string BarcodeText
        {
            get => _barcodeText;
            set
            {
                _barcodeText = value;
                OnPropertyChanged(nameof(BarcodeText));
            }
        }

        private bool _isErrorMessageVisible;
        public bool IsErrorMessageVisible
        {
            get => _isErrorMessageVisible;
            set
            {
                _isErrorMessageVisible = value;
                OnPropertyChanged(nameof(IsErrorMessageVisible));
            }
        }

        private string _errorMessageText;
        public string ErrorMessageText
        {
            get => _errorMessageText;
            set
            {
                _errorMessageText = value;
                OnPropertyChanged(nameof(ErrorMessageText));
            }
        }



        private ObservableCollection<Models.ItemCard> _itemCards;
        public ObservableCollection<Models.ItemCard> ItemCards
        {
            get => _itemCards;
            set
            {
                _itemCards = value;
                OnPropertyChanged(nameof(ItemCards));
            }
        }



        public ICommand ClearDataCommand { get; }
        public ICommand SaveDataCommand { get; }
        public ICommand OnCameraImageTappedCommand { get; }
        public ICommand OnExitImageTappedCommand { get; }


        public TransferDataViewModel(int SectionID, string apiKey = "12345-ABCDE-67890-FGHIJ", string secretKey = "S3cr3tK3y!@#2023")
        {
            var httpHelper = new HttpHelper(apiKey, secretKey);

            db = new DBContext();
            itemCardEntity = new ItemCardEntity();
            _itemBarcode = new ItemBarcodeEntity();
            _itemArchiveEntity = new ItemArchiveEntity();
            itemFileEntity = new ItemFileEntity();

            _insertDataApi = new InsertDataApi(httpHelper);
            sectionID = SectionID;
            viewModel = new SettingsClearData();

            ItemCards = new ObservableCollection<Models.ItemCard>();






            ClearDataCommand = new Command(async () => await TapGestureRecognizer_Tapped());
            SaveDataCommand = new Command(async () => await SaveData());
            OnCameraImageTappedCommand = new Command(async () => await OnCameraImageTapped());



            OnExitImageTappedCommand = new Command<int>(async (id) => await OnExitImageTapped(id));

            MessagingCenter.Subscribe<ChangeToItemNum, int>(this, "ItemCardUpdated", async (sender, id) =>
            {
                Debug.WriteLine($"Received ItemCardUpdated message for ID: {id}");
                await LoadItems(); 
            });
            MessagingCenter.Subscribe<PackingPopupFunction>(this, "ItemsUpdated", async (sender) =>
            {

                await LoadItems();
            });

            MessagingCenter.Subscribe<EditQuantityPopup, int>(this, "QuantityUpdated", async (sender, id) =>
            {
                Debug.WriteLine($"Received QuantityUpdated message for ID: {id}");
                await LoadItems();
            });
            MessagingCenter.Subscribe<SettingsClearData, int>(this, "DataCleared", async (sender, sectionId) =>
            {
                if (sectionId == this.sectionID)
                {
                    Debug.WriteLine("DataCleared message received. Reloading items...");
                    await LoadItems();
                }
            });
            LoadItems();
        }

        public async Task OnExitImageTapped(int id)
        {
            try
            {
                Debug.WriteLine($"Attempting to delete ItemCard with ID: {id} for SectionID: {sectionID}");


                await itemCardEntity.DeleteCard(id, sectionID);


                Debug.WriteLine($"Successfully deleted ItemCard with ID: {id}");


                await LoadItems();
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error deleting item card: {ex.Message}");
            }
        }


        public async Task LoadItems()
        {
            Debug.WriteLine("Loading items...");

            var items = await _insertDataApi.GetAllItems(sectionID);
            Debug.WriteLine($"Fetched {items.Count} items from the database.");

            var sortedItems = items.OrderByDescending(x => x.LastUpdate).ToList();
            Debug.WriteLine($"Sorted {sortedItems.Count} items by LastUpdated in descending order.");
           ItemCards = new ObservableCollection<Models.ItemCard>(sortedItems);

            Debug.WriteLine($"Loaded {ItemCards.Count} items into the collection.");
        }
        public async Task Entry_TextChanged(object sender, TextChangedEventArgs e)
        {
            string barcode = e.NewTextValue;
            Debug.WriteLine($"{barcode}");

            _cancellationTokenSource?.Cancel();
            _cancellationTokenSource = new CancellationTokenSource();

            if (string.IsNullOrWhiteSpace(barcode))
                return;

            try
            {
                await Task.Delay(300, _cancellationTokenSource.Token);

                (ItemBarcode itemBarcode, string itemName, string unitDesc, string price) = await _itemBarcode.GetItemByBarcode(barcode);
                if (itemBarcode == null)
                {
                    Debug.WriteLine("Barcode not found in ItemBarcodeEntity. Searching in ItemFileEntity...");
                    (string itemFileBarcode, string itemFileName, string itemFileUnitDesc, string itemPrice) = await itemFileEntity.GetItemByBarcodes(barcode);

                    if (itemFileBarcode == null)
                    {
                        ErrorMessageText = "Barcode not found!";
                        IsErrorMessageVisible = true;
                        BarcodeText = string.Empty;

                        _ = HideErrorMessageAfterDelay(1500);
                        return;
                    }
                    else
                    {
                        itemBarcode = new ItemBarcode { Barcode = itemFileBarcode };
                        itemName = itemFileName;
                        unitDesc = itemFileUnitDesc;
                        price = itemPrice;
                    }
                }

                bool isMergeQuantityChecked = Preferences.Get("MergeQuantityPreference", false);
                bool isQuantityPopupChecked = Preferences.Get("QuantityPopupPreference", false);

                var existingItemCard = ItemCards.FirstOrDefault(ic => ic.ScanningNum == itemBarcode.Barcode);
                Debug.WriteLine($"existingItemCard: {existingItemCard != null}");

                if (isMergeQuantityChecked && existingItemCard != null)
                {
                    if (isQuantityPopupChecked)
                    {
                        var quantityPopup = new QuantityPopup(itemName, itemBarcode.Barcode, unitDesc, sectionID, itemBarcode.ItemID, price);

                        Debug.WriteLine($"The data that will be updated: ItemName: {itemName}, UnitDesc: {unitDesc}, Barcode: {itemBarcode.Barcode}, Price: {price}");
                        quantityPopup.OnQuantitySet = async (newQuantity, itemName, barcode, unitDesc, sectionId, price) =>
                        {
                            if (existingItemCard != null)
                            {
                                int totalQuantity = existingItemCard.Quantity + newQuantity;
                                await _insertDataApi.SaveItemCard(itemName, barcode, unitDesc, totalQuantity, sectionId, price);

                                existingItemCard.Quantity = totalQuantity;
                                existingItemCard.Price = price;

                                OnPropertyChanged(nameof(ItemCards));

                                Debug.WriteLine($"Updated ItemCard: Barcode={barcode}, Name={itemName}, Quantity={totalQuantity}, Unit={unitDesc}, Price={price}");

                                await LoadItems();
                            }
                            else
                            {
                                Debug.WriteLine("existingItemCard is null.");
                            }
                        };
                        await Application.Current.MainPage.ShowPopupAsync(quantityPopup);
                    }
                    else
                    {
                      
                            Debug.WriteLine($" before existingCard");
                            if (existingItemCard != null)
                            {
                                try
                                {
                                    Debug.WriteLine($" before existingCard after");
                                    int totalQuantity = existingItemCard.Quantity + 1;
                                    Debug.WriteLine($" before existingCard after1");

                                    // Handle potential null price
                                    string priceString = existingItemCard.Price?.ToString() ?? "0";

                                    await _insertDataApi.SaveItemCard(existingItemCard.ItemName, existingItemCard.ScanningNum,
                                        existingItemCard.Unit, totalQuantity, sectionID, priceString);
                                    Debug.WriteLine($" before existingCard after2");

                                    existingItemCard.Quantity = totalQuantity;
                                    Debug.WriteLine($" before existingCard after3");

                                    OnPropertyChanged(nameof(ItemCards));
                                    Debug.WriteLine($" before existingCard after4");
                                    Debug.WriteLine($"Updated ItemCard: Barcode={existingItemCard.ScanningNum}, Name={existingItemCard.ItemName}, Quantity={totalQuantity}, Unit={existingItemCard.Unit}, Price={existingItemCard.Price}");

                                    await LoadItems();
                                }
                                catch (Exception ex)
                                {
                                    Debug.WriteLine($"Error updating item quantity: {ex.Message}");
                                    ErrorMessageText = "Error updating item quantity";
                                    IsErrorMessageVisible = true;
                                    _ = HideErrorMessageAfterDelay(1500);
                                }
                            }
                            else
                            {
                                Debug.WriteLine("existingItemCard is null.");
                            }
                       
                    }
                }
                else
                {
                    if (isQuantityPopupChecked)
                    {
                        var quantityPopup = new QuantityPopup(itemName, itemBarcode.Barcode, unitDesc, sectionID, itemBarcode.ItemID, price);

                        Debug.WriteLine($"The data that will be saved: ItemName: {itemName}, UnitDesc: {unitDesc}, Barcode: {itemBarcode.Barcode}, Price: {price}");
                        quantityPopup.OnQuantitySet = async (quantity, itemName, barcode, unitDesc, sectionId, price) =>
                        {
                            Debug.WriteLine($"Saving data: Quantity: {quantity}, Name: {itemName}, Barcode: {barcode}, Unit: {unitDesc}, SectionID: {sectionId}, Price: {price}");
                            await _insertDataApi.SaveItemCard(itemName, barcode, unitDesc, quantity, sectionId, price);
                            var updatedItem = await _insertDataApi.GetItemDetails(barcode);
                            if (updatedItem != null)
                            {
                                var itemCard = new Models.ItemCard
                                {
                                    ID = updatedItem.ID,
                                    ScanningNum = updatedItem.ScanningNum,
                                    ItemName = updatedItem.ItemName,
                                    Quantity = quantity,
                                    Unit = updatedItem.Unit,
                                    Price = price
                                };

                                Debug.WriteLine($"Setting ItemCard: Barcode={updatedItem.ScanningNum}, Name={updatedItem.ItemName}, Quantity={quantity}, Unit={updatedItem.Unit}, Price={price}");
                                ItemCards.Insert(0, itemCard);
                            }

                            await LoadItems();
                        };

                        await Application.Current.MainPage.ShowPopupAsync(quantityPopup);
                    }
                    else
                    {
                        await _insertDataApi.SaveItemCard(itemName, itemBarcode.Barcode, unitDesc, 1, sectionID, price);
                        var updatedItem = await _insertDataApi.GetItemDetails(itemBarcode.Barcode);
                        if (updatedItem != null)
                        {
                            var itemCard = new Models.ItemCard
                            {
                                ID = updatedItem.ID,
                                ScanningNum = updatedItem.ScanningNum,
                                ItemName = updatedItem.ItemName,
                                Quantity = 1,
                                Unit = updatedItem.Unit,
                                Price = price
                            };

                            Debug.WriteLine($"Setting ItemCard: Barcode={updatedItem.ScanningNum}, Name={updatedItem.ItemName}, Quantity=1, Unit={updatedItem.Unit}, Price={price}");
                            ItemCards.Insert(0, itemCard);
                        }


                        await LoadItems();
                    }
                }
                BarcodeText = string.Empty;
            }
            catch (TaskCanceledException)
            {
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error occurred: {ex.Message}");
                ErrorMessageText = "An error occurred while processing the barcode.";
                IsErrorMessageVisible = true;
                BarcodeText = string.Empty;
                _ = HideErrorMessageAfterDelay(1500);
            }
        }
        private async Task HideErrorMessageAfterDelay(int delayMilliseconds)
        {
            await Task.Delay(delayMilliseconds);
            IsErrorMessageVisible = false;
        }

        public async Task TapGestureRecognizer_Tapped()
        {
            try
            {
                var clearDataPopup = new ClearDataPopup(viewModel, "Other", sectionID);
                clearDataPopup.Closed += async (sender, args) =>
                {
                    Debug.WriteLine("ClearDataPopup closed. Reloading items...");
                    await LoadItems();
                };

                await Application.Current.MainPage.ShowPopupAsync(clearDataPopup);
                Debug.WriteLine("ClearDataPopup shown"); ;

            }
            catch (Exception ex)
            {
                Debug.WriteLine($"An error occurred: {ex.Message}");
            }
        }

        public async Task SaveData()
        {
            try
            {
                bool isSaved = await _insertDataApi.SaveExportData(sectionID);

                if (isSaved)
                {
                    var toast = Toast.Make("Data saved successfully!", ToastDuration.Short, 14);
                    await toast.Show();
                }
                else
                {
                    var toast = Toast.Make("Failed to save data.", ToastDuration.Short, 14);
                    await toast.Show();
                }
            }
            catch (Exception ex)
            {
                var toast = Toast.Make($"An error occurred: {ex.Message}", ToastDuration.Short, 14);
                await toast.Show();
            }
        }
        public async Task RefreshAfterCardUpdate()
        {
           
            await LoadItems();
        }
        public async Task OnChangeButtonClicked(Models.ItemCard itemCard)
        {
            try
            {

                Debug.WriteLine("Change button clicked");


                string barcode = itemCard.ScanningNum;
                int id = itemCard.ID;

                Debug.WriteLine($"Barcode: {barcode}, ID: {id}");


                var currentPage = Application.Current.MainPage;


                var changePopup = new ChangePopup(itemCard, this);



                await currentPage.ShowPopupAsync(changePopup);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in Change button click: {ex.Message}");
            }
        }

        public async Task EditClicked(object sender, EventArgs e)
        {
            try
            {
                var button = sender as Button;
                if (button?.BindingContext is Models.ItemCard itemCard)
                {
                    int id = itemCard.ID;

                    var currentPage = Application.Current.MainPage;
                    var editQuantityPopup = new EditQuantityPopup(id);


                    MessagingCenter.Subscribe<EditQuantityPopup, int>(this, "QuantityUpdated", async (sender, updatedId) =>
                    {
                        Debug.WriteLine($"QuantityUpdated message received for ID: {updatedId}");
                        await LoadItems();
                    });


                    await currentPage.ShowPopupAsync(editQuantityPopup);
                }
                else
                {
                    Debug.WriteLine("BindingContext is not an ItemCard object.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in EditClicked: {ex.Message}");
            }
        }

        public async Task PackingButton_Clicked(object sender, EventArgs e)
        {
            try
            {
                Debug.WriteLine("Packing button clicked");

                var button = sender as Button;
                if (button?.BindingContext is Models.ItemCard itemCard)
                {
                    string barcode = itemCard.ScanningNum;
                    int id = itemCard.ID;

                    var currentPage = Application.Current.MainPage;
                    var packingPopup = new PackingPopup(barcode, id);

                    MessagingCenter.Subscribe<PackingPopup>(this, "ItemsUpdated", async (sender) =>
                    {
                        Debug.WriteLine("ItemsUpdated message received. Reloading items...");
                        await LoadItems();
                    });


                    await currentPage.ShowPopupAsync(packingPopup);
                }
                else
                {
                    Debug.WriteLine("BindingContext is not an ItemCard object.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in PackingButton_Clicked: {ex.Message}");
            }
        }






        public async Task OnCameraImageTapped()
        {
            var cameraView = new CameraBarcodeReaderView
            {
                IsDetecting = true,
                Options = new BarcodeReaderOptions
                {
                    Formats = BarcodeFormats.All,
                    AutoRotate = true,
                    Multiple = false
                },
                CameraLocation = CameraLocation.Rear,
                IsTorchOn = false
            };

            var popupPage = new CameraPopupPage(cameraView);

            MessagingCenter.Subscribe<CameraPopupPage, string>(this, "BarcodeScanned", (sender, barcodeValue) =>
            {

                Debug.WriteLine($"Barcode scanned: {barcodeValue}");

                MessagingCenter.Unsubscribe<CameraPopupPage, string>(this, "BarcodeScanned");
            });

            // await Navigation.PushModalAsync(popupPage);
        }


        public void Dispose()
        {

            MessagingCenter.Unsubscribe<PackingPopupFunction>(this, "ItemsUpdated");
            MessagingCenter.Unsubscribe<EditQuantityPopup, int>(this, "QuantityUpdated");
            MessagingCenter.Unsubscribe<ChangeToItemNum, int>(this, "ItemCardUpdated");
        }
        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}


