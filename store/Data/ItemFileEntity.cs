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
    public class ItemFileEntity : IDataHelper<ItemFile>
    {
        private readonly DBContext _dbContext;
        public ItemFileEntity()
        {
            _dbContext = new DBContext();
        }
        public async Task AddData(ItemFile table)
        {
            await _dbContext.AddRangeAsync(table);
            await _dbContext.SaveChangesAsync();
        }



        public async Task AddDataRange(List<ItemFile> items)
        {

            await _dbContext.AddRangeAsync(items);

            await _dbContext.SaveChangesAsync();

        }

        public Task<List<ItemFile>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(ItemFile table)
        {
            throw new NotImplementedException();
        }

        public async Task ClearData()
        {
            var allItems = await _dbContext.ItemFile.ToListAsync();
            _dbContext.ItemFile.RemoveRange(allItems);
            await _dbContext.SaveChangesAsync();
        }



        public async Task<List<(string Barcode, string UnitDesc, decimal Price)>> GetBarcodesUnitDescsAndPricesByItemNum(string itemNum)
        {
            if (string.IsNullOrWhiteSpace(itemNum))
            {
                throw new ArgumentException("ItemNum cannot be null or empty.", nameof(itemNum));
            }

            var results = await (from itemFile in _dbContext.ItemFile
                                 join itemBarcode in _dbContext.ItemBarcode
                                 on itemFile.ItemID equals itemBarcode.ItemID
                                 where itemFile.ItemNum == itemNum
                                 select new
                                 {
                                     itemBarcode.Barcode,
                                     itemBarcode.UnitDesc,
                                     itemBarcode.price
                                 })
                                 .AsNoTracking() 
                                 .Distinct() 
                                 .ToListAsync();

            
            return results.Select(r => (r.Barcode, r.UnitDesc, r.price)).ToList();
        }



        public async Task<(List<ItemFile> Items, int TotalItems)> GetAllItems(int page, int pageSize)
        {
            var query = _dbContext.ItemFile.AsNoTracking();

            var totalItems = await query.CountAsync();
            var items = await query
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            return (items, totalItems);
        }

        public async Task<int?> GetItemIdByItemNum(string itemNum)
        {
            if (string.IsNullOrWhiteSpace(itemNum))
            {
                throw new ArgumentException("ItemNum cannot be null or empty.", nameof(itemNum));
            }

          
            var item = await _dbContext.ItemFile
                .AsNoTracking() 
                .FirstOrDefaultAsync(i => i.ItemNum == itemNum);
            Debug.WriteLine($"itemID:{item.ItemID}");

            return item?.ItemID; 
        }

        public async Task<string> GetPriceByItemId(int itemId)
        {
            if (itemId <= 0)
            {
                throw new ArgumentException("ItemID must be greater than zero.", nameof(itemId));
            }

            var item = await _dbContext.ItemFile
                .AsNoTracking()
                .FirstOrDefaultAsync(i => i.ItemID == itemId);

            Debug.WriteLine($"the price:{item.Price}");

            return item?.Price;
        }
    }
}
