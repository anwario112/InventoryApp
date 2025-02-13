using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class ItemBarcodeEntity : IDataHelper<ItemBarcode>
    {
        private readonly DBContext dbContext;

        public ItemBarcodeEntity()
        {
            dbContext = new DBContext();
        }
        public Task AddData(ItemBarcode table)
        {
            throw new NotImplementedException();
        }

        public async Task AddDataRange(List<ItemBarcode> tables)
        {
            await dbContext.AddRangeAsync(tables);
            await dbContext.SaveChangesAsync();
        }

        public Task<List<ItemBarcode>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public async Task<(ItemBarcode ItemBarcode, string ItemName, string UnitDesc)> GetItemByBarcode(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            var result = await (from barcodeItem in dbContext.ItemBarcode
                                join itemFile in dbContext.ItemFile
                                on barcodeItem.ItemID equals itemFile.ItemID
                                where barcodeItem.Barcode == barcode
                                select new
                                {
                                    ItemBarcode = barcodeItem,
                                    ItemName = itemFile.ItemName,
                                    UnitDesc = barcodeItem.UnitDesc 
                                }).FirstOrDefaultAsync();

            return result != null ? (result.ItemBarcode, result.ItemName, result.UnitDesc) : (null, null, null);
        }
        public async Task<string> GetItemNumByBarcode(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            var result = await (from barcodeItem in dbContext.ItemBarcode
                                join itemFile in dbContext.ItemFile
                                on barcodeItem.ItemID equals itemFile.ItemID
                                where barcodeItem.Barcode == barcode
                                select itemFile.ItemNum) 
                                .FirstOrDefaultAsync();

            return result; 
        }


        public Task UpdateData(ItemBarcode table)
        {
            throw new NotImplementedException();
        }

        Task<ItemBarcode> IDataHelper<ItemBarcode>.GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }
    }
}
