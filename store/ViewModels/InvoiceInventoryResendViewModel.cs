using Azure;
using Newtonsoft.Json;
using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace store.ViewModels
{
    public class InvoiceInventoryResendViewModel : INotifyPropertyChanged
    {


        private readonly InvoiceEntity invoiceEntity;
        private readonly InvoiceDetailsEntity invoiceDetailsEntity;
        private readonly ConnectionEntity _connectionEntity;

        private ObservableCollection<Invoice> _invoices;
        public ObservableCollection<Invoice> Invoices
        {
            get => _invoices;
            set
            {
                _invoices = value;
                OnPropertyChanged(nameof(Invoices));
            }
        }

        public ICommand SendInvoice { get; }
        public InvoiceInventoryResendViewModel()
        {
            invoiceEntity = new InvoiceEntity();
            invoiceDetailsEntity = new InvoiceDetailsEntity();
            Invoices = new ObservableCollection<Invoice>();
            _connectionEntity = new ConnectionEntity();
            SendInvoice = new Command<Invoice>(async (invoice) => await SendInvoiceData(invoice));

            GetInvoices();
        }

        public async Task GetInvoices()
        {
            var typeID = 27;
            var InvoicesList = await invoiceEntity.GetInvoicesByTypeAsync(typeID);
            Invoices = new ObservableCollection<Invoice>(InvoicesList);
        }
        private async Task SendInvoiceData(Invoice invoice)
        {
            try
            {
                if (invoice == null)
                {
                    Debug.WriteLine("No invoice provided");
                    return;
                }

                Debug.WriteLine($"Preparing to send invoice:");
                Debug.WriteLine($"- Number: {invoice.InvoiceNum}");
                Debug.WriteLine($"- ID: {invoice.ID}");
                Debug.WriteLine($"- Type: {invoice.InvoiceTypeID}");
                Debug.WriteLine($"- Date: {invoice.DateCreated}");
                Debug.WriteLine($"- Total: {invoice.Total}");

                var connectionData = await _connectionEntity.FetchConnectionData();
                if (connectionData == null)
                {
                    Debug.WriteLine("Connection data is null. Cannot proceed with API request.");
                    await Application.Current.MainPage.DisplayAlert("Error", "Connection data is missing. Please check your settings.", "OK");
                    return;
                }

                var invoiceItems = await invoiceDetailsEntity.GetAllByInvoiceIdAsync(invoice.ID);

                if (invoiceItems == null || !invoiceItems.Any())
                {
                    Debug.WriteLine("No items found in this invoice");
                    await Application.Current.MainPage.DisplayAlert("Warning", "No items found in this invoice", "OK");
                    return;
                }

                Debug.WriteLine($"Found {invoiceItems.Count} items in invoice:");

                var invoiceData = new
                {
                    InvoiceHeader = new
                    {
                        InvoiceNum = invoice.InvoiceNum,
                        InvoiceId = invoice.ID,
                        InvoiceDate = invoice.DateCreated.ToString("yyyy-MM-ddTHH:mm:ss"),
                        InvoiceType = invoice.InvoiceTypeID,
                        TotalAmount = invoice.Total
                    },
                    Items = invoiceItems.Select(i => new
                    {
                        ItemId = i.ItemID,
                        Quantity = i.Quantity,
                      
                        UnitPrice = i.Price,
                        TotalPrice = i.TotalNet
                    }).ToList()
                };

                string jsonData = JsonConvert.SerializeObject(invoiceData);
                Debug.WriteLine($"JSON Data: {jsonData}");

                var apiClient = new Api.HttpHelper(
                    apiKey: "12345-ABCDE-67890-FGHIJ",
                    secretKey: "S3cr3tK3y!@#2023"
                );

                string url = "https://d572-213-204-95-97.ngrok-free.app/api/InvoiceData";

                try
                {
                    string response = await apiClient.PostResponse(url, jsonData,
                        connectionData.ServerName,
                        connectionData.DatabaseName,
                        connectionData.Username,
                        connectionData.Password,
                        connectionData.Year);

                    Debug.WriteLine($"Raw API Response: {response}");

                   
                    if (response.TrimStart().StartsWith("<"))
                    {
                        Debug.WriteLine("Response appears to be HTML/XML instead of JSON");
                        await Application.Current.MainPage.DisplayAlert("API Error",
                            "The server returned HTML instead of JSON. This may indicate a server error or incorrect endpoint.", "OK");
                        return;
                    }

                    try
                    {
                        var result = JsonConvert.DeserializeObject<dynamic>(response);

                        if (result?.success == true)
                        {
                            await Application.Current.MainPage.DisplayAlert("Success", $"Invoice created successfully! Invoice ID: {result.InvoiceID}", "OK");
                        }
                        else
                        {
                            string errorMessage = result?.message ?? "Unknown error occurred";
                            Debug.WriteLine($"API Error: {errorMessage}");
                            await Application.Current.MainPage.DisplayAlert("Error", errorMessage, "OK");
                        }
                    }
                    catch (JsonReaderException jex)
                    {
                        Debug.WriteLine($"JSON Parsing Error: {jex.Message}");
                        Debug.WriteLine($"Response Content: {response}");
                        await Application.Current.MainPage.DisplayAlert("API Error",
                            $"The server returned an invalid JSON response. Details: {jex.Message}", "OK");
                    }
                }
                catch (HttpRequestException hex)
                {
                    Debug.WriteLine($"HTTP Request Error: {hex.Message}");
                    await Application.Current.MainPage.DisplayAlert("Connection Error",
                        "Could not connect to the server. Please check your internet connection.", "OK");
                }
                catch (Exception ex)
                {
                    Debug.WriteLine($"Unexpected error during API call: {ex.Message}");
                    await Application.Current.MainPage.DisplayAlert("Error",
                        $"An unexpected error occurred: {ex.Message}", "OK");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in SendInvoiceData: {ex.Message}");
                Debug.WriteLine($"Stack Trace: {ex.StackTrace}");
                await Application.Current.MainPage.DisplayAlert("Error",
                    $"An unexpected error occurred: {ex.Message}", "OK");
            }
        }
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
