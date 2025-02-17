using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class InvoiceDetailsEntity : IDataHelper<InvoiceDetails>
    {

        private readonly DBContext dbContext;

        public InvoiceDetailsEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(InvoiceDetails table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public async Task AddDataRange(List<InvoiceDetails> tables)
        {
            await dbContext.AddRangeAsync(tables);
            await dbContext.SaveChangesAsync();
        }

        public Task<List<InvoiceDetails>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<Models.ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(InvoiceDetails table)
        {
            throw new NotImplementedException();
        }
    }
}
