using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;

namespace store.ViewModels
{
    public  class shoppingCards:INotifyPropertyChanged
    {

        private readonly UserEntity _userEntity;
        private readonly ShoppingCardEntity _shoppingCardEntity;

        private ObservableCollection<dynamic> _shoppingCartItems;

        public ObservableCollection<dynamic> ShoppingCartItems
        {

            get => _shoppingCartItems;
            set
            {

                if (_shoppingCartItems != value)
                {
                    _shoppingCartItems = value;

                    OnPropertyChanged();

                }

            }

        }


        private decimal _totalPrice;

        public decimal TotalPrice
        {
            get => _totalPrice;
            set
            {
                if (_totalPrice != value)
                {
                    _totalPrice = value;
                    OnPropertyChanged();
                }
            }
        }


        

        public shoppingCards()
        {
            _shoppingCardEntity = new ShoppingCardEntity();
            ShoppingCartItems = new ObservableCollection<dynamic>();
            _userEntity = new UserEntity();

        }

        public async Task LoadShoppingCartItems(string username)
        {
            int userId = await _userEntity.FindUser(username) ?? 0; 
            var items = await _shoppingCardEntity.GetShoppingCartItems(userId);
            ShoppingCartItems = new ObservableCollection<dynamic>(items);
            TotalPrice = await GetTotalPrice(username);

        }

        public async Task<decimal> GetTotalPrice(string username)
        {
            int userId = await _userEntity.FindUser(username) ?? 0;
            return await _shoppingCardEntity.CalculateTotalPrice(userId);
        }

        public async Task<bool> DeleteShoppingCartItem(int itemId,string username)
        {
            try
            {
                int userId = await _userEntity.FindUser(username) ?? 0;
                Debug.WriteLine($"the itemID in shoppinCard:{itemId}");

                bool isDeleted = await _shoppingCardEntity.DeleteShoppingCartItem(itemId);

                if (isDeleted)
                {
                  
                    var itemToRemove = ShoppingCartItems.FirstOrDefault(item => item.ID == itemId);
                    if (itemToRemove != null)
                    {
                        ShoppingCartItems.Remove(itemToRemove);
                    }

                    
                    TotalPrice = await _shoppingCardEntity.CalculateTotalPrice(userId);
                }

                return isDeleted;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error deleting item: {ex.Message}");
                return false;
            }
        }


        public async Task SendDataToApi(string username)
        {

            try
            {

                int UserID = await _userEntity.FindUser(username) ?? 0;
                var cards = await _shoppingCardEntity.GetShoppingCartItems(UserID);

                var json = JsonConvert.SerializeObject(cards);

                using (var Client = new HttpClient())
                {
                    Client.BaseAddress = new Uri(" https://f7ed-213-204-95-81.ngrok-free.app/api/shoppingCard");
                    var content = new StringContent(json, Encoding.UTF8, "application/json");
                    var response = await Client.PostAsync("", content);

                    if (response.IsSuccessStatusCode)
                    {
                        Debug.WriteLine("Data sent successfully to the API.");
                    }
                    else
                    {
                        Debug.WriteLine($"Failed to send data to the API. Status Code: {response.StatusCode}");
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error sending data to API: {ex.Message}");
            }

        }




        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
