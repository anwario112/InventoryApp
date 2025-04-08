using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class ItemCardsInventoryEntity : IDataHelper<ItemCardsInventory>
    {

        private readonly DBContext dBContext;

        public ItemCardsInventoryEntity()
        {
            dBContext = new DBContext();
        }
        public async Task AddData(ItemCardsInventory table)
        {
            await dBContext.AddAsync(table);
            await dBContext.SaveChangesAsync();
        }

        public async Task<List<ItemCardsInventory>> GetAllItemCards(int sectionID)
        {
            return await dBContext.ItemCardsInventory
                .Where(itemCard => itemCard.SectionID == sectionID)
                .OrderByDescending(itemCard => itemCard.LastUpdate) 
                .Select(itemCard => new ItemCardsInventory
                {
                    ID = itemCard.ID,
                    ScanningNum = itemCard.ScanningNum,
                    Quantity = itemCard.Quantity,
                    SectionID = itemCard.SectionID,
                    LastUpdate = itemCard.LastUpdate
                })
                .ToListAsync();
        }

        public async Task DeleteCard(int ID, int sectionID)
        {
            Debug.WriteLine($"the card that will be deleted:{ID}");
            var itemCard = await dBContext.ItemCardsInventory.FindAsync(ID);

            dBContext.ItemCardsInventory.Remove(itemCard);
            await dBContext.SaveChangesAsync();
            Debug.WriteLine($"deleted card is :{ID}");
        }
        public async Task<List<ItemCardsInventory>> GetItemsByBarcode(string barcode, int sectionID)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            try
            {
                var items = await dBContext.ItemCardsInventory
                    .Where(i => i.ScanningNum == barcode && i.SectionID == sectionID)
                    .ToListAsync();

                return items;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching items by barcode and section ID: {ex.Message}");
                throw;
            }
        }
        public async Task UpdateData(ItemCardsInventory table, int itemId)
        {
            var existingItem = await dBContext.ItemCardsInventory
                .FirstOrDefaultAsync(x => x.ID == itemId);

            if (existingItem != null)
            {
                existingItem.Quantity = table.Quantity;
                existingItem.LastUpdate = DateTime.Now;
                await dBContext.SaveChangesAsync();
            }
        }

        public async Task<ItemCardsInventory> GetItemById(int itemId)
        {
            try
            {
               

                return await dBContext.ItemCardsInventory
                    .Where(i => i.ID == itemId)
                    .FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error getting item by ID: {ex}");
                return null;
            }
        }

        public async Task<List<ItemCardsInventory>> GetItemCardsBySectionID(int sectionID)
        {
            try
            {

                var itemCardsToRetrieve = await dBContext.ItemCardsInventory
                                                          .Where(ic => ic.SectionID == sectionID)
                                                          .ToListAsync();


               

                return itemCardsToRetrieve;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"An error occurred while retrieving ItemCards: {ex.Message}");
                throw;
            }
        }

        public Task AddDataRange(List<ItemCardsInventory> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ItemCardsInventory>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(ItemCardsInventory table)
        {
            throw new NotImplementedException();
        }


        public async Task DeleteData(int sectionID)
        {
            try
            {
                var itemsToDelete = await dBContext.ItemCardsInventory

                    .Where(ic => ic.SectionID == sectionID)

                    .ToListAsync();


                if (itemsToDelete.Any())
                {

                    dBContext.ItemCardsInventory.RemoveRange(itemsToDelete);

                    await dBContext.SaveChangesAsync();

                    Debug.WriteLine($"Deleted {itemsToDelete.Count} ItemCards with SectionID {sectionID}.");

                }

                else

                {

                    Debug.WriteLine($"No ItemCards found with SectionID {sectionID}.");

                }

            }
            catch (DbUpdateException ex)
            {

                Debug.WriteLine($"Database update error: {ex.Message}");

                throw;
            }
            catch (Exception ex)
            {

                Debug.WriteLine($"An error occurred while deleting ItemCards: {ex.Message}");

                throw;

            }

        }

    }
}
