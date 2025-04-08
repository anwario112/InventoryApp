using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class RakInventoryEntity : IDataHelper<RakInventory>
    {

        private readonly DBContext dbContext;

        public RakInventoryEntity()
        {
            dbContext = new DBContext();
        }
        public async  Task AddData(RakInventory table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public async Task<List<RakInventory>> GetAllRaks()
        {
            return await dbContext.RakInventory.ToListAsync();

        }

        public async Task<bool> RakNameExists(string rakName)
        {

            return await dbContext.RakInventory.AnyAsync(r => r.RakName.ToLower() == rakName.ToLower());

        }

        public async Task<bool> RakIDExist(int RakID)
        {
            return await dbContext.RakInventory.AnyAsync(r => r.ID == RakID);
        }


        public async Task DeleteRak(int RakID)
        {
            var rak = await dbContext.RakInventory.FindAsync(RakID);
            if (rak != null)
            {
                dbContext.RakInventory.Remove(rak);
                await dbContext.SaveChangesAsync();
            }
            else
            {
                throw new Exception("Rak not found.");
            }
        }

        public async Task<RakInventory> GetRakById(int rakID)
        {
            return await dbContext.RakInventory.FindAsync(rakID);
        }
        public Task AddDataRange(List<RakInventory> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<RakInventory>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(RakInventory table)
        {
            throw new NotImplementedException();
        }
    }
}
