
using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class StreetEntity : IDataHelper<Street>
    {

        private readonly DBContext dbContext;
        public StreetEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(Street table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<Street> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<Street>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(Street table)
        {
            throw new NotImplementedException();
        }

        public async Task<int?> GetStreetIdByStreetDesc(string streetDesc)
        {

            var street = await dbContext.Street

                .Where(s => s.StreetDesc.ToLower() == streetDesc.ToLower()) 

                .Select(s => s.StreetNum)

                .FirstOrDefaultAsync(); 

            return street; 

        }
    }
}
