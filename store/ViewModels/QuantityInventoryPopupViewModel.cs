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
using System.Globalization;

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
                if (!float.TryParse(quantityText, NumberStyles.Any, CultureInfo.InvariantCulture, out float quantity) || quantity <= 0)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Please enter a valid positive quantity", "OK");
                    return false;
                }

                ItemCardsInventory item = null;

                if (mergeEnabled)
                {
                    var existingItems = await itemCardsInventoryEntity.GetItemsByBarcode(barcode, sectionID);
                    var existingItem = existingItems.FirstOrDefault();
                    if (existingItem != null)
                    {
                        existingItem.Quantity = quantity;
                        existingItem.LastUpdate = DateTime.Now;
                        Debug.WriteLine($"quantity:{existingItem.Quantity}");
                        await itemCardsInventoryEntity.UpdateData(existingItem, existingItem.ID);
                        item = existingItem;
                    }
                }

                if (item == null)
                {
                    item = new ItemCardsInventory
                    {
                        ScanningNum = barcode,
                        Quantity = quantity,
                        SectionID = sectionID,
                        LastUpdate = DateTime.Now
                    };
                    Debug.WriteLine($"scanning:{item.ScanningNum},quantity:{item.Quantity}");
                    int newId = await itemCardsInventoryEntity.AddData(item);
                    item.ID = newId;
                }

               
                MessagingCenter.Send(this, "ItemUpdated", item);
                return true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in SetQauntity: {ex.Message}");
                await Application.Current.MainPage.DisplayAlert("Error", "Failed to save quantity", "OK");
                return false;
            }
        }

        public async Task<bool> UpdateQuantity(string qauntity, int itemId)
        {
            Debug.WriteLine($"quantity:{qauntity},itemid:{itemId}");
            if (!float.TryParse(qauntity, NumberStyles.Any, CultureInfo.InvariantCulture, out float quantity) || quantity <= 0)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please enter a valid positive quantity", "OK");
                return false;
            }

            var existingItem = await itemCardsInventoryEntity.GetItemById(itemId);
            if (existingItem != null)
            {
                existingItem.Quantity = quantity;
                existingItem.LastUpdate = DateTime.Now;
                await itemCardsInventoryEntity.UpdateData(existingItem, itemId);

                // Notify with updated item
                MessagingCenter.Send(this, "ItemUpdated", existingItem);
            }

            return true;
        }
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
