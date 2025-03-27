using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace store.ViewModels
{
    public class ChangeToItemNum : INotifyPropertyChanged
    {
        private readonly ItemBarcodeEntity _itemBarcodeEntity;
        private readonly ItemUnitEntity _itemUnitEntity;
        private readonly ItemFileEntity _itemFileEntity;
        private readonly ItemCardEntity _itemCardEntity;
        private readonly TransferDataViewModel _transferData;


        private string _itemNum;
        private List<string> _unitDescs;
        private string _selectedUnit;

        public string ItemNum
        {
            get => _itemNum;
            set
            {
                if (_itemNum != value)
                {
                    _itemNum = value;
                    OnPropertyChanged(nameof(ItemNum));
                    FetchUnits();
                }
            }
        }

        public List<string> UnitDescs
        {
            get => _unitDescs;
            set
            {
                if (_unitDescs != value)
                {
                    _unitDescs = value;
                    OnPropertyChanged(nameof(UnitDescs));
                }
            }
        }

        public string SelectedUnit
        {
            get => _selectedUnit;
            set
            {
                if (_selectedUnit != value)
                {
                    _selectedUnit = value;
                    OnPropertyChanged(nameof(SelectedUnit));
                }
            }
        }


        public ChangeToItemNum(TransferDataViewModel transferData)
        {
            _itemBarcodeEntity = new ItemBarcodeEntity();
            _itemCardEntity = new ItemCardEntity();
            _itemUnitEntity = new ItemUnitEntity();
            _itemFileEntity = new ItemFileEntity();
            _transferData = transferData;

        }

        public async void FetchItemNumByBarcode(string barcode)
        {
            Debug.WriteLine($"Fetching ItemNum for Barcode: {barcode}");
            var itemNum = await _itemBarcodeEntity.GetItemNumByBarcode(barcode);
            Debug.WriteLine($"this is the itemNum of the barcode:{itemNum}");
            ItemNum = itemNum;

        }


        private async void FetchUnits()
        {
            if (!string.IsNullOrWhiteSpace(ItemNum))
            {
                var units = await _itemUnitEntity.GetUnitDescsByItemNum(ItemNum);
                Debug.WriteLine($"Units fetched: {string.Join(", ", units)}");
                UnitDescs = units;
                Debug.WriteLine($"Total units fetched: {UnitDescs.Count}");
            }
            else
            {
                UnitDescs = new List<string>();
                Debug.WriteLine("ItemNum is empty. No units fetched.");
            }
        }
        private async Task<decimal?> GetPriceByItemNum(string itemNum)
        {
            if (string.IsNullOrWhiteSpace(itemNum))
            {
                Debug.WriteLine("ItemNum is null or empty.");
                return null;
            }

        
            var priceString = await _itemFileEntity.GetPriceByItemNum(itemNum);

            if (string.IsNullOrWhiteSpace(priceString))
            {
                Debug.WriteLine($"Price not found for ItemNum: {itemNum}");
                return null;
            }

          
            if (decimal.TryParse(priceString, out decimal price))
            {
                Debug.WriteLine($"Price fetched for ItemNum {itemNum}: {price}");
                return price;
            }
            else
            {
                Debug.WriteLine($"Failed to parse price for ItemNum {itemNum}. Price string: {priceString}");
                return null;
            }
        }

        public async Task<bool> UpdateItemCardAsync(string itemNum, string unit, int ID)
        {
            try
            {
                decimal? price = await GetPriceByItemNum(itemNum);

                if (!price.HasValue)
                {
                    Debug.WriteLine($"Price not found for ItemNum: {itemNum}");
                    price = 0;
                }

                var itemToUpdate = _transferData.ItemCards.FirstOrDefault(x => x.ID == ID);
                if (itemToUpdate != null)
                {
                    itemToUpdate.ScanningNum = itemNum;
                    itemToUpdate.Unit = unit;
                    itemToUpdate.Price = price.Value.ToString("F2");
                }

                Debug.WriteLine($"Updating ItemCard with ItemNum: {itemNum}, Unit: {unit}, Price: {price}");

             
                await _itemCardEntity.UpdateDataCard(itemToUpdate, ID);
                Debug.WriteLine("ItemCard updated successfully.");

             
                await _transferData.RefreshAfterCardUpdate();

                return true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error updating item card: {ex.Message}");
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
