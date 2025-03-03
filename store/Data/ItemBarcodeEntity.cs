
using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
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


        public async Task<(ItemBarcode ItemBarcode, string ItemName, string UnitDesc)> GetItemByBarcodes(string barcode)
        {
            if (string.IsNullOrWhiteSpace(barcode))
            {
                Debug.WriteLine("Barcode is null or empty.");
                throw new ArgumentException("Barcode cannot be null or empty.", nameof(barcode));
            }

            Debug.WriteLine($"Searching for barcode: {barcode}");

           
            Debug.WriteLine("Searching in ItemBarcode table...");
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

            if (result != null)
            {
                Debug.WriteLine("Barcode found in ItemBarcode table.");
                Debug.WriteLine($"ItemBarcode: Barcode = {result.ItemBarcode.Barcode}, ItemID = {result.ItemBarcode.ItemID}");
                Debug.WriteLine($"ItemName: {result.ItemName}, UnitDesc: {result.UnitDesc}");

            
                return (result.ItemBarcode, result.ItemName, result.UnitDesc);
            }

            Debug.WriteLine("Barcode not found in ItemBarcode table. Searching in ItemFile table...");

         
            var itemFileResult = await (from itemFile in dbContext.ItemFile
                                        where itemFile.ItemNum == barcode
                                        select new
                                        {
                                            ItemID = itemFile.ItemID,
                                            ItemNum = itemFile.ItemNum,
                                            ItemName = itemFile.ItemName
                                        }).FirstOrDefaultAsync();

            if (itemFileResult != null)
            {
                Debug.WriteLine("Barcode found in ItemFile table.");
                Debug.WriteLine($"ItemNum: {itemFileResult.ItemNum}, ItemName: {itemFileResult.ItemName}");

              
                Debug.WriteLine("Searching for UnitDesc in ItemUnit table...");
                var itemUnitResult = await (from itemUnit in dbContext.ItemUnit
                                            where itemUnit.ItemID == itemFileResult.ItemID
                                            select itemUnit.UnitDesc).FirstOrDefaultAsync();

                Debug.WriteLine($"UnitDesc: {itemUnitResult}");


                var itemBarcode = new ItemBarcode
                {
                    Barcode = itemFileResult.ItemNum,
                    ItemID = itemFileResult.ItemID ?? 0
                };

                Debug.WriteLine($"Created ItemBarcode: Barcode = {itemBarcode.Barcode}, ItemID = {itemBarcode.ItemID}");


                return (itemBarcode, itemFileResult.ItemName, itemUnitResult);
            }

            Debug.WriteLine("Barcode not found in ItemFile table.");

          
            return (null, null, null);
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
