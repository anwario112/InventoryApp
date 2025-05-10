using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace store.Data
{
    public class ItemCardsInventoryEntity : IDataHelper<ItemCardsInventory>
    {
        private readonly DBContext _dbContext;


        private static readonly Func<DBContext, int, Task<List<ItemCardsInventory>>> _compiledToListQuery =
     EF.CompileAsyncQuery((DBContext ctx, int sectionId) =>
         ctx.ItemCardsInventory
             .AsNoTracking()
             .Where(i => i.SectionID == sectionId)
             .OrderByDescending(i => i.LastUpdate)
             .ToList());


        public ItemCardsInventoryEntity()
        {
            _dbContext = new DBContext();

            _ = _dbContext.Database.ExecuteSqlRaw("SELECT 1");
        }

        public async Task<int> AddData(ItemCardsInventory table)
        {
            _dbContext.ItemCardsInventory.Add(table);
            await _dbContext.SaveChangesAsync();
            return table.ID;
        }

        public async Task DeleteCard(int ID, int sectionID)
        {

            await _dbContext.Database.ExecuteSqlInterpolatedAsync(
                $"DELETE FROM ItemCardsInventory WHERE ID = {ID} AND SectionID = {sectionID}");
            Debug.WriteLine($"Deleted card ID: {ID}");
        }

        public async Task<List<ItemCardsInventory>> GetItemsByBarcode(string barcode, int sectionID)
        {
            if (string.IsNullOrWhiteSpace(barcode))
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));

            return await _dbContext.ItemCardsInventory
                .AsNoTracking()
                .Where(i => i.ScanningNum == barcode && i.SectionID == sectionID)
                .ToListAsync();
        }

        public async Task UpdateData(ItemCardsInventory table, int itemId)
        {

            await _dbContext.Database.ExecuteSqlInterpolatedAsync(
                $"UPDATE ItemCardsInventory SET Quantity = {table.Quantity}, LastUpdate = {DateTime.Now} WHERE ID = {itemId}");
        }

        public async Task<ItemCardsInventory> GetItemById(int itemId)
        {
            return await _dbContext.ItemCardsInventory
                .AsNoTracking()
                .FirstOrDefaultAsync(i => i.ID == itemId);
        }

        public async Task<List<ItemCardsInventory>> GetItemCardsBySectionID(int sectionID, int page = 1, int pageSize = 50)
        {
            return await _dbContext.ItemCardsInventory
                .AsNoTracking()
                .Where(i => i.SectionID == sectionID)
                .OrderByDescending(i => i.LastUpdate)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<List<ItemCardsInventory>> GetItemCardsBySectionIDCompiled(int sectionID)
        {
            return await _compiledToListQuery(_dbContext, sectionID);
        }

        public async Task DeleteData(int sectionID)
        {

            await _dbContext.Database.ExecuteSqlInterpolatedAsync(
                $"DELETE FROM ItemCardsInventory WHERE SectionID = {sectionID}");
            Debug.WriteLine($"Deleted all items in section: {sectionID}");
        }


        public async Task<List<ItemCardsInventory>> GetPagedItems(int sectionID, int page = 1, int pageSize = 50)
        {
            return await _dbContext.ItemCardsInventory
                .AsNoTracking()
                .Where(i => i.SectionID == sectionID)
                .OrderByDescending(i => i.LastUpdate)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }


        public async Task<int> DeleteAllCards(int sectionId)
        {
            try
            {

                int deletedCount = await _dbContext.Database.ExecuteSqlInterpolatedAsync(
                    $"DELETE FROM ItemCardsInventory WHERE SectionID = {sectionId}");

                Debug.WriteLine($"Deleted {deletedCount} cards from section {sectionId}");
                return deletedCount;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in DeleteAllCards: {ex.Message}");
                throw;
            }
        }

        public Task AddDataRange(List<ItemCardsInventory> tables) => throw new NotImplementedException();
        public Task<List<ItemCardsInventory>> GetConnection(string serverName, string databaseName, string username, string password, string year) => throw new NotImplementedException();
        public Task<ItemBarcode> GetItemByBarcode(string barcode) => throw new NotImplementedException();
        public Task UpdateData(ItemCardsInventory table) => throw new NotImplementedException();
        Task IDataHelper<ItemCardsInventory>.AddData(ItemCardsInventory table) => throw new NotImplementedException();
    }
}