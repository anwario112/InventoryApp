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
        private readonly StreetEntity _streetEntity;

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


        private string _firstName;
        public string FirstName
        {
            get => _firstName;
            set
            {
                if (_firstName != value)
                {
                    _firstName = value;
                    OnPropertyChanged();
                }
            }
        }


        private string _lastName;
        public string LastName
        {
            get => _lastName;
            set
            {
                if (_lastName != value)
                {
                    _lastName = value;
                    OnPropertyChanged();
                }
            }
        }


        private string _country;
        public string Country
        {
            get => _country;
            set
            {
                if (_country != value)
                {
                    _country = value;
                    OnPropertyChanged();

                }

            }

        }


        private string _city;
        public string City
        {
            get => _city;
            set
            {
                if (_city != value)
                {
                    _city = value;
                    OnPropertyChanged();
                }
            }
        }


        private string _phone;
        public string Phone
        {
            get => _phone;
            set
            {
                if (_phone != value)
                {
                    _phone = value;
                    OnPropertyChanged();

                }

            }

        }


        private string _street;
        public string Street
        {
            get => _street;
            set
            {
                if (_street != value)
                {
                    _street = value;
                    OnPropertyChanged();

                }

            }

        }


        private string _companyName;
        public string CompanyName
        {
            get => _companyName;
            set
            {
                if (_companyName != value)
                {
                    _companyName = value;
                    OnPropertyChanged();
                }
            }
        }


        private string _address;
        public string Address
        {
            get => _address;
            set
            {
                if (_address != value)
                {
                    _address = value;
                    OnPropertyChanged();
                }

            }

        }




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
            _streetEntity = new StreetEntity();

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

                if (string.IsNullOrWhiteSpace(FirstName) || string.IsNullOrWhiteSpace(LastName) || string.IsNullOrWhiteSpace(Phone) || string.IsNullOrWhiteSpace(Address))

                {

                    return false;

                }


                // Create or get Customer

                var customer = new Customer

                {

                    FirstName = FirstName,

                    LastName = LastName,

                    CustomerNum = Math.Abs(Guid.NewGuid().GetHashCode()),

                    Phone = Phone,

                    Company = CompanyName,

                    Address = Address,

                };

                Debug.WriteLine($"Customer info: FirstName: {customer.FirstName}, LastName: {customer.LastName}, Phone: {customer.Phone}, Company: {customer.Company}, Address: {customer.Address}");

                await _customerEntity.AddData(customer);

                Debug.WriteLine("Customer is saved");


                // Check for existing Country

                var existingCountry = await _countryEntity.GetCountryByCountryName(Country);

                int countryId;

                if (existingCountry != null)

                {

                    countryId = existingCountry.ID; // Use existing country ID

                    Debug.WriteLine($"Country already exists: {existingCountry.CountryName}, ID: {countryId}");

                }

                else

                {

                    var countryData = new Country

                    {

                        CountryCode = Math.Abs(Guid.NewGuid().GetHashCode()),

                        CountryName = Country

                    };

                    await _countryEntity.AddData(countryData);

                    countryId = countryData.CountryCode; 

                    Debug.WriteLine($"New country added: {countryData.CountryName}, ID: {countryId}");

                }


                

                var existingCity = await _cityEntity.GetCityIdByCityName(City);

                int cityId;

                if (existingCity != null)
                {
                    cityId = existingCity.Value; 
                   
                }
                else
                {

                    var cityData = new City
                    {
                        CityNum = Math.Abs(Guid.NewGuid().GetHashCode()),
                        CityName = City,
                        CountyID = countryId
                    };

                    await _cityEntity.AddData(cityData);

                    cityId = cityData.CityNum; 

                    Debug.WriteLine($"New city added: {cityData.CityName}, ID: {cityId}");

                }


                

                var existingStreet = await _streetEntity.GetStreetIdByStreetDesc(Street);

                int streetId;

                if (existingStreet != null)

                {

                    streetId = existingStreet.Value;

                    Debug.WriteLine($"Street already exists: ID: {streetId}");

                }

                else

                {

                    var streetData = new Street

                    {

                        StreetNum = Math.Abs(Guid.NewGuid().GetHashCode()),

                        StreetDesc = Street,

                        CityID = cityId

                    };

                    await _streetEntity.AddData(streetData);

                    streetId = streetData.StreetNum; 

                    Debug.WriteLine($"New street added: {streetData.StreetDesc}, ID: {streetId}");

                }


                
                var customerID = await _customerEntity.GetCustomerIDByPhone(Phone);
                int userID = await _userEntity.FindUser(username) ?? 0;
                var cards = await _shoppingCardEntity.GetShoppingCartItems(userID);
                var totalPrice = await _shoppingCardEntity.CalculateTotalPrice(userID);


                var invoice = new Invoice

                {

                    InvoiceNum = Math.Abs(Guid.NewGuid().GetHashCode()),

                    UserID = userID,

                    Total = totalPrice.ToString(),

                    CustomerID = customerID,

                    Status = "Not Sent"

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
                        TotalNet = item.Price

                    };


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

                Debug.WriteLine($"Error sending data to API: {ex.Message}");

                return false; 

            }

        }




        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
