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

namespace store.ViewModels
{
    public class ExportData : INotifyPropertyChanged
    {
        
        private readonly ExportedRakEntity _exportedRakEntity;
        private readonly ExportedSectionEntity _exportedSectionEntity;
        


        public ObservableCollection<KeyValuePair<string, List<string>>> RaksWithSections { get; set; }

        public ExportData()
        {
            RaksWithSections = new ObservableCollection<KeyValuePair<string, List<string>>>();
           
            _exportedRakEntity = new ExportedRakEntity();
            _exportedSectionEntity = new ExportedSectionEntity();
            LoadExports();
            ExportAllInOne = new Command<string>(ExportSections);
            ExporttxtCommand = new Command<string>(sectiondebug);
            ExportOneByOne = new Command<string>(ExportTxt);
           
          

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
                        await writer.WriteLineAsync($"{itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.Unit}");
                        Debug.WriteLine($"Written to file: {itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.Unit}");
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
                        await writer.WriteLineAsync($"{itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.Unit}");
                        Debug.WriteLine($"Written to file: {itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.Unit}");
                    }
                }

                await Application.Current.MainPage.DisplayAlert("Success", "Folders and file created successfully!", "OK");


            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }

        private async void sectiondebug( string sectionName)
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

            // Check if SectionFolder exists
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
                    await writer.WriteLineAsync($"{itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.Unit}");
                    Debug.WriteLine($"Written to file: {itemCard.ScanningNum},{itemCard.ItemName}, Quantity: {itemCard.Quantity},{itemCard.Unit}");
                }
            }

            await Application.Current.MainPage.DisplayAlert("Success", "Folders and file created successfully!", "OK");



            Debug.WriteLine($"Export button tapped Section: {sectionName}");
        }
        private async Task LoadExports()
        {
            var raksFromDb = await _exportedRakEntity.GetRaksWithSections();
            foreach (var rakWithSections in raksFromDb)
            {
                Debug.WriteLine($"Adding Rak: {rakWithSections.Key} with Sections: {string.Join(", ", rakWithSections.Value)}");
                RaksWithSections.Add(rakWithSections);
            }

        }


       


      


        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}