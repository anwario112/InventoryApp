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
    public class ItemCardArchiveViewModel : INotifyPropertyChanged
    {
        private readonly ItemArchiveEntity itemArchiveEntity;
        private readonly ItemCardEntity itemCardEntity;
        public ObservableCollection<ItemArchive> ItemArchive { get; set; }

        public ItemCardArchiveViewModel()
        {
            itemArchiveEntity = new ItemArchiveEntity();
            itemCardEntity = new ItemCardEntity();
            ItemArchive = new ObservableCollection<ItemArchive>();
            LoadExports();
            DeleteArchive= new Command<ItemArchive>(DeleteArchiveData);
            RestoreArchive = new Command<ItemArchive>(RestoreArchiveData);
        }

        public ICommand DeleteArchive { get; }
        public ICommand RestoreArchive { get; }

        private async void LoadExports()
        {
            var archiveFromDb = await itemArchiveEntity.GetAllData();
            foreach (var archive in archiveFromDb)
            {
                ItemArchive.Add(archive);
            }
        }

        private async void DeleteArchiveData(ItemArchive archive) 
        {
           
            if (archive != null)
            {
                
                bool isDeleted = await itemArchiveEntity.DeleteByItemName(archive.ItemName);

                if (isDeleted)
                {
                    
                    ItemArchive.Remove(archive);
                }
                else
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Failed to delete export.", "OK");
                }
            }
        }

        private async void RestoreArchiveData(ItemArchive archive)
        { 
             if(archive != null)
            {
                var newItemCard = new ItemCard
                {
                    ScanningNum = archive.ScanningNum,
                    ItemName = archive.ItemName,
                    Quantity = archive.Quantity,
                    Unit = archive.Unit,
                    SectionID = archive.SectionID 
                };
                await itemCardEntity.AddData(newItemCard);
                await itemArchiveEntity.DeleteByItemName(archive.ItemName);
                ItemArchive.Remove(archive);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}