using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class CityEntity : IDataHelper<City>
    {
        private readonly DBContext dbContext;

        public CityEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(City table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

       

        public Task AddDataRange(List<CityEntity> tables)
        {
            throw new NotImplementedException();
        }

        public Task AddDataRange(List<City> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<CityEntity>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(CityEntity table)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(City table)
        {
            throw new NotImplementedException();
        }

        Task<List<City>> IDataHelper<City>.GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public async Task<int?> GetCityIdByCityName(string cityName)
        {
            var city = await dbContext.City
                .FirstOrDefaultAsync(c => c.CityName.ToLower() == cityName.ToLower()); 

            return city?.ID;
        }
    }
}
