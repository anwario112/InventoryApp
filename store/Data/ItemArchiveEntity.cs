using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class ItemArchiveEntity : IDataHelper<ItemArchive>
    {

        private readonly DBContext dBContext;
        public ItemArchiveEntity()
        {
            dBContext = new DBContext();
        }
        public Task AddData(ItemArchive table)
        {
            throw new NotImplementedException();
        }

        public async Task AddDataRange(List<ItemArchive> tables)
        {
            await dBContext.AddRangeAsync(tables);
            await dBContext.SaveChangesAsync();
        }

        public Task<List<ItemArchive>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(ItemArchive table)
        {
            throw new NotImplementedException();
        }

        public async Task<List<ItemArchive>> GetAllData()
        {
           
            return await dBContext.ItemArchive.ToListAsync();
        }

        public async Task<bool> DeleteByItemName(string itemName)
        {
            
            var itemsToDelete = await dBContext.ItemArchive
                .Where(item => item.ItemName == itemName)
                .ToListAsync();

            if (itemsToDelete.Any())
            {
                dBContext.ItemArchive.RemoveRange(itemsToDelete);
                await dBContext.SaveChangesAsync();
                return true; 
            }

            return false; 
        }
    }
}
