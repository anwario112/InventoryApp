using CommunityToolkit.Mvvm.Input;
using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace store.ViewModels
{
    public class CustomerModelView : INotifyPropertyChanged
    {
        private readonly CountryEntity country;
        private readonly CityEntity city;
        private readonly CustomerEntity customerEntity;
        private readonly CurrencyEntity currencyEntity;

        private bool _isRefreshing;
        public bool IsRefreshing
        {
            get => _isRefreshing;
            set
            {
                _isRefreshing = value;
                OnPropertyChanged(nameof(IsRefreshing));
            }
        }

        private List<string> _currencyList;
        public List<string> CurrencyList
        {
            get => _currencyList;
            set
            {
                _currencyList = value;
                OnPropertyChanged(nameof(CurrencyList));
            }
        }

        private string _selectedCurrency;
        public string SelectedCurrency
        {
            get => _selectedCurrency;
            set
            {
                if (_selectedCurrency != value)
                {
                    _selectedCurrency = value;
                    OnPropertyChanged(nameof(SelectedCurrency));
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
                    OnPropertyChanged(nameof(FirstName));
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
                    OnPropertyChanged(nameof(LastName));
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
                    OnPropertyChanged(nameof(Country));
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
                    OnPropertyChanged(nameof(City));
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
                    OnPropertyChanged(nameof(Phone));
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
                    OnPropertyChanged(nameof(CompanyName));
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
                    OnPropertyChanged(nameof(Address));
                }
            }
        }

        private List<Customer> _customers;
        public List<Customer> Customers
        {
            get => _customers;
            set
            {
                _customers = value;
                OnPropertyChanged(nameof(Customers));
            }
        }

        public ICommand RefreshCommand { get; }

        public CustomerModelView()
        {
            currencyEntity = new CurrencyEntity();
            country = new CountryEntity();
            city = new CityEntity();
            customerEntity = new CustomerEntity();

            RefreshCommand = new RelayCommand(async () => await RefreshCustomers());

            LoadCurrencies();
            LoadCustomers();
        }

        private async void LoadCustomers()
        {
            Customers = await customerEntity.GetAllCustomersAsync();
            Debug.WriteLine($"Number of customers loaded: {Customers?.Count}");
        }

        public async Task RefreshCustomers()
        {
            IsRefreshing = true;
            try
            {
                Customers = await customerEntity.GetAllCustomersAsync();
                Debug.WriteLine($"Customers refreshed: {Customers?.Count}");
            }
            finally
            {
                IsRefreshing = false;
            }
        }

        private async void LoadCurrencies()
        {
            var currencies = await currencyEntity.GetAllData();
            CurrencyList = currencies.Select(c => c.CurrencyCode).ToList();
        }


        public async Task<bool> SaveData()
        {
            if (string.IsNullOrWhiteSpace(FirstName) || string.IsNullOrWhiteSpace(LastName) || string.IsNullOrWhiteSpace(Phone) || string.IsNullOrWhiteSpace(Address) || string.IsNullOrWhiteSpace(SelectedCurrency))
            {
                return false;
            }

            try
            {
                var existingCountry = await country.GetCountryByCountryName(Country);
                int countryId;

                if (existingCountry != null)
                {
                    countryId = existingCountry.ID;
                    Debug.WriteLine($"Country already exists: {existingCountry.CountryName}, ID: {countryId}");
                }
                else
                {
                    var countryData = new Country
                    {
                        CountryCode = Math.Abs(Guid.NewGuid().GetHashCode()),
                        CountryName = Country
                    };

                    await country.AddData(countryData);
                    countryId = countryData.ID;
                    Debug.WriteLine($"New country added: {countryData.CountryName}, ID: {countryId}");
                }

                var existingCity = await city.GetCityIdByCityName(City);
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

                    await city.AddData(cityData);
                    cityId = cityData.ID;
                    Debug.WriteLine($"New city added: {cityData.CityName}, ID: {cityId}, countryID: {cityData.CountyID}");
                }

                var selectedCurrencyCode = SelectedCurrency;
                var currencyId = await currencyEntity.GetCurrencyIdByCode(selectedCurrencyCode);

                var customer = new Customer
                {
                    FirstName = FirstName,
                    LastName = LastName,
                    CurrencyID = currencyId,
                    CustomerNum = Math.Abs(Guid.NewGuid().GetHashCode()),
                    Phone = Phone,
                    Company = CompanyName,
                    Address = Address,
                    CountryID = countryId,
                    CityID = cityId
                };

                Debug.WriteLine($"Customer info: FirstName: {customer.FirstName}, LastName: {customer.LastName}, Phone: {customer.Phone},currency:{customer.CurrencyID}, Company: {customer.Company}, Address: {customer.Address}, CountryID: {customer.CountryID}");

                await customerEntity.AddData(customer);
                Debug.WriteLine("Customer is saved");

              
                await RefreshCustomers();
                return true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error saving customer: {ex.Message}");
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