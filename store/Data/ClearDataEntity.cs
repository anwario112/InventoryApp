using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class ClearDataEntity : IDataHelper<ClearData>
    {
        private readonly DBContext dbContext;

        public ClearDataEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(ClearData table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<ClearData> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ClearData>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public async Task UpdateData(ClearData table)
        {
            var existingData = await dbContext.ClearData.FindAsync(table.ID); 
            if (existingData != null)
            {
                existingData.Password = table.Password; 
                await dbContext.SaveChangesAsync(); 
            }
        }



        public async Task<List<ClearData>> GetAllData()
        {
            return await dbContext.ClearData.ToListAsync();
        }
    }
}
