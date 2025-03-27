

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
    public class ItemCardEntity : IDataHelper<ItemCard>
    {

        private readonly DBContext _dbContext;
        public ItemCardEntity()
        {
            _dbContext = new DBContext();
        }  
        public async Task AddData(ItemCard table)
        {
           await _dbContext.AddAsync(table);
            await _dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<ItemCard> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ItemCard>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public async Task<List<ItemCard>> GetItemsByBarcode(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            try
            {
                var items = await _dbContext.ItemCards
                    .Where(i => i.ScanningNum == barcode)
                    .ToListAsync();

                return items;
            }
            catch (Exception ex)
            {
                
                Debug.WriteLine($"Error fetching items by barcode: {ex.Message}");
               
                throw;
            }
        }

        public async Task<List<ItemCard>> GetAllItemCards(int sectionID)
        {
            return await _dbContext.ItemCards
                .Where(itemCard => itemCard.SectionID == sectionID)
                .Select(itemCard => new ItemCard
                {
                    ID = itemCard.ID,
                    ScanningNum = itemCard.ScanningNum,
                    ItemName = itemCard.ItemName,
                    Quantity = itemCard.Quantity,
                    Unit = itemCard.Unit,
                    SectionID = itemCard.SectionID,
                    Price=itemCard.Price,
                    LastUpdate=itemCard.LastUpdate
                })
                .ToListAsync();
        }

        public async Task<bool> BarcodeSearch(string barcode, int sectionID)
        {
           
            try
            {

                return await _dbContext.ItemCards.AnyAsync(ic => ic.ScanningNum == barcode && ic.SectionID == sectionID);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error occurred while checking for record existence: {ex.Message}");
                return false; 
            }
        }
        
        

        public async Task DeleteData(int sectionID)
        {
            try
            {
                var itemsToDelete = await _dbContext.ItemCards

                    .Where(ic => ic.SectionID == sectionID) 

                    .ToListAsync();


                if (itemsToDelete.Any())
                {
           
                    _dbContext.ItemCards.RemoveRange(itemsToDelete);

                    await _dbContext.SaveChangesAsync();

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

        public async Task UpdateDataCard(ItemCard updatedItemCard, int id)
        {
            try
            {
              

                var existingItemCard = await _dbContext.ItemCards.FindAsync(id); 
                if (existingItemCard == null)
                {
                    throw new InvalidOperationException("ItemCard not found.");
                }

             
                existingItemCard.ScanningNum = updatedItemCard.ScanningNum; 
                existingItemCard.Unit = updatedItemCard.Unit;

             
                await _dbContext.SaveChangesAsync();
               
            }
            catch (DbUpdateException ex)
            {
                Debug.WriteLine($"Database update error: {ex.Message}");
                throw;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"An error occurred while updating ItemCard: {ex.Message}");
                throw;
            }
        }

        public async Task UpdateData(ItemCard itemCard)
        {
            if (itemCard == null)
            {
                throw new ArgumentNullException(nameof(itemCard), "ItemCard cannot be null.");
            }

            try
            {
              
                var existingItemCard = await _dbContext.ItemCards.FindAsync(itemCard.ID);

                if (existingItemCard == null)
                {
                    throw new InvalidOperationException($"ItemCard with ID {itemCard.ID} not found.");
                }

              
                existingItemCard.ItemName = itemCard.ItemName;
                existingItemCard.ScanningNum = itemCard.ScanningNum;
                existingItemCard.Unit = itemCard.Unit;
                existingItemCard.Quantity = itemCard.Quantity;
                existingItemCard.Price = itemCard.Price;
                existingItemCard.LastUpdate = DateTime.Now;

             
                await _dbContext.SaveChangesAsync();

                Debug.WriteLine($"ItemCard updated successfully: ItemName={itemCard.ItemName}, Barcode={itemCard.ScanningNum}, Quantity={itemCard.Quantity}");
            }
            catch (DbUpdateConcurrencyException ex)
            {    Debug.WriteLine($"Concurrency conflict occurred: {ex.Message}");
                throw;
            }
            catch (DbUpdateException ex)
            {
              
                Debug.WriteLine($"Database update error: {ex.InnerException?.Message}");
                throw;
            }
            catch (Exception ex)
            {
               
                Debug.WriteLine($"An error occurred while updating ItemCard: {ex.Message}");
                throw;
            }
        }

        Task<ItemBarcode> IDataHelper<ItemCard>.GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public async Task DeleteCard(int ID,int sectionID)
        {
            Debug.WriteLine($"the card that will be deleted:{ID}");
            var itemCard = await _dbContext.ItemCards.FindAsync(ID);

             _dbContext.ItemCards.Remove(itemCard);
            await _dbContext.SaveChangesAsync();
            Debug.WriteLine($"deleted card is :{ID}");
        }

        public async Task UpdateQuantity(int id, string quantity)
        {
           
            var itemCard = await _dbContext.ItemCards.FindAsync(id);
        
            if (int.TryParse(quantity, out int parsedQuantity))
            {
              
                itemCard.Quantity = parsedQuantity; 

           
                await _dbContext.SaveChangesAsync();
                Debug.WriteLine($"Updated ItemCard ID {id} with new quantity: {parsedQuantity}");
            }
            else
            {
                Debug.WriteLine($"Invalid quantity value: {quantity}");
               
            }
        }


        public async Task<List<ItemCard>> GetItemCardsBySectionID(int sectionID)
        {
            try
            {
                
                var itemCardsToRetrieve = await _dbContext.ItemCards
                                                          .Where(ic => ic.SectionID == sectionID)
                                                          .ToListAsync();

               
                Debug.WriteLine($"Retrieved {itemCardsToRetrieve.Count} ItemCards for SectionID {sectionID}.");

                return itemCardsToRetrieve;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"An error occurred while retrieving ItemCards: {ex.Message}");
                throw; 
            }
        }

        public async Task<ItemCard> GetItemCardByBarcodeAndSection(string barcode, int sectionID)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            try
            {
                
                var itemCard = await _dbContext.ItemCards
                    .FirstOrDefaultAsync(ic => ic.ScanningNum == barcode && ic.SectionID == sectionID);

                if (itemCard == null)
                {
                    Debug.WriteLine($"No ItemCard found with barcode '{barcode}' and sectionID '{sectionID}'.");
                    return null; 
                }

                return itemCard;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching ItemCard by barcode and section: {ex.Message}");
                throw; 
            }
        }


        public async Task<ItemCard> GetItemCardById(int id)
        {
            try
            {
               
                var itemCard = await _dbContext.ItemCards.FindAsync(id);

                if (itemCard == null)
                {
                    Debug.WriteLine($"ItemCard with ID {id} not found.");
                    return null; 
                }

             
                return itemCard;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"An error occurred while retrieving ItemCard with ID {id}: {ex.Message}");
                throw; 
            }
        }

    }
}

