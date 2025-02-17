using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class CountryEntity : IDataHelper<Country>
    {
        private readonly DBContext dbContext;

        public CountryEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(Country table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        

        public Task AddDataRange(List<CountryEntity> tables)
        {
            throw new NotImplementedException();
        }

        public Task AddDataRange(List<Country> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<CountryEntity>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(CountryEntity table)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(Country table)
        {
            throw new NotImplementedException();
        }

        Task<List<Country>> IDataHelper<Country>.GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public async Task<Country> GetCountryByCountryName(string countryName)
        {
            return await dbContext.Country
                .FirstOrDefaultAsync(c => c.CountryName.ToLower() == countryName.ToLower());
        }
    }
}
