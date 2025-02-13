
using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.ViewModels
{
    public class ChangeToItemNum : INotifyPropertyChanged
    {

        private readonly ItemBarcodeEntity _itemBarcodeEntity;
        private readonly ItemUnitEntity _itemUnitEntity;
        
        private string _itemNum;
        private List<string> _unitDescs;
        private string _selectedUnit;
        private readonly ItemCardEntity _itemCardEntity;


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
                    if (_unitDescs != value)
                    {
                        _unitDescs = value;
                        OnPropertyChanged(nameof(UnitDescs));

                    }
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


        public ChangeToItemNum()
        {
            _itemBarcodeEntity = new ItemBarcodeEntity();
            _itemCardEntity=new ItemCardEntity();
            _itemUnitEntity = new ItemUnitEntity();
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

        public async Task UpdateItemCardAsync(string itemNum, string unit,int ID)
        {
            try
            {
               
                var itemCard = new ItemCard
                {
                    ScanningNum = itemNum,
                    Unit = unit
                };
                Debug.WriteLine($"the updated data:{itemNum}, and {unit}");

                await _itemCardEntity.UpdateDataCard(itemCard,ID);
                Debug.WriteLine($"Data is updated");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error updating item card: {ex.Message}");
                
            }
        }



        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
