using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using store.Api;
using store.Data;
using store.DTO;
using store.Models;

namespace store.ViewModels
{
    public class ItemPriceViewModel : INotifyPropertyChanged
    {
        private string _barcode;
        private ProductApi _product;
        private bool _isDataVisible;
        private readonly ConnectionEntity connectionEntity;
        private Timer _typingTimer;

        public event PropertyChangedEventHandler PropertyChanged;

        public string Barcode
        {
            get => _barcode;
            set
            {
                if (_barcode != value)
                {
                    _barcode = value;
                    OnPropertyChanged(nameof(Barcode));

                 
                    _typingTimer?.Change(500, Timeout.Infinite); 
                }
            }
        }

        private string _displayedBarcode;

        public string DisplayedBarcode
        {
            get => _displayedBarcode;
            set
            {
                if (_displayedBarcode != value)
                {
                    _displayedBarcode = value;
                    OnPropertyChanged(nameof(DisplayedBarcode));
                }
            }
        }

        public ProductApi Product
        {
            get => _product;
            set
            {
                _product = value;
                OnPropertyChanged(nameof(Product));

                if (_product != null)
                {
                    Debug.WriteLine($"Product Fetched: {_product.ItemName}, Price LL: {_product.SaleNetLL}, Price USD: {_product.SaleNetUSD}");
                }

           
                Barcode = string.Empty;
            }
        }

        public ItemPriceViewModel()
        {
            connectionEntity = new ConnectionEntity();
            _typingTimer = new Timer(OnTypingTimerElapsed);
        }

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private void OnTypingTimerElapsed(object state)
        {
         
            if (!string.IsNullOrWhiteSpace(_barcode))
            {
                FetchItemPriceAsync(_barcode, 1);
            }
        }

        private async void FetchItemPriceAsync(string barcode, int currencyID = 1)
        {
            try
            {
                await Task.Delay(100); 

                var connection = await connectionEntity.FetchConnectionData();

                if (connection == null)
                {
                    Debug.WriteLine("Connection details not found in the database.");
                    return;
                }

                Debug.WriteLine($"Connection Details: ServerName={connection.ServerName}, DatabaseName={connection.DatabaseName}, Username={connection.Username}, Password={connection.Password}, Year={connection.Year}");

                var httpHelper = new HttpHelper("12345-ABCDE-67890-FGHIJ", "S3cr3tK3y!@#2023");
                string url = $"    https://733a-213-204-95-158.ngrok-free.app/api/itemPrice?itemBarcode={barcode}&currencyID={currencyID}";

                Debug.WriteLine($"Fetching item price for barcode: {barcode}");

                string response = await httpHelper.GetResponse(
                    url,
                    connection.ServerName,
                    connection.DatabaseName,
                    connection.Username,
                    connection.Password,
                    connection.Year
                );

                Debug.WriteLine($"API Response: {response}");

               
                var apiResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<ApiResponse>(response);

                if (apiResponse != null && apiResponse.Success && apiResponse.Data != null && apiResponse.Data.Count > 0)
                {
                   
                    Product = apiResponse.Data[0];
                    DisplayedBarcode = barcode;
                    Debug.WriteLine($"Product Fetched: {Product.ItemName}, Price LL: {Product.SaleNetLL}, Price USD: {Product.SaleNetUSD}");
                  
                }
                else
                {
                    DisplayedBarcode = string.Empty;
                    Debug.WriteLine("No product data found in the API response.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching item price: {ex.Message}");
            }
        }
    }
}