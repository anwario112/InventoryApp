using store.Data;
using store.Models;
using store.View;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Windows.Input;

namespace store.ViewModels
{
    public class PackingPopupFunction : INotifyPropertyChanged
    {
        private readonly ItemFileEntity _itemFileEntity;
        private List<ItemCheckBox> _barcodeItems;
        private readonly ItemCardEntity _itemCardEntity;
        private int _id;
        private PackingPopup _popup;

        public List<ItemCheckBox> BarcodeItems
        {
            get => _barcodeItems;
            set
            {
                if (_barcodeItems != value)
                {
                    _barcodeItems = value;
                    OnPropertyChanged(nameof(BarcodeItems));
                    OnPropertyChanged(nameof(HasSelectedItems));
                }
            }
        }

        public ICommand UpdateCommand { get; }

        public PackingPopupFunction(int id, PackingPopup popup)
        {
            _itemFileEntity = new ItemFileEntity();
            _itemCardEntity = new ItemCardEntity();
            UpdateCommand = new Command(UpdateSelectedItems);
            _id = id;
            _popup = popup;
        }

        public bool HasSelectedItems => BarcodeItems?.Any(item => item.IsChecked) == true;

        public async void FetchBarcodesByItemNum(string itemNum)

        {

            try

            {

                var items = await _itemFileEntity.GetBarcodesUnitDescsAndPricesByItemNum(itemNum);

                Debug.WriteLine($"Fetched {items.Count} items for item number {itemNum}.");


                BarcodeItems = items.Select(i => new ItemCheckBox(this) 

                {

                    Barcode = i.Barcode,

                    UnitDesc = i.UnitDesc,

                    Price = i.Price

                }).ToList();


                Debug.WriteLine($"Barcodes assigned for item number {itemNum}: {string.Join(", ", BarcodeItems.Select(b => $"{b.Barcode} (Unit: {b.UnitDesc}, Price: {b.Price})"))}");

            }

            catch (Exception ex)

            {

                Debug.WriteLine($"Error fetching barcodes: {ex.Message}");

            }

        }

        public void UncheckOtherItems(ItemCheckBox checkedItem)
        {
            foreach (var item in BarcodeItems)
            {
                if (item != checkedItem)
                {
                    item.IsChecked = false;

                }

            }

        }


        private async void UpdateSelectedItems()
        {
            var selectedItems = BarcodeItems.Where(item => item.IsChecked).ToList();

            if (selectedItems.Any())
            {
                
                var updateTasks = selectedItems.Select(item =>
                {
                    var updatedItemCard = new Models.ItemCard
                    {
                        ScanningNum = item.Barcode, 
                        Unit = item.UnitDesc 
                                             
                    };

                    
                    return _itemCardEntity.UpdateDataCard(updatedItemCard, _id);
                });

           
                await Task.WhenAll(updateTasks);

                Debug.WriteLine($"Updated {selectedItems.Count} ItemCards for ID {_id}.");
                MessagingCenter.Send(this, "ItemCardUpdated", _id);
                _popup.Close();

            }
            else
            {
                Debug.WriteLine("No items selected for update.");
            }
        }


        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}