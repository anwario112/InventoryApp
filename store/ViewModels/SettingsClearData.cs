using store.Data;
using store.Models;
using store.View;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Collections.Specialized.BitVector32;

namespace store.ViewModels
{
    public class SettingsClearData: INotifyPropertyChanged
    {

        private readonly ClearDataEntity clearDataEntity;
        private readonly ItemCardEntity itemCardEntity;
        private readonly ItemArchiveEntity _itemArchiveEntity;
        private readonly TransferData _transferData;

        private string _password;
        public string Password
        {
            get => _password;
            set
            {

                _password = value;

                OnPropertyChanged(nameof(Password));

            }

        }

        public SettingsClearData()
        {
            clearDataEntity = new ClearDataEntity();
            itemCardEntity = new ItemCardEntity();
            _itemArchiveEntity = new ItemArchiveEntity();
        }


        public async Task SavePassword()
        {
            try
            {
             
                var existingData = await clearDataEntity.GetAllData();

                if (existingData == null || existingData.Count == 0)
                {
                    
                    var clearData = new ClearData
                    {
                        Password = Password
                    };
                    await clearDataEntity.AddData(clearData);
                    Debug.WriteLine($"Password saved: {Password}");
                }
                else
                {
                  
                    var clearData = existingData.First(); 
                    clearData.Password = Password; 
                    await clearDataEntity.UpdateData(clearData);
                    Debug.WriteLine($"Password updated: {Password}");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error saving password: {ex.Message}");
              
            }
        }

        public async Task CheckPasswordAndDeleteCards(int sectionID)
        {
            try
            {
               
                var existingData = await clearDataEntity.GetAllData(); 

                if (existingData != null && existingData.Count > 0)
                {
                    var storedPassword = existingData.First().Password; 

                    if (Password == storedPassword)
                    {
                        
                        var itemCards = await itemCardEntity.GetItemCardsBySectionID(sectionID);

                        if (itemCards != null && itemCards.Any())
                        {
                            var itemArchives = new List<ItemArchive>();

                            foreach (var card in itemCards)
                            {
                                var itemArchive = new ItemArchive
                                {
                                    ScanningNum = card.ScanningNum,
                                    ItemName = card.ItemName,
                                    Quantity = card.Quantity,
                                    Unit = card.Unit,
                                    SectionID = card.SectionID
                                };

                                itemArchives.Add(itemArchive);
                            }

                            await _itemArchiveEntity.AddDataRange(itemArchives);
                            Debug.WriteLine("Item cards archived successfully.");

                            await itemCardEntity.DeleteCardsBySectionID(sectionID);
                            Debug.WriteLine($"Item cards deleted successfully for section ID: {sectionID}");
                            MessagingCenter.Send(this, "DataCleared", sectionID);


                        }
                        else
                        {
                            Debug.WriteLine("No item cards found to archive.");
                        }
                    }
                    else
                    {
                        Debug.WriteLine("Password does not match.");
                     
                    }
                }
                else
                {
                    Debug.WriteLine("No password found in the database.");
                   
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error checking password and deleting cards: {ex.Message}");
             
            }
        }



        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
