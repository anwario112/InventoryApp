using store.Api;
using store.Data;
using store.DTO;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace store.ViewModels
{
    public class InvoiceDetailsViewModel : INotifyPropertyChanged
    {
        private readonly InvoiceEntity _invoiceEntity;
        private readonly InvoiceDetailsEntity invoiceDetailsEntity;
        private readonly ConnectionEntity _connectionEntity;

        private int _invoiceNum;
        public int InvoiceNum
        {
            get => _invoiceNum;
            set
            {
                _invoiceNum = value;
                OnPropertyChanged();
            }
        }

        private string _customerPhone;
        public string CustomerPhone
        {
            get => _customerPhone;
            set
            {
                _customerPhone = value;
                OnPropertyChanged();
            }
        }

        private DateTime? _invoiceDate;
        public DateTime? InvoiceDate
        {
            get => _invoiceDate;
            set
            {
                _invoiceDate = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(InvoiceDateString));
            }
        }

       
        private ObservableCollection<InvoiceDetailDTO> _invoiceItems;
        public ObservableCollection<InvoiceDetailDTO> InvoiceItems
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

      
        private string _customerFirstName;
        public string CustomerFirstName
        {
            get => _customerFirstName;
            set
            {
                _customerFirstName = value;
                OnPropertyChanged();
            }
        }

        private string _customerLastName;
        public string CustomerLastName
        {
            get => _customerLastName;
            set
            {
                _customerLastName = value;
                OnPropertyChanged();
            }
        }


        private DateTime? _dateCreated;
        public DateTime? DateCreated
        {
            get => _dateCreated;
            set
            {
                _dateCreated = value;
                OnPropertyChanged();
            }
        }

        private string _totalString;
        public string TotalString
        {
            get => _totalString;
            set
            {
                _totalString = value;
                OnPropertyChanged();
            }
        }


        private string _invoiceStatus;
        public string InvoiceStatus
        {
            get => _invoiceStatus;
            set
            {
                _invoiceStatus = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(IsSendButtonEnabled)); 
            }
        }

        public ICommand IncreaseQuantityCommand { get; }
        public ICommand DecreaseQuantityCommand { get; }
        public bool IsSendButtonEnabled => InvoiceStatus != "sent";



        public string InvoiceDateString => InvoiceDate?.ToString("MM/dd/yyyy") ?? "N/A";

        public InvoiceDetailsViewModel(int invoiceNum)
        {
            InvoiceNum = invoiceNum;
            _invoiceEntity = new InvoiceEntity();
            _connectionEntity=new ConnectionEntity();
            invoiceDetailsEntity = new InvoiceDetailsEntity();
            InvoiceItems = new ObservableCollection<InvoiceDetailDTO>();

            IncreaseQuantityCommand = new Command<int>(async (itemId) => await UpdateItemQuantity(itemId, 1));
            DecreaseQuantityCommand = new Command<int>(async (itemId) => await UpdateItemQuantity(itemId, -1));
            GetCustomerPhone();
            
        }

        public async Task UpdateItemQuantity(int itemId, int change)
        {
            Debug.WriteLine($"Attempting to update item {itemId} with change {change}");

            var item = InvoiceItems.FirstOrDefault(i => i.ID == itemId);
            if (item == null)
            {
                Debug.WriteLine($"Item {itemId} not found");
                return;
            }

            Debug.WriteLine($"Current quantity: {item.Quantity}, New quantity: {item.Quantity + change}");

           
            if (item.Quantity + change < 1)
            {
                Debug.WriteLine("Quantity would be less than 1, aborting");
                return;
            }

            
            int newQuantity = item.Quantity + change;

          
            bool updated = await invoiceDetailsEntity.UpdateItemQuantity(itemId, newQuantity);
            Debug.WriteLine($"Database update result: {updated}");

            if (updated)
            {
                
                int index = InvoiceItems.IndexOf(item);

               
                item.Quantity = newQuantity;

               
                item.TotalNet = item.Price * item.Quantity;

               
                decimal total = InvoiceItems.Sum(i => i.TotalNet);
                TotalString = total.ToString("F2");

            
                await _invoiceEntity.UpdateInvoiceTotal(InvoiceNum, TotalString);

              
                var tempCollection = new ObservableCollection<InvoiceDetailDTO>(InvoiceItems);
                InvoiceItems = null;
                InvoiceItems = tempCollection;
            }
            else
            {
                Debug.WriteLine($"Failed to update quantity for item {itemId}");
            }
        }
        public async Task GetCustomerPhone()
        {
            CustomerPhone = await _invoiceEntity.GetCustomerPhoneByInvoiceNum(InvoiceNum);
            InvoiceDate = await _invoiceEntity.GetInvoiceDateByInvoiceNum(InvoiceNum);
            Debug.WriteLine($"CustomerPhone: {CustomerPhone}");
        }

        public async Task GetInvoiceDetails(int invoiceNum)
        {
            try
            {
                var invoiceDetails = await _invoiceEntity.GetInvoiceDetails(invoiceNum);
                InvoiceItems.Clear();
                if (invoiceDetails != null && invoiceDetails.Any())
                {
                    foreach (var detail in invoiceDetails)
                    {
                        InvoiceItems.Add(detail);
                    }
                    TotalString = invoiceDetails.First().TotalString;
                    DateCreated = invoiceDetails.First().DateCreated;
                }

                var customerInfo = await _invoiceEntity.GetCustomerInfoWithAddressByInvoiceNum(invoiceNum);
                if (customerInfo != (null, null, null, null, null, null, null)) 
                {
                    CustomerFirstName = customerInfo.FirstName;
                    CustomerLastName = customerInfo.LastName;
                    CustomerPhone = customerInfo.Phone;
                   
                }
                else
                {
                    Debug.WriteLine($"No customer info found for InvoiceNum: {invoiceNum}");
                }

                InvoiceStatus = await _invoiceEntity.GetInvoiceStatus(invoiceNum);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching invoice details: {ex.Message}");
            }
        }

        public async Task<bool> DeleteInvoiceItem(int itemId, int invoiceNum)
        {
         
            bool isDeleted = await invoiceDetailsEntity.DeleteData(itemId);

            if (isDeleted)
            {
                await GetInvoiceDetails(invoiceNum);
                Debug.WriteLine($"Item with ID {itemId} deleted successfully.");
            }
            else
            {
                Debug.WriteLine($"Failed to delete item with ID {itemId}.");
            }

            return isDeleted; 
        }
        public event EventHandler NavigationRequested;
        public async Task SendData()
        {
            try
            {


                

                var connectionData = await _connectionEntity.FetchConnectionData();
                if (connectionData == null)
                {
                    Debug.WriteLine("Connection data is null. Cannot proceed with API request.");
                    return;
                }

                var invoiceData = new
                {
                    InvoiceNum,
                    TotalString,
                    InvoiceDate = DateCreated?.ToString("o"),
                    InvoiceTypeID=8,
                    InvoiceItems = InvoiceItems.Select(item => new
                    {
                        ItemId = item.ItemID,
                        ItemName = item.ItemName,
                        Barcode = item.ItemNum,
                        UnitID=item.UnitID,
                        Quantity = (int)item.Quantity,
                        Price = item.Price,
                        Total = item.TotalNet,
                        
                    }).ToList()
                };

                var json = System.Text.Json.JsonSerializer.Serialize(invoiceData);
                string apiKey = Environment.GetEnvironmentVariable("API_KEY") ?? "12345-ABCDE-67890-FGHIJ";

                string secretKey = Environment.GetEnvironmentVariable("SECRET_KEY") ?? "S3cr3tK3y!@#2023";

                var httpHelper = new HttpHelper(apiKey, secretKey);

                
                var response = await httpHelper.PostResponse("http://192.168.1.4:8000/api/InvoiceData", json,connectionData.ServerName,connectionData.DatabaseName,connectionData.Username,connectionData.Password,connectionData.Year);

                if (!string.IsNullOrEmpty(response))
                {
                    Debug.WriteLine("Data sent successfully.");
                    InvoiceStatus = "sent";
                    await UpdateInvoiceStatus(InvoiceNum, InvoiceStatus);

                    NavigationRequested?.Invoke(this, EventArgs.Empty);

                }
                else
                {
                    Debug.WriteLine("Failed to send data. No response received.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error sending data: {ex.Message}");
            }
        }


        public async Task<bool> UpdateInvoiceStatus(int invoiceNum, string status)
        {
            try
            {
                
                return await _invoiceEntity.FindAndUpdateInvoiceStatus(invoiceNum, status);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error updating invoice {invoiceNum} status: {ex.Message}");
                return false; 
            }
        }
       
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}