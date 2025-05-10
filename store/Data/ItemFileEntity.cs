using EFCore.BulkExtensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
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



        public async Task<List<(string Barcode, string UnitDesc, decimal Price,int UnitID)>> GetBarcodesUnitDescsAndPricesByItemNum(string itemNum)
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
                                     itemBarcode.price,
                                     itemBarcode.UnitID
                                 })
                                 .AsNoTracking()
                                 .Distinct()
                                 .ToListAsync();


            return results
                .Select(r => (r.Barcode, r.UnitDesc, r.price ?? 0,r.UnitID))
                .ToList();
        }



        public async Task<(List<ItemFile> Items, int TotalItems)> GetAllItems(int page = 1, int pageSize = 10, string searchTerm = null)
        {
            if (page < 1) page = 1;
            if (pageSize < 1) pageSize = 10;

            var query = _dbContext.ItemFile.AsNoTracking();

            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                string searchLower = searchTerm.ToLower();
                query = query.Where(item => item.ItemName.ToLower().Contains(searchLower));
            }

            var totalItems = await query.CountAsync();

            var items = await query
                .OrderByDescending(item => item.ItemID)
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

        public async Task<(string ItemBarcode, string ItemName, string UnitDesc,string Price,int ItemID,int UnitID)> GetItemByBarcodes(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                Debug.WriteLine("Barcode is null or empty.");
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            Debug.WriteLine($"Searching in ItemFile table for barcode: {barcode}");

            try
            {
               
                var result = await (
                    from itemfile in _dbContext.ItemFile
                    join itemUnit in _dbContext.ItemUnit
                    on itemfile.ItemID equals itemUnit.ItemID into itemUnitGroup
                    from itemUnit in itemUnitGroup.DefaultIfEmpty()
                    where itemfile.ItemNum == barcode
                    select new
                    {
                        ItemBarcode = itemfile.ItemNum,
                        ItemName = itemfile.ItemName,
                        ItemID=itemfile.ItemID ?? 0,
                        UnitDesc = itemUnit != null ? itemUnit.UnitDesc : null ,
                        UnitID=itemUnit.UnitID,
                        Price= itemfile.Price
                    }
                ).FirstOrDefaultAsync();

                if (result == null)
                {
                    Debug.WriteLine($"No item found for barcode: {barcode}");
                    return (null, null, null,null,0,0);
                }

                Debug.WriteLine($"Item found: Barcode={result.ItemBarcode}, Name={result.ItemName}, UnitDesc={result.UnitDesc ?? "N/A"}");
                return (result.ItemBarcode, result.ItemName, result.UnitDesc,result.Price,result.ItemID,result.UnitID);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"An error occurred while retrieving item details for barcode: {barcode}. Error: {ex.Message}");
                throw;
            }
        }



        public async Task<string> GetPriceByItemNum(string itemNum)
        {
            if (string.IsNullOrWhiteSpace(itemNum))
            {
                throw new ArgumentException("ItemNum cannot be null or empty.", nameof(itemNum));
            }

            var item = await _dbContext.ItemFile
                .AsNoTracking()
                .FirstOrDefaultAsync(i => i.ItemNum == itemNum);

            if (item == null)
            {
                Debug.WriteLine($"No item found for ItemNum: {itemNum}");
                return null;
            }

            Debug.WriteLine($"Price for ItemNum {itemNum}: {item.Price}");
            return item.Price;
        }




        public async Task UpsertItemFileData(List<ItemFile> itemFiles)
        {
            await _dbContext.BulkInsertOrUpdateAsync(itemFiles);
        }

        public async Task<bool> DoesBarcodeExistInItemFile(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            return await _dbContext.ItemFile
                .AsNoTracking()
                .AnyAsync(i => i.ItemNum == barcode);
        }
    }
}
