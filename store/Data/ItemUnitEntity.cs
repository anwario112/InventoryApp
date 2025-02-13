using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class ItemUnitEntity : IDataHelper<ItemUnit>
    {

        private readonly DBContext _dbContext;

        public ItemUnitEntity()
        {
            _dbContext = new DBContext();
        }
        public Task AddData(ItemUnit table)
        {
            throw new NotImplementedException();
        }

        public async Task AddDataRange(List<ItemUnit> tables)
        {
            await _dbContext.AddRangeAsync(tables);
            await _dbContext.SaveChangesAsync();
        }

        public Task<List<ItemUnit>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(ItemUnit table)
        {
            throw new NotImplementedException();
        }

        public async Task ClearData()
        {
            // Clear ItemUnit table
            var allItemUnits = await _dbContext.ItemUnit.ToListAsync();
            _dbContext.ItemUnit.RemoveRange(allItemUnits);

            // Clear ItemBarcode table
            var allItemBarcodes = await _dbContext.ItemBarcode.ToListAsync();
            _dbContext.ItemBarcode.RemoveRange(allItemBarcodes);

            // Clear ItemFile table
            var allItemFiles = await _dbContext.ItemFile.ToListAsync();
            _dbContext.ItemFile.RemoveRange(allItemFiles);

            // Save changes to the database
            await _dbContext.SaveChangesAsync();
        }


        public async Task<List<string>> GetUnitDescsByItemNum(string itemNum)
        {
            if (string.IsNullOrWhiteSpace(itemNum))
            {
                throw new ArgumentException("ItemNum cannot be null or empty.", nameof(itemNum));
            }

            var unitDescs = await (from itemFile in _dbContext.ItemFile
                                   join itemUnit in _dbContext.ItemUnit
                                   on itemFile.ItemID equals itemUnit.ItemID
                                   where itemFile.ItemNum == itemNum
                                   select itemUnit.UnitDesc)
                                   .AsNoTracking() 
                                   .Distinct() 
                                   .ToListAsync();

            return unitDescs;
        }
    }
}
