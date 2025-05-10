using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace store.DTO
{
    public class InvoiceDetailDTO : INotifyPropertyChanged
    {
        private int _id;
        public int ID
        {
            get => _id;
            set
            {
                if (_id != value)
                {
                    _id = value;
                    OnPropertyChanged();
                }
            }
        }

        private DateTime _dateCreated;
        public DateTime DateCreated
        {
            get => _dateCreated;
            set
            {
                if (_dateCreated != value)
                {
                    _dateCreated = value;
                    OnPropertyChanged();
                }
            }
        }

        private int _quantity;
        public int Quantity
        {
            get => _quantity;
            set
            {
                if (_quantity != value)
                {
                    _quantity = value;
                    OnPropertyChanged();
                   
                    CalculateTotalNet();
                }
            }
        }

        private decimal _price;
        public decimal Price
        {
            get => _price;
            set
            {
                if (_price != value)
                {
                    _price = value;
                    OnPropertyChanged();
                  
                    CalculateTotalNet();
                }
            }
        }

        private decimal _totalNet;
        public decimal TotalNet
        {
            get => _totalNet;
            set
            {
                if (_totalNet != value)
                {
                    _totalNet = value;
                    OnPropertyChanged();
                }
            }
        }

        private string _itemName;
        public string ItemName
        {
            get => _itemName;
            set
            {
                if (_itemName != value)
                {
                    _itemName = value;
                    OnPropertyChanged();
                }
            }
        }

        private string _totalString;
        public string TotalString
        {
            get => _totalString;
            set
            {
                if (_totalString != value)
                {
                    _totalString = value;
                    OnPropertyChanged();
                }
            }
        }

        private string _imageUrl;
        public string ImageUrl
        {
            get => _imageUrl;
            set
            {
                if (_imageUrl != value)
                {
                    _imageUrl = value;
                    OnPropertyChanged();
                }
            }
        }

        private string _itemNum;
        public string ItemNum
        {
            get => _itemNum;
            set
            {
                if (_itemNum != value)
                {
                    _itemNum = value;
                    OnPropertyChanged();
                }
            }
        }

        private string _unitID;
        public string UnitID
        {
            get => _unitID;
            set
            {
                if (_unitID != value)
                {
                    _unitID = value;
                    OnPropertyChanged();
                }
            }
        }

        private int _itemID;
        public int ItemID
        {
            get => _itemID;
            set
            {
                if (_itemID != value)
                {
                    _itemID = value;
                    OnPropertyChanged();
                }
            }
        }

       
        private void CalculateTotalNet()
        {
            TotalNet = Price * Quantity;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}