using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class CustomerEntity : IDataHelper<Customer>
    {
        private readonly DBContext dbContext;

        public CustomerEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(Customer table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<Customer> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<Customer>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<Models.ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(Customer table)
        {
            throw new NotImplementedException();
        }

        public async Task<int?> GetCustomerIDByPhone(string phone)
        {
            var customer = await dbContext.Customer
                .FirstOrDefaultAsync(c => c.Phone.ToLower() == phone.ToLower()); 

            return customer?.ID;
        }
    }
}
