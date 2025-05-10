using store.Data;
using store.Models;
using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.ApplicationModel;
using Newtonsoft.Json;


namespace store.ViewModels
{
    public class ExportData : INotifyPropertyChanged
    {
        
        private readonly ExportedRakEntity _exportedRakEntity;
        private readonly ExportedSectionEntity _exportedSectionEntity;
        private readonly ExportedRakInventoryEntity _exportedRakInventoryEntity;
        private readonly ExportedSectionInventoryEntity exportedSectionInventoryEntity;
        private readonly ConnectionEntity _connectionEntity;
        private readonly InvoiceEntity invoiceEntity;
        private readonly InvoiceDetailsEntity invoiceDetailsEntity;



       

        public ObservableCollection<KeyValuePair<string, List<string>>> RaksWithSections { get; set; }
        public ObservableCollection<KeyValuePair<string, List<string>>> InventoryNoDataItems { get; set; }


        private Dictionary<string, bool> _exportedRaks;

        public Dictionary<string, bool> ExportedRaks
        {
            get { return _exportedRaks; }
            set
            {
                if (_exportedRaks != value)
                {
                    _exportedRaks = value;
                    Debug.WriteLine($"ExportedRaks property changed, count: {_exportedRaks?.Count}");
                    OnPropertyChanged(nameof(ExportedRaks));
                }
            }
        }

     
        public ObservableCollection<string> ExportedRaksList { get; set; }




        public ExportData()
        {
            RaksWithSections = new ObservableCollection<KeyValuePair<string, List<string>>>();
            InventoryNoDataItems = new ObservableCollection<KeyValuePair<string, List<string>>>();

            _exportedRaks = new Dictionary<string, bool>();
            ExportedRaksList = new ObservableCollection<string>();

            _exportedRakEntity = new ExportedRakEntity();
            _exportedSectionEntity = new ExportedSectionEntity();
            _exportedRakInventoryEntity = new ExportedRakInventoryEntity();
            exportedSectionInventoryEntity = new ExportedSectionInventoryEntity();
            _connectionEntity = new ConnectionEntity();
            invoiceEntity = new InvoiceEntity();
            invoiceDetailsEntity = new InvoiceDetailsEntity();
            ExportedRaks = new Dictionary<string, bool>();

            LoadExports();
            LoadExportsInventory();
            ExportAllInOne = new Command<string>(ExportSections);
            ExporttxtCommand = new Command<string>(sectionTxt);
            ExportOneByOne = new Command<string>(ExportTxt);
            ExportAllInOneInventory = new Command<string>(ExportSectionsInventory);
            ExportOneByOneInventory = new Command<string>(ExportTxtInventory);
            ExporttxtCommandInventory = new Command<string>(sectiondeTxtInventory);
            ExportToDatabase = new Command<string>(ExportToDatabse);
          
        }


        private async Task<bool> CheckAndRequestStoragePermission()
        {
            var status = await Permissions.CheckStatusAsync<Permissions.StorageWrite>();
            Debug.WriteLine($"Current permission status: {status}");

            if (status != PermissionStatus.Granted)
            {
                
                status = await Permissions.RequestAsync<Permissions.StorageWrite>();
                Debug.WriteLine($"Requested permission status: {status}");
            }
            return status == PermissionStatus.Granted;
        }

        
        public ICommand ExporttxtCommand { get; }
        public ICommand ExportOneByOne { get; }
        public ICommand ExportAllInOne { get; }
        public ICommand DeleteExport { get; }
        public ICommand selectTxt { get; }
        public ICommand ExportToDatabase { get; set; }

        public ICommand ExportOneByOneInventory { get; }
        public ICommand ExportAllInOneInventory { get; }
        public ICommand ExporttxtCommandInventory { get; }


       
      

        private async void ExportTxt(string rakName)
        {
            var sections =await _exportedRakEntity.GetSectionsByRakName(rakName);




            bool hasPermission = await CheckAndRequestStoragePermission();
            if (!hasPermission)
            {
                await Application.Current.MainPage.DisplayAlert("Permission Denied", "Storage permission is required to create folders and files.", "OK");
                return;
            }


            string documentsPath = string.Empty;

#if ANDROID
            documentsPath = Path.Combine(Android.OS.Environment.GetExternalStoragePublicDirectory(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "Documents");
#else
                documentsPath = Path.Combine(FileSystem.AppDataDirectory, "Documents");
#endif


            string rakFolderPath = Path.Combine(documentsPath, rakName);
            Directory.CreateDirectory(rakFolderPath);

            if (!Directory.Exists(rakFolderPath))
            {
                Debug.WriteLine("RakFolder does not exist. Creating...");
                Directory.CreateDirectory(rakFolderPath);
            }
            else
            {
                Debug.WriteLine("RakFolder already exists.");
            }


            foreach (var section in sections)
            {
                var cards = await _exportedSectionEntity.GetAllCardsForSectionName(section);
                Debug.WriteLine($"card for section:{cards.Count}");


                string sectionFolderPath = Path.Combine(rakFolderPath, section);
                Directory.CreateDirectory(sectionFolderPath);

                if (!Directory.Exists(sectionFolderPath))
                {
                    Debug.WriteLine("SectionFolder does not exist. Creating...");
                    Directory.CreateDirectory(sectionFolderPath);
                }
                else
                {
                    Debug.WriteLine("SectionFolder already exists.");
                }

                string filePath = Path.Combine(sectionFolderPath, "ItemCards.txt");
                Debug.WriteLine($"File Path: {filePath}");

                using (StreamWriter writer = new StreamWriter(filePath))
                {
                    foreach (var itemCard in cards)
                    {
                        await writer.WriteLineAsync($"{itemCard.ScanningNum}, {itemCard.Quantity}");
                        Debug.WriteLine($"Written to file: {itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.UnitID}");
                    }
                }

            }
            await Application.Current.MainPage.DisplayAlert("Success", "Folders and file created successfully!", "OK");


        }

        private async void ExportSections(string rakName)
        {
            try
            {
                Console.WriteLine($"Starting ExportSections with rakName: {rakName}");

                var sections = await _exportedRakEntity.GetSectionsByRakName(rakName);
                Console.WriteLine($"Retrieved sections: {string.Join(", ", sections)}");

                var cards = await _exportedSectionEntity.GetAllCardsFromAllSections(sections);



                bool hasPermission = await CheckAndRequestStoragePermission();
                if (!hasPermission)
                {
                    await Application.Current.MainPage.DisplayAlert("Permission Denied", "Storage permission is required to create folders and files.", "OK");
                    return;
                }


                string documentsPath = string.Empty;

#if ANDROID
                documentsPath = Path.Combine(Android.OS.Environment.GetExternalStoragePublicDirectory(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "Documents");
#else
                documentsPath = Path.Combine(FileSystem.AppDataDirectory, "Documents");
#endif


                string rakFolderPath = Path.Combine(documentsPath, rakName);
                Directory.CreateDirectory(rakFolderPath);


                string AllInOnePath = Path.Combine(rakFolderPath, "AllInOne");
                Directory.CreateDirectory(AllInOnePath);


                if (!Directory.Exists(rakFolderPath))
                {
                    Debug.WriteLine("RakFolder does not exist. Creating...");
                    Directory.CreateDirectory(rakFolderPath);
                }
                else
                {
                    Debug.WriteLine("RakFolder already exists.");
                }


             
                if (!Directory.Exists(AllInOnePath))
                {
                    Debug.WriteLine("SectionFolder does not exist. Creating...");
                    Directory.CreateDirectory(AllInOnePath);
                }
                else
                {
                    Debug.WriteLine("SectionFolder already exists.");
                }

                string filePath = Path.Combine(AllInOnePath, "ItemCards.txt");
                Debug.WriteLine($"File Path: {filePath}");



                using (StreamWriter writer = new StreamWriter(filePath))
                {
                    foreach (var itemCard in cards)
                    {
                        await writer.WriteLineAsync($"{itemCard.ScanningNum},{itemCard.Quantity}");
                        Debug.WriteLine($"Written to file: {itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.UnitID}");
                    }
                }

                await Application.Current.MainPage.DisplayAlert("Success", "Folders and file created successfully!", "OK");


            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }

        private async void sectionTxt( string sectionName)
        {
            var RakName = await _exportedSectionEntity.GetRakNameBySectionName(sectionName);
            var CardList = await _exportedSectionEntity.GetCardsBySectionName(sectionName);





            bool hasPermission = await CheckAndRequestStoragePermission();
            if (!hasPermission)
            {
                await Application.Current.MainPage.DisplayAlert("Permission Denied", "Storage permission is required to create folders and files.", "OK");
                return;
            }


            string documentsPath = string.Empty;

#if ANDROID
            documentsPath = Path.Combine(Android.OS.Environment.GetExternalStoragePublicDirectory(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "Documents");
#else
                documentsPath = Path.Combine(FileSystem.AppDataDirectory, "Documents");
#endif



            string rakFolderPath = Path.Combine(documentsPath, RakName);

            Directory.CreateDirectory(rakFolderPath);


            

            string sectionFolderPath = Path.Combine(rakFolderPath, sectionName);

            Directory.CreateDirectory(sectionFolderPath);






            if (!Directory.Exists(rakFolderPath))
            {
                Debug.WriteLine("RakFolder does not exist. Creating...");
                Directory.CreateDirectory(rakFolderPath);
            }
            else
            {
                Debug.WriteLine("RakFolder already exists.");
            }

            if (!Directory.Exists(sectionFolderPath))
            {
                Debug.WriteLine("SectionFolder does not exist. Creating...");
                Directory.CreateDirectory(sectionFolderPath);
            }
            else
            {
                Debug.WriteLine("SectionFolder already exists.");
            }

            string filePath = Path.Combine(sectionFolderPath, "ItemCards.txt");
            Debug.WriteLine($"File Path: {filePath}");



            using (StreamWriter writer = new StreamWriter(filePath))
            {
                foreach (var itemCard in CardList)
                {
                    await writer.WriteLineAsync($"{itemCard.ScanningNum},{itemCard.Quantity}");
                    Debug.WriteLine($"Written to file: {itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.UnitID}");
                }
            }

            await Application.Current.MainPage.DisplayAlert("Success", "Folders and file created successfully!", "OK");



            Debug.WriteLine($"Export button tapped Section: {sectionName}");
        }

        private bool CanExportToDatabase(string rakName)
        {
            bool canExport = !IsRakExported(rakName);
            Debug.WriteLine($"CanExportToDatabase for {rakName}: {canExport}");
            return canExport;
        }

     
        public bool IsRakExported(string rakName)
        {
            bool isExported = _exportedRaks.ContainsKey(rakName) && _exportedRaks[rakName];
            Debug.WriteLine($"IsRakExported for {rakName}: {isExported}");
            return isExported;
        }

        public async void ExportToDatabse(string rakName)
        {
            try
            {
               
                var connectionData = await _connectionEntity.FetchConnectionData();
                if (connectionData == null)
                {
                    Debug.WriteLine("Connection data is null. Cannot proceed with API request.");
                    await Application.Current.MainPage.DisplayAlert("Error", "Connection data is missing. Please check your settings.", "OK");
                    
                    return;
                }

                Debug.WriteLine($"Starting export for: {rakName}");
                var sections = await _exportedRakEntity.GetSectionsByRakName(rakName);

                List<Models.ExportedCard> AllCards = new List<Models.ExportedCard>();
                foreach (var section in sections)
                {
                    var cards = await _exportedSectionEntity.GetAllCardsForSectionName(section);
                    AllCards.AddRange(cards);
                }

                if (AllCards.Count == 0)
                {
                    await Application.Current.MainPage.DisplayAlert("No Data", "No cards found to export.", "OK");
                    return;
                }

                var invoiceData = new
                {
                    InvoiceNum = new Random().Next(10000, 100000),
                    InvoiceDate = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss"),
                    InvoiceTypeID = 27,
                    TotalString = AllCards.Sum(c => c.Quantity * (float.TryParse(c.Price, out float Price) ? Price : 0)).ToString(),
                    InvoiceItems = AllCards.Select(card => new
                    {
                        ItemId = card.ItemID,
                        Barcode = card.ScanningNum,
                        ItemName = card.ItemName,
                        Quantity = card.Quantity,
                        UnitID = card.UnitID,
                        Price = decimal.TryParse(card.Price, out decimal price) ? price : 0,
                        Total = card.Quantity * (float.TryParse(card.Price, out float ItemPrice) ? ItemPrice : 0)
                    }).ToList(),
                };

                    var invoice = new Invoice
                    {
                        InvoiceNum=invoiceData.InvoiceNum,
                        DateCreated = DateTime.Parse(invoiceData.InvoiceDate),
                        InvoiceTypeID = invoiceData.InvoiceTypeID,
                        Total=invoiceData.TotalString,
                        Status="sent"

                    };
               var invoiceID= await invoiceEntity.AddDataInvoice(invoice);
                Debug.WriteLine($"data is inserted into invoice");


                foreach(var item in invoiceData.InvoiceItems)
                {
                    var invoiceDetail = new InvoiceDetails
                    {
                        InvoiceID = invoiceID,
                        ItemID=int.Parse(item.ItemId),
                        Quantity=item.Quantity.ToString(),
                        UnitID=item.UnitID,
                        Price=item.Price.ToString(),
                        TotalNet=item.Total.ToString()
                        

                    };
                    await invoiceDetailsEntity.AddData(invoiceDetail);
                    
                }
                Debug.WriteLine($"success inserted into invoicedetail");


                Debug.WriteLine("SIMULATING SUCCESSFUL API RESPONSE");
                _exportedRaks[rakName] = true;
                ExportedRaksList.Add(rakName);
                Debug.WriteLine($"Marked {rakName} as exported. Dictionary now has {_exportedRaks.Count} items.");
                OnPropertyChanged(nameof(ExportedRaks));
                OnPropertyChanged(nameof(ExportedRaksList));
                ((Command<string>)ExportToDatabase).ChangeCanExecute();
                await Application.Current.MainPage.DisplayAlert("Success", $"Invoice created successfully! (SIMULATED)", "OK");
                return;


                string JsonData = Newtonsoft.Json.JsonConvert.SerializeObject(invoiceData);
                Debug.WriteLine($"JSON Data: {JsonData}");

                var apiClient = new Api.HttpHelper(
                    apiKey: "12345-ABCDE-67890-FGHIJ",
                    secretKey: "S3cr3tK3y!@#2023"
                );

                string url = "http://192.168.1.9:8000/api/InvoiceData";

                try
                {
                    string response = await apiClient.PostResponse(url, JsonData,
                        connectionData.ServerName,
                        connectionData.DatabaseName,
                        connectionData.Username,
                        connectionData.Password,
                        connectionData.Year);

                
                    Debug.WriteLine($"Raw API Response: {response}");

                    try
                    {
                        var result = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(response);
                        bool success = false;
                        try
                        {
                            success = result?.success == true;
                            Debug.WriteLine($"API success parsed as: {success}");
                        }
                        catch
                        {
                            Debug.WriteLine("Could not parse success property");
                        }

                        if (result.success == true)
                        {
                            Debug.WriteLine($"API SUCCESS - Marking {rakName} as exported");
                            _exportedRaks[rakName] = true;
                            ExportedRaksList.Add(rakName);

                         
                            Debug.WriteLine("Triggering property changed events");
                            OnPropertyChanged(nameof(ExportedRaks));
                            OnPropertyChanged(nameof(ExportedRaksList));

                        
                            ((Command<string>)ExportToDatabase).ChangeCanExecute();

                          
                            await Application.Current.MainPage.DisplayAlert("Success", $"Invoice created successfully! Invoice ID: {result.InvoiceID}", "OK");

                        
                            foreach (var kvp in _exportedRaks)
                            {
                                Debug.WriteLine($"ExportedRaks: {kvp.Key} = {kvp.Value}");
                            }
                        }
                        else
                        {
                            string errorMessage = result.message ?? "Unknown error occurred";
                            Debug.WriteLine($"API Error: {errorMessage}");
                            await Application.Current.MainPage.DisplayAlert("Error", errorMessage, "OK");
                        }
                    }
                    catch (JsonReaderException jex)
                    {
                        Debug.WriteLine($"JSON Parsing Error: {jex.Message}");
                        Debug.WriteLine($"Response Content: {response}");
                        await Application.Current.MainPage.DisplayAlert("API Error", $"The server returned an unexpected response. Please check the API endpoint. Details: {jex.Message}", "OK");
                    }
                }
                catch (HttpRequestException hrex)
                {
                    Debug.WriteLine($"HTTP Request Error: {hrex.Message}");
                    await Application.Current.MainPage.DisplayAlert("Network Error", $"Failed to connect to the server: {hrex.Message}", "OK");
                }
                catch (Exception ex)
                {
                    Debug.WriteLine($"API Error: {ex}");
                    await Application.Current.MainPage.DisplayAlert("API Error", $"Failed to process API response: {ex.Message}", "OK");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in ExportToDatabase: {ex}");
                await Application.Current.MainPage.DisplayAlert("Error", $"Failed to export data: {ex.Message}", "OK");
            }
            finally
            {
            }
        }
        private async Task LoadExports()
        {
            Debug.WriteLine("LoadExports started");
            var raksFromDb = await _exportedRakEntity.GetRaksWithSections();

            foreach (var rakWithSections in raksFromDb)
            {
                Debug.WriteLine($"Adding Rak: {rakWithSections.Key} with Sections: {string.Join(", ", rakWithSections.Value)}");
                RaksWithSections.Add(rakWithSections);

                if (!_exportedRaks.ContainsKey(rakWithSections.Key))
                {
                    _exportedRaks[rakWithSections.Key] = false;
                    Debug.WriteLine($"Initialized {rakWithSections.Key} as not exported");
                }
            }

            Debug.WriteLine($"LoadExports completed, ExportedRaks count: {_exportedRaks.Count}");
        }

        private async Task LoadExportsInventory()
        {
            var RakFromDb = await _exportedRakInventoryEntity.GetRaksWithSections();
            foreach (var rakWithSections in RakFromDb)
            {
                Debug.WriteLine($"Adding Rak: {rakWithSections.Key} with Sections: {string.Join(", ", rakWithSections.Value)}");
                InventoryNoDataItems.Add(rakWithSections);
            }
        }



        private async void ExportSectionsInventory(string rakName)
        {
            try
            {
                Console.WriteLine($"Starting ExportSections with rakName: {rakName}");

                var sections = await _exportedRakInventoryEntity.GetSectionsByRakName(rakName);
                Console.WriteLine($"Retrieved sections: {string.Join(", ", sections)}");

                var cards = await exportedSectionInventoryEntity.GetAllCardsFromAllSections(sections);



                bool hasPermission = await CheckAndRequestStoragePermission();
                if (!hasPermission)
                {
                    await Application.Current.MainPage.DisplayAlert("Permission Denied", "Storage permission is required to create folders and files.", "OK");
                    return;
                }


                string documentsPath = string.Empty;

#if ANDROID
                documentsPath = Path.Combine(Android.OS.Environment.GetExternalStoragePublicDirectory(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "Documents");
#else
                documentsPath = Path.Combine(FileSystem.AppDataDirectory, "Documents");
#endif


                string rakFolderPath = Path.Combine(documentsPath, rakName);
                Directory.CreateDirectory(rakFolderPath);


                string AllInOnePath = Path.Combine(rakFolderPath, "AllInOne");
                Directory.CreateDirectory(AllInOnePath);


                if (!Directory.Exists(rakFolderPath))
                {
                    Debug.WriteLine("RakFolder does not exist. Creating...");
                    Directory.CreateDirectory(rakFolderPath);
                }
                else
                {
                    Debug.WriteLine("RakFolder already exists.");
                }



                if (!Directory.Exists(AllInOnePath))
                {
                    Debug.WriteLine("SectionFolder does not exist. Creating...");
                    Directory.CreateDirectory(AllInOnePath);
                }
                else
                {
                    Debug.WriteLine("SectionFolder already exists.");
                }

                string filePath = Path.Combine(AllInOnePath, "ItemCards.txt");
                Debug.WriteLine($"File Path: {filePath}");



                using (StreamWriter writer = new StreamWriter(filePath))
                {
                    foreach (var itemCard in cards)
                    {
                        await writer.WriteLineAsync($"{itemCard.ScanningNum},{itemCard.Quantity}");
                        Debug.WriteLine($"Written to file: {itemCard.ScanningNum}, Quantity: {itemCard.Quantity.ToString("0.####")}");
                    }
                }

                await Application.Current.MainPage.DisplayAlert("Success", "Folders and file created successfully!", "OK");


            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }



        private async void ExportTxtInventory(string rakName)
        {
            var sections = await _exportedRakInventoryEntity.GetSectionsByRakName(rakName);




            bool hasPermission = await CheckAndRequestStoragePermission();
            if (!hasPermission)
            {
                await Application.Current.MainPage.DisplayAlert("Permission Denied", "Storage permission is required to create folders and files.", "OK");
                return;
            }


            string documentsPath = string.Empty;

#if ANDROID
            documentsPath = Path.Combine(Android.OS.Environment.GetExternalStoragePublicDirectory(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "Documents");
#else
            documentsPath = Path.Combine(FileSystem.AppDataDirectory, "Documents");
#endif


            string rakFolderPath = Path.Combine(documentsPath, rakName);
            Directory.CreateDirectory(rakFolderPath);

            if (!Directory.Exists(rakFolderPath))
            {
                Debug.WriteLine("RakFolder does not exist. Creating...");
                Directory.CreateDirectory(rakFolderPath);
            }
            else
            {
                Debug.WriteLine("RakFolder already exists.");
            }


            foreach (var section in sections)
            {
                var cards = await exportedSectionInventoryEntity.GetAllCardsFromAllSections(sections);
                Debug.WriteLine($"card for section:{cards.Count}");


                string sectionFolderPath = Path.Combine(rakFolderPath, section);
                Directory.CreateDirectory(sectionFolderPath);

                if (!Directory.Exists(sectionFolderPath))
                {
                    Debug.WriteLine("SectionFolder does not exist. Creating...");
                    Directory.CreateDirectory(sectionFolderPath);
                }
                else
                {
                    Debug.WriteLine("SectionFolder already exists.");
                }

                string filePath = Path.Combine(sectionFolderPath, "ItemCards.txt");
                Debug.WriteLine($"File Path: {filePath}");

                using (StreamWriter writer = new StreamWriter(filePath))
                {
                    foreach (var itemCard in cards)
                    {
                        await writer.WriteLineAsync($"{itemCard.ScanningNum}, {itemCard.Quantity}");
                        Debug.WriteLine($"Written to file: {itemCard.ScanningNum}, Quantity: {itemCard.Quantity.ToString("0.####")}");
                    }
                }

            }
            await Application.Current.MainPage.DisplayAlert("Success", "Folders and file created successfully!", "OK");


        }


        private async void sectiondeTxtInventory(string sectionName)
        {
            try
            {
               
                var rakName = await exportedSectionInventoryEntity.GetRakNameBySectionName(sectionName);
                var cardList = await exportedSectionInventoryEntity.GetCardsBySectionName(sectionName);

                if (cardList == null || cardList.Count == 0)
                {
                    await Application.Current.MainPage.DisplayAlert("No Data", $"No cards found for section '{sectionName}'", "OK");
                    return;
                }

              
                bool hasPermission = await CheckAndRequestStoragePermission();
                if (!hasPermission)
                {
                    await Application.Current.MainPage.DisplayAlert("Permission Denied", "Storage permission is required to create folders and files.", "OK");
                    return;
                }

               
                string documentsPath = string.Empty;
#if ANDROID
        documentsPath = Path.Combine(Android.OS.Environment.GetExternalStoragePublicDirectory(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "Documents");
#else
                documentsPath = Path.Combine(FileSystem.AppDataDirectory, "Documents");
#endif

              
                string sanitizedRakName = SanitizeFileNamePath(rakName);
                string sanitizedSectionName = SanitizeFileNamePath(sectionName);

              
                string timestamp = DateTime.Now.ToString("yyyyMMdd_HHmmss");

                string exportsFolder = Path.Combine(documentsPath, "Inventory_Exports");
                string rakFolderPath = Path.Combine(exportsFolder, sanitizedRakName);
                string sectionFolderPath = Path.Combine(rakFolderPath, sanitizedSectionName);

              
                Directory.CreateDirectory(exportsFolder);
                Directory.CreateDirectory(rakFolderPath);
                Directory.CreateDirectory(sectionFolderPath);

             
                string fileName = $"ItemCards_{timestamp}.txt";
                string filePath = Path.Combine(sectionFolderPath, fileName);
                Debug.WriteLine($"File Path: {filePath}");

             
                using (StreamWriter writer = new StreamWriter(filePath))
                {
                  
                   

                    foreach (var itemCard in cardList)
                    {
                        await writer.WriteLineAsync($"{itemCard.ScanningNum},{itemCard.Quantity}");
                        Debug.WriteLine($"Written to file: {itemCard.ScanningNum}, Quantity: {itemCard.Quantity.ToString("0.#####")}");
                    }
                }

                await Application.Current.MainPage.DisplayAlert("Success", $"Export completed successfully!\nSaved to: {filePath}", "OK");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in sectiondeTxtInventory: {ex.Message}");
                await Application.Current.MainPage.DisplayAlert("Error", $"Failed to export section data: {ex.Message}", "OK");
            }
        }

       
        private string SanitizeFileNamePath(string fileName)
        {
            if (string.IsNullOrEmpty(fileName))
                return "Unknown";

         
            char[] invalidChars = Path.GetInvalidFileNameChars();
            foreach (char c in invalidChars)
            {
                fileName = fileName.Replace(c, '_');
            }

            return fileName.Trim();
        }


        public async Task DeleteRak(string rakName)
        {
            bool deleted = await _exportedRakInventoryEntity.DeleteByRakName(rakName);
            if (deleted)
            {
             
                InventoryNoDataItems.Clear();
                await LoadExportsInventory();

                await Application.Current.MainPage.DisplayAlert("Success", "Rak is deleted", "OK");
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Failed to delete rak", "OK");
            }
        }



        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}