using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Collections.Specialized.BitVector32;
using ZXing.QrCode.Internal;
using NetTopologySuite.Index.HPRtree;

namespace store.ViewModels
{
    public class QuantityInventoryPopupViewModel: INotifyPropertyChanged
    {

       
        private readonly ItemCardsInventoryEntity itemCardsInventoryEntity;
        public QuantityInventoryPopupViewModel() 
        {
            itemCardsInventoryEntity=new ItemCardsInventoryEntity();
        }

        public async Task<bool> SetQauntity(string barcode, string quantityText, int sectionID, bool mergeEnabled)
        {
            try
            {
                if (!int.TryParse(quantityText, out int quantity) || quantity <= 0)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Please enter a valid positive quantity", "OK");
                    return false;
                }

             
                if (mergeEnabled)
                {
                    var existingItems = await itemCardsInventoryEntity.GetItemsByBarcode(barcode, sectionID);
                    var existingItem = existingItems.FirstOrDefault();

                    if (existingItem != null)
                    {
                        existingItem.Quantity = quantity;
                        existingItem.LastUpdate = DateTime.Now;
                        await itemCardsInventoryEntity.UpdateData(existingItem, existingItem.ID);
                        return true;
                    }
                }

               
                var newItem = new ItemCardsInventory
                {
                    ScanningNum = barcode,
                    Quantity = quantity,
                    SectionID = sectionID,
                    LastUpdate = DateTime.Now
                };
                await itemCardsInventoryEntity.AddData(newItem);
                return true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in SetQauntity: {ex.Message}");
                await Application.Current.MainPage.DisplayAlert("Error", "Failed to save quantity", "OK");
                return false;
            }
        }
        public event Action<int> ItemUpdated;
        public async Task<bool> UpdateQuantity(string qauntity, int itemId)
        {
            Debug.WriteLine($"quantity:{qauntity},itemid:{itemId}");
            if (!int.TryParse(qauntity, out int parsedQuantity))
            {
                return false;
            }

            var UpdateCard = new ItemCardsInventory
            {
                ID = itemId,
                Quantity = parsedQuantity,
            };

            await itemCardsInventoryEntity.UpdateData(UpdateCard, itemId);


            MessagingCenter.Send(this, "DataSaved");

            return true;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
