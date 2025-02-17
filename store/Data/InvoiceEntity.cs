

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
    public class InvoiceEntity : IDataHelper<Invoice>
    {

        private readonly DBContext dBContext;

        public InvoiceEntity()
        {
            dBContext = new DBContext();
        }
        public async Task AddData(Invoice table)
        {

            await dBContext.AddAsync(table);
            await dBContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<Invoice> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<Invoice>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(Invoice table)
        {
            throw new NotImplementedException();
        }

        public async Task<int?> GetIdByInvoiceNum(int invoiceNum)
        {
            if (invoiceNum <= 0)
            {
                throw new ArgumentException("InvoiceNum must be greater than zero.", nameof(invoiceNum));
            }

            var invoice = await dBContext.Invoice
                .AsNoTracking()
                .FirstOrDefaultAsync(i => i.InvoiceNum == invoiceNum);

            return invoice?.ID;
        }


        public async Task<List<(Invoice Invoice, string FirstName, string LastName)>> GetInvoicesWithCustomerNamesAsync()
        {
            var invoicesWithNames = await (from invoice in dBContext.Invoice
                                           join customer in dBContext.Customer
                                           on invoice.CustomerID equals customer.ID
                                           select new
                                           {
                                               Invoice = invoice,
                                               FirstName = customer.FirstName,
                                               LastName = customer.LastName
                                           }).ToListAsync();
           

            return invoicesWithNames.Select(x => (x.Invoice, x.FirstName, x.LastName)).ToList();
        }
    }
}
