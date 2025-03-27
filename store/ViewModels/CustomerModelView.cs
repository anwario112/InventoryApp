using CommunityToolkit.Mvvm.Input;
using store.Data;
using store.DTO;
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
        private readonly CountryEntity countryEntity;

        public int CustomerID { get; set; }
        public int CityID { get; private set; }
        public int CountryID { get; private set; }
        public int CurrencyID { get; private set; }

        private CustomerDetails _customerDetails;




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

        private string _email;
        public string Email
        {
            get => _email;
            set
            {
                if (_email != value)
                {
                    _email = value;
                    OnPropertyChanged(nameof(Email));
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

        private string _imagepath;
        public string ImagePath
        {
            get => _imagepath;
            set
            {
                if (_imagepath != value)
                {
                    _imagepath = value;
                    OnPropertyChanged(nameof(ImagePath));
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

        private string _vatNum;
        public string VatNum
        {
            get => _vatNum;
            set
            {
                if (_vatNum != value)
                {
                    _vatNum = value;
                    OnPropertyChanged(nameof(VatNum));
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

        private string _searchText;
        public string SearchText
        {
            get => _searchText;
            set
            {
                if (_searchText != value)
                {
                    _searchText = value;
                    OnPropertyChanged(nameof(SearchText));
                    FilterCustomers(); 
                }
            }
        }
        private List<Customer> _allCustomers;
        public ICommand RefreshCommand { get; }

        public CustomerModelView()
        {
            currencyEntity = new CurrencyEntity();
            country = new CountryEntity();
            city = new CityEntity();
            customerEntity = new CustomerEntity();
            countryEntity = new CountryEntity();

            RefreshCommand = new RelayCommand(async () => await RefreshCustomers());
            SearchText = string.Empty;
            _allCustomers = new List<Customer>();
            Task.Run(async () => await Initialize());
          
    
        }
        private async Task Initialize()
        {
            await LoadCustomers();
        }


        private async Task LoadCustomers()
        {
            Debug.WriteLine("Loading customers...");
            var customersList = await customerEntity.GetAllCustomersAsync();
            Debug.WriteLine($"Number of customers retrieved: {customersList?.Count}");

            _allCustomers = customersList;
            Debug.WriteLine($"Number of customers in _allCustomers: {_allCustomers?.Count}");

            Customers = _allCustomers;
            Debug.WriteLine($"Number of customers loaded: {Customers?.Count}");
        }

        public async Task RefreshCustomers()
        {
            IsRefreshing = true;
            try
            {
                var customersList = await customerEntity.GetAllCustomersAsync();
                Customers = customersList;
                Debug.WriteLine($"Customers refreshed: {Customers?.Count}");
                OnPropertyChanged(nameof(Customers));
            }
            finally
            {
                IsRefreshing = false;
            }
        }


        public async Task<bool> SaveData()
        {
            if (string.IsNullOrWhiteSpace(FirstName) || string.IsNullOrWhiteSpace(LastName) || string.IsNullOrWhiteSpace(Phone) || string.IsNullOrWhiteSpace(Address))
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

              

                var customer = new Customer
                {
                    FirstName = FirstName,
                    LastName = LastName,                
                    CustomerNum = Math.Abs(Guid.NewGuid().GetHashCode()),
                    Phone = Phone,
                    TvaNum=VatNum,
                    Company = CompanyName,
                    Address = Address,
                    CountryID = countryId,
                    CityID = cityId,
                    Email=Email
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


        public async Task<bool> UpdateData()
        {
            if (string.IsNullOrWhiteSpace(FirstName) || string.IsNullOrWhiteSpace(LastName) ||
                string.IsNullOrWhiteSpace(Phone) || string.IsNullOrWhiteSpace(Address) )
              
            {
                Debug.WriteLine("Validation failed: Required fields are missing.");
                return false;
            }

            try
            {
                Debug.WriteLine($"Updating customer with ID: {CustomerID}");
                Debug.WriteLine($"New FirstName: {FirstName}, LastName: {LastName}, Phone: {Phone}");

                var existingCountry = await country.GetCountryByCountryName(Country);
                int countryId;

                if (existingCountry != null)
                {
                    countryId = existingCountry.ID;
                    Debug.WriteLine($"Country exists: {existingCountry.CountryName}, ID: {countryId}");
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
                    Debug.WriteLine($"City exists: {City}, ID: {cityId}");
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

            

                var customer = new Customer
                {
                    ID = CustomerID,
                    FirstName = FirstName,
                    LastName = LastName,
                    TvaNum=VatNum,
                    Phone = Phone,
                    Company = CompanyName,
                    Address = Address,
                    CountryID = countryId,
                    CityID = cityId,
                    Email=Email,
                   
                };

                Debug.WriteLine($"Updating customer: ID: {customer.ID}, FirstName: {customer.FirstName}, LastName: {customer.LastName}");

                await customerEntity.UpdateData(customer);
                Debug.WriteLine("Customer updated successfully");

                await RefreshCustomers();
                return true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error updating customer: {ex.Message}");
                return false;
            }
        }

        public async Task FilterCustomers()
        {
            try
            {
                if (_allCustomers == null)
                {
                    Debug.WriteLine("_allCustomers is null. Initializing it.");
                    _allCustomers = new List<Customer>();
                }

                if (string.IsNullOrWhiteSpace(SearchText))
                {
                 
                    Customers = _allCustomers;
                }
                else
                {
                 
                    var filteredCustomers = _allCustomers
                        .Where(c => c.FirstName.Contains(SearchText, StringComparison.OrdinalIgnoreCase) ||
                                    c.LastName.Contains(SearchText, StringComparison.OrdinalIgnoreCase) ||
                                    c.Phone.Contains(SearchText, StringComparison.OrdinalIgnoreCase) ||
                                    c.Address.Contains(SearchText, StringComparison.OrdinalIgnoreCase))
                        .ToList();

                    Customers = filteredCustomers;
                }

                OnPropertyChanged(nameof(Customers));
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error filtering customers: {ex.Message}");
            }
        }

        public async Task<bool> UpdateCustomerImage(int customerId, string imagePath)
        {
            try
            {
             
                bool result = await customerEntity.UpdateCustomerImagePath(customerId, imagePath);

                if (result)
                {
                    // If successful, refresh the customers list
                    await RefreshCustomers();
                    return true;
                }

                return false;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in ViewModel while updating customer image: {ex.Message}");
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