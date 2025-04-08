using Microsoft.EntityFrameworkCore;
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
    public class InventoryNoDataViewModel: INotifyPropertyChanged
    {

        private readonly RakInventoryEntity rakInventoryEntity;
        private readonly SectionInventoryEntity sectionInventoryEntity;
        private string _entryName;
        public string EntryName
        {
            get => _entryName;
            set
            {
                if (_entryName != value)
                {
                    _entryName = value;
                    OnPropertyChanged(nameof(EntryName));
                }
            }
        }


        private ObservableCollection<RakInventory> _inventoryItems;
        public ObservableCollection<RakInventory> InventoryItems
        {
            get => _inventoryItems;
            set
            {
                _inventoryItems = value;
                OnPropertyChanged(nameof(InventoryItems));
            }
        }

        private ObservableCollection<SectionInventory> _sectionItems;
        public ObservableCollection<SectionInventory> SectionItems
        {
            get => _sectionItems;
            set
            {
                _sectionItems = value;
                OnPropertyChanged(nameof(SectionItems));
            }
        }


        public InventoryNoDataViewModel()
        {
            rakInventoryEntity=new RakInventoryEntity();
            sectionInventoryEntity=new SectionInventoryEntity();
           
        }
        public enum InventoryType { Rak, Section }
        public async Task LoadInventoryItems(InventoryType type, int rakId = 0)
        {
            switch (type)
            {
                case InventoryType.Rak:
                    var raks = await rakInventoryEntity.GetAllRaks();
                    InventoryItems = new ObservableCollection<RakInventory>(raks);
                    break;

                case InventoryType.Section:
                    var sections = await sectionInventoryEntity.GetSections(rakId);
                    SectionItems = new ObservableCollection<SectionInventory>(sections);
                    break;
            }
        }



        public async Task<bool> SaveRakData()
        {
            if (string.IsNullOrWhiteSpace(EntryName))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "RakName cannot be empty", "OK");
                return false;
            }

            bool exists = await rakInventoryEntity.RakNameExists(EntryName);
            Debug.WriteLine($"Checking existence for '{EntryName}': {exists}");

            if (exists)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "RakName already exists.", "OK");
                return false;
            }
            else
            {
                var rak = new RakInventory
                {
                    RakName = EntryName,
                    DateCreated = DateTime.Now
                };

                await rakInventoryEntity.AddData(rak);
                Debug.WriteLine($"Added Rak: {EntryName}");
                             
                return true;
            }
        }

        public async Task<bool> SaveSectionData(int _rakID)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(EntryName))
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "SectionName cannot be empty", "OK");
                    return false;
                }

                Debug.WriteLine($"SectionName: {EntryName}, RakID: {_rakID}");

                if (_rakID <= 0)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Invalid RakID", "OK");
                    return false;
                }

                var rakExists = await rakInventoryEntity.RakIDExist(_rakID);
                if (!rakExists)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "RakID does not exist in the database", "OK");
                    return false;
                }

                bool exist = await sectionInventoryEntity.SectionNameExist(EntryName);
                if (exist)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "SectionName already exists", "OK");
                    return false;
                }

                var section = new SectionInventory
                {
                    SectionName = EntryName,
                    RakID = _rakID
                };

                Debug.WriteLine($"Saving Section: {EntryName}, RakID: {_rakID}");

                await sectionInventoryEntity.AddData(section);
              
           
                return true;
            }
            catch (DbUpdateException ex)
            {
                Debug.WriteLine($"DbUpdateException: {ex.InnerException?.Message}");
                await Application.Current.MainPage.DisplayAlert("Error", "An error occurred while saving data.", "OK");
                return false;
            }
        }
        public async Task<bool> DeleteRak(int RakID)
        {
            await rakInventoryEntity.DeleteRak(RakID);
            return true;

        }

        public async Task<bool> DeleteSection(int SectionID)
        {
            await sectionInventoryEntity.DeletSection(SectionID);
            return true;
        }

      



        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
