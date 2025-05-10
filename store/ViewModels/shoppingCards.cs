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
using store.View;
using System.Windows.Input;

namespace store.ViewModels
{
    public class shoppingCards : INotifyPropertyChanged
    {
        private static int _invoiceCounter = 0;

     
        private readonly UserEntity _userEntity;
        private readonly ShoppingCardEntity _shoppingCardEntity;
        private readonly InvoiceEntity _invoiceEntity;
        private readonly InvoiceDetailsEntity _invoiceDetailsEntity;
        private readonly ItemFileEntity _itemFileEntity;
        private readonly CustomerEntity _customerEntity;
        private readonly CountryEntity _countryEntity;
        private readonly CityEntity _cityEntity;




        private ObservableCollection<Customer> _filteredCustomers;
        private Customer _selectedCustomer;
        private string _searchBar;
        private bool _isCustomerSearchActive;
        private bool _isCustomerSelected;

        public ObservableCollection<Customer> FilteredCustomers
        {
            get => _filteredCustomers;
            set
            {
                _filteredCustomers = value;
                OnPropertyChanged();
            }
        }

        public Customer SelectedCustomer
        {
            get => _selectedCustomer;
            set
            {
                _selectedCustomer = value;
                OnPropertyChanged();
                IsCustomerSelected = value != null && !string.IsNullOrEmpty(value.FirstName);

           
                OnPropertyChanged(nameof(CustomerDisplayText));
            }
        }

        public string CustomerDisplayText =>
         SelectedCustomer != null
             ? $"{SelectedCustomer.FirstName} {SelectedCustomer.LastName}".Trim()
             : "No customer selected";



        public bool IsCustomerSearchActive
        {
            get => _isCustomerSearchActive;
            set
            {
                _isCustomerSearchActive = value;
                OnPropertyChanged();
            }
        }

        public bool IsCustomerSelected
        {
            get => _isCustomerSelected;
            set
            {
                _isCustomerSelected = value;
                OnPropertyChanged();
            }
        }


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

        private ObservableCollection<Models.InvoiceDetails> _invoiceItems;
        public ObservableCollection<Models.InvoiceDetails> InvoiceItems

        {

            get => _invoiceItems;

            set

            {

                if (_invoiceItems != value)

                {

                    _invoiceItems = value;

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

        private string _title = "Shopping Cart";
        public string Title
        {
            get => _title;
            set
            {
                _title = value;
                OnPropertyChanged();
            }
        }






        public string SearchBar
        {
            get => _searchBar;
            set
            {
                if (_searchBar != value)
                {
                    _searchBar = value;
                    OnPropertyChanged();

             
                    if (!string.IsNullOrEmpty(value))
                    {
                        _ = SearchCustomers();
                    }
                    else
                    {
                        FilteredCustomers.Clear();
                    }
                }
            }
        }


        public ICommand IncreaseQuantityCommand { get; }
        public ICommand DecreaseQuantityCommand { get; }


        public ICommand SearchCustomerCommand { get; }
        public ICommand ClearSelectedCustomerCommand { get; }
        public ICommand SelectCustomerCommand { get; }
        public shoppingCards()
        {
            _shoppingCardEntity = new ShoppingCardEntity();
            ShoppingCartItems = new ObservableCollection<dynamic>();
            _userEntity = new UserEntity();
            _invoiceDetailsEntity = new InvoiceDetailsEntity();
            _invoiceEntity = new InvoiceEntity();
            _itemFileEntity = new ItemFileEntity();
            _customerEntity = new CustomerEntity();
            _countryEntity = new CountryEntity();
            _cityEntity = new CityEntity();

            InvoiceItems = new ObservableCollection<Models.InvoiceDetails>();
            FilteredCustomers = new ObservableCollection<Customer>();
            SearchCustomerCommand = new Command(async () => await SearchCustomers());
            ClearSelectedCustomerCommand = new Command(ClearSelectedCustomer);
            SelectCustomerCommand = new Command<Customer>(SelectCustomer);


            IncreaseQuantityCommand = new Command<int>(async (itemId) => await UpdateItemQuantity(itemId, 1));
            DecreaseQuantityCommand = new Command<int>(async (itemId) => await UpdateItemQuantity(itemId, -1));

            SelectedCustomer = null;
            IsCustomerSearchActive = false;
            IsCustomerSelected = false;
        }
        private DateTime _lastSearchTime;
        private CancellationTokenSource _searchToken;

        public async Task SearchCustomers()
        {
            try
            {
               
                _searchToken?.Cancel();
                _searchToken = new CancellationTokenSource();

             
                await Task.Delay(300, _searchToken.Token);

                if (string.IsNullOrEmpty(SearchBar))
                {
                    FilteredCustomers.Clear();
                    IsCustomerSearchActive = false;
                    return;
                }

            
                var filtered = await _customerEntity.SearchCustomersAsync(SearchBar);

                await MainThread.InvokeOnMainThreadAsync(() =>
                {
                    FilteredCustomers.Clear();
                    foreach (var customer in filtered)
                    {
                        FilteredCustomers.Add(customer);
                    }
                    IsCustomerSearchActive = filtered.Any();
                });
            }
            catch (OperationCanceledException)
            {
              
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Search error: {ex.Message}");
                Debug.WriteLine($"Stack trace: {ex.StackTrace}");
            }
        }
        private void ClearSelectedCustomer()
        {
            SelectedCustomer = null;
            SearchBar = string.Empty;
            IsCustomerSearchActive = false;
            IsCustomerSelected = false;
        }
      
        private void SelectCustomer(Customer customer)
        {
            try
            {
                if (customer != null)
                {
                    SelectedCustomer = customer;
                    Debug.WriteLine($"Selected Customer: {customer.FirstName} {customer.LastName}");

                 
                    FilteredCustomers.Clear();
                    IsCustomerSearchActive = false;
                    SearchBar = string.Empty;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error selecting customer: {ex.Message}");
            }
        }

        public async Task LoadShoppingCartItems(string username)
        {
            int userId = await _userEntity.FindUser(username) ?? 0;
            var shoppingCartItems = await _shoppingCardEntity.GetShoppingCartItems(userId);

            
            ShoppingCartItems = new ObservableCollection<dynamic>(shoppingCartItems);
            TotalPrice = await GetTotalPrice(username);

        }

        public async Task<decimal> GetTotalPrice(string username)
        {
            int userId = await _userEntity.FindUser(username) ?? 0;
            return await _shoppingCardEntity.CalculateTotalPrice(userId);
        }

        public async Task<bool> DeleteShoppingCartItem(int itemId, string username)
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


        public async Task<bool> SaveInvoice(string username)
        {
            try
            {
              

              
             
               

                
                int userID = await _userEntity.FindUser(username) ?? 0;
                var cards = await _shoppingCardEntity.GetShoppingCartItems(userID);
                var totalPrice = await _shoppingCardEntity.CalculateTotalPrice(userID);
                var CustID = await _customerEntity.GetCustomerIDByPhone(SelectedCustomer.Phone);

                var invoice = new Invoice
                {
                    InvoiceNum = Math.Abs(Guid.NewGuid().GetHashCode()),
                    UserID = userID,
                    Total = totalPrice.ToString(),
                    CustomerID = CustID,
                    Status = "Not Sent",
                    InvoiceTypeID=8
                };

                Debug.WriteLine($"InvoiceNum: {invoice.InvoiceNum}, CustomerID: {invoice.CustomerID}, UserID: {invoice.UserID}, Total: {invoice.Total}, Status: {invoice.Status}");

                await _invoiceEntity.AddData(invoice);

                int? invoiceID = await _invoiceEntity.GetIdByInvoiceNum(invoice.InvoiceNum);

                var invoiceDetailsList = new List<Models.InvoiceDetails>();

            
                foreach (var item in cards)
                {
                    if (item == null)
                    {
                        Debug.WriteLine("Item in cards is null.");
                        continue;
                    }

                 
                    int itemID = await _itemFileEntity.GetItemIdByItemNum(item.ItemNum);
                    Debug.WriteLine($"The itemID is: {itemID}");

                
                    var price = await _itemFileEntity.GetPriceByItemId(itemID);
                    Debug.WriteLine($"The price of the item is: {price}");

                    var invoiceDetail = new Models.InvoiceDetails
                    {
                        InvoiceID = invoiceID.Value,
                        ItemID = itemID,
                        Quantity = item.Quantity,
                        Price = price,
                        TotalNet = item.Price,
                        Barcode=item.ItemNum
                        
                    };

                    Debug.WriteLine($"Itemid:{invoiceDetail.ItemID},barcode:{invoiceDetail.Barcode}");
                    invoiceDetailsList.Add(invoiceDetail);
                }

                if (invoiceDetailsList.Count > 0)
                {
                    await _invoiceDetailsEntity.AddDataRange(invoiceDetailsList);
                    Debug.WriteLine("All invoice details saved successfully.");
                    return true;
                }
                else
                {
                    Debug.WriteLine("No invoice details to save.");
                    return false;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Inner exception: {ex.InnerException?.Message}");
                return false;
            }
        }



        public async Task UpdateItemQuantity(int itemId, int change)
        {
            try
            {
               
                var item = ShoppingCartItems.FirstOrDefault(i => i.ID == itemId);
                if (item == null)
                {
                    Debug.WriteLine($"Item with ID {itemId} not found in ShoppingCartItems");
                    return;
                }

             
                int currentQuantity;
                if (item.Quantity is string quantityString)
                {
                    int.TryParse(quantityString, out currentQuantity);
                }
                else
                {
                    currentQuantity = (int)item.Quantity;
                }

               
                int newQuantity = currentQuantity + change;
                if (newQuantity < 1)
                {
                    newQuantity = 1;
                }

            
                bool success = await _shoppingCardEntity.UpdateItemQuantity(itemId, newQuantity);

                if (success)
                {
                   
                    string username = await SecureStorage.GetAsync("Username");

               
                    var updatedItem = await _shoppingCardEntity.GetShoppingCartItemById(itemId);

                    if (updatedItem != null)
                    {
                     
                        int index = -1;
                        for (int i = 0; i < ShoppingCartItems.Count; i++)
                        {
                            if (ShoppingCartItems[i].ID == itemId)
                            {
                                index = i;
                                break;
                            }
                        }

                        if (index >= 0)
                        {
                           
                            ShoppingCartItems[index] = updatedItem;
                        }

                   
                        int userId = await _userEntity.FindUser(username) ?? 0;
                        TotalPrice = await _shoppingCardEntity.CalculateTotalPrice(userId);

                        OnPropertyChanged(nameof(ShoppingCartItems));
                        OnPropertyChanged(nameof(TotalPrice));
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error updating quantity: {ex.Message}");
            }
        }



        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
