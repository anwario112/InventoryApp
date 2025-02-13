using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class RakEntity : IDataHelper<Rak>
    {
        private readonly DBContext dbContext;

        public RakEntity()
        {
            dbContext = new DBContext();
        }

        public async Task AddData(Rak table)
        {
           await dbContext.AddAsync(table);
           await dbContext.SaveChangesAsync();
        }

        public async Task<List<Rak>> GetAllRaks()
        {
            return await dbContext.Raks.ToListAsync(); 

        }

        public async Task<bool> RakNameExists(string rakName)
        {

            return await dbContext.Raks.AnyAsync(r => r.RakName.ToLower() == rakName.ToLower());

        }

        public async Task<bool> RakIDExist(int RakID)
        {
            return await dbContext.Raks.AnyAsync(r => r.ID == RakID);
        }

        public Task AddDataRange(List<Rak> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<Rak>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(Rak table)
        {
            throw new NotImplementedException();
        }

        public async Task DeleteRak(int RakID)
        {
            var rak = await dbContext.Raks.FindAsync(RakID);
            if(rak != null)
            {
                dbContext.Raks.Remove(rak);
                await dbContext.SaveChangesAsync();
            }
            else
            {
                throw new Exception("Rak not found.");
            }
        }

        public async Task<Rak> GetRakById(int rakID)
        {
            return await dbContext.Raks.FindAsync(rakID);
        }

        Task<ItemBarcode> IDataHelper<Rak>.GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }
    }
}
