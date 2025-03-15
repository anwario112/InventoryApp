using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class CurrencyEntity : IDataHelper<Currency>
    {

        private readonly DBContext dbContext;

        public CurrencyEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(Currency table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<Currency> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<Currency>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<Models.ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(Currency table)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Currency>> GetAllData()
        {
            try
            {
               
                var currencies = await dbContext.Currency.ToListAsync();

             
                return currencies;
            }
            catch (Exception ex)
            {
               
                throw new Exception("Error fetching currencies from the database.", ex);
            }
        }

        public async Task<int?> GetCurrencyIdByCode(string currencyCode)
        {
            try
            {
              
                var currency = await dbContext.Currency
                    .FirstOrDefaultAsync(c => c.CurrencyCode == currencyCode);

             
                return currency?.ID;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching currency ID: {ex.Message}");
                throw new Exception("Error fetching currency ID.", ex);
            }
        }
    }
}
