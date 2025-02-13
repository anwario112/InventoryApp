using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.ViewModels
{
    public  class ItemCheckBox : INotifyPropertyChanged
    {

        private bool _isChecked;

        private Color _backgroundColor;

        public string Barcode { get; set; }

        public string UnitDesc { get; set; }

        public decimal Price { get; set; }


        // Reference to the parent view model

        private PackingPopupFunction _parentViewModel;


        public ItemCheckBox(PackingPopupFunction parentViewModel)

        {

            _parentViewModel = parentViewModel;

        }


        public bool IsChecked

        {

            get => _isChecked;

            set

            {

                if (_isChecked != value)

                {

                    _isChecked = value;

                    OnPropertyChanged(nameof(IsChecked));


                    // Change background color based on checked state

                    BackgroundColor = _isChecked ? Colors.Green : Colors.Transparent;


                    // Notify the parent view model to uncheck other checkboxes

                    if (_isChecked)

                    {

                        _parentViewModel.UncheckOtherItems(this);

                    }

                }

            }

        }


        public Color BackgroundColor

        {

            get => _backgroundColor;

            set

            {

                if (_backgroundColor != value)

                {

                    _backgroundColor = value;

                    OnPropertyChanged(nameof(BackgroundColor));

                }

            }

        }


        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}
