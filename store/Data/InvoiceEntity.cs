

using Microsoft.EntityFrameworkCore;
using store.DTO;
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

        public async Task UpdateData(Invoice table)
        {
            try
            {
                dBContext.Update(table);
                await dBContext.SaveChangesAsync(); 
            }
            catch (DbUpdateException ex)
            {
                
                Debug.WriteLine($"An error occurred while updating the invoice: {ex.InnerException?.Message}");
                throw; 
            }
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

        public async Task<string?> GetCustomerPhoneByInvoiceNum(int invoiceNum)
        {
            if (invoiceNum <= 0)
            {
                throw new ArgumentException("InvoiceNum must be greater than zero.", nameof(invoiceNum));
            }

            var customerPhone = await (from invoice in dBContext.Invoice
                                       join customer in dBContext.Customer
                                       on invoice.CustomerID equals customer.ID
                                       where invoice.InvoiceNum == invoiceNum
                                       select customer.Phone).FirstOrDefaultAsync();

            Debug.WriteLine($"invoiceNum:{invoiceNum},phone:{customerPhone}");

            return customerPhone;
        }

        public async Task<DateTime?> GetInvoiceDateByInvoiceNum(int invoiceNum)
        {
            if (invoiceNum <= 0)
            {
                throw new ArgumentException("InvoiceNum must be greater than zero.", nameof(invoiceNum));
            }

            var invoiceDate = await dBContext.Invoice
                .Where(i => i.InvoiceNum == invoiceNum)
                .Select(i => i.DateCreated)
                .FirstOrDefaultAsync();

            return invoiceDate;
        }

        public async Task<List<InvoiceDetailDTO>> GetInvoiceDetails(int invoiceNum)
        {
            var invoiceDetails = await (from invoice in dBContext.Invoice
                                        join invoiceDetail in dBContext.invoiceDetails
                                        on invoice.ID equals invoiceDetail.InvoiceID
                                        join itemFile in dBContext.ItemFile
                                        on invoiceDetail.ItemID equals itemFile.ItemID                                   
                                        where invoice.InvoiceNum == invoiceNum
                                        select new
                                        {
                                            ID=invoiceDetail.ID,
                                            DateCreated = invoice.DateCreated,
                                            QuantityString = invoiceDetail.Quantity, 
                                            PriceString = invoiceDetail.Price,
                                            TotalNetString = invoiceDetail.TotalNet,
                                            ItemName = itemFile.ItemName,
                                            ItemPriceString = itemFile.Price,
                                            Total = invoice.Total,
                                            ItemID = invoiceDetail.ItemID,
                                            ImageUrl=itemFile.ImageUrl                                        
                                        }).ToListAsync();

            Debug.WriteLine($"Query returned {invoiceDetails.Count} records for InvoiceNum: {invoiceNum}");

            var result = invoiceDetails.Select(x =>
            {
                int quantity = int.TryParse(x.QuantityString, out var parsedQuantity) ? parsedQuantity : 0;
                var price = decimal.TryParse(x.PriceString, out var parsedPrice) ? parsedPrice : 0m;
                var totalNet = decimal.TryParse(x.TotalNetString, out var parsedTotalNet) ? parsedTotalNet : 0m;
                var itemPrice = decimal.TryParse(x.ItemPriceString, out var parsedItemPrice) ? parsedItemPrice : 0m;

             
                Debug.WriteLine($"invoiceDetailid:{x.ID},invoiceNum: {invoiceNum}, ItemID: {x.ItemID}, ItemName: {x.ItemName}, Price: {price}, TotalNet: {totalNet}, ItemPrice: {itemPrice}, TotalString: {x.Total}");


                return new InvoiceDetailDTO
                {
                    ID=x.ID,
                    DateCreated = x.DateCreated,
                    Quantity = quantity,
                    Price = price,
                    TotalNet = totalNet,
                    ItemName = x.ItemName,
                    TotalString = x.Total,
                    ImageUrl=x.ImageUrl,
                    ItemID=x.ItemID
                };
            }).ToList();

            return result;
        }


        public async Task<(string FirstName, string LastName, string Phone, string Country, string City,string Company,string Address)> GetCustomerInfoWithAddressByInvoiceNum(int invoiceNum)
        {
            if (invoiceNum <= 0)
            {
                throw new ArgumentException("InvoiceNum must be greater than zero.", nameof(invoiceNum));
            }

            Debug.WriteLine($"Fetching customer info for InvoiceNum: {invoiceNum}");

            var customerInfo = await (
                from invoice in dBContext.Invoice
                join customer in dBContext.Customer on invoice.CustomerID equals customer.ID
                join country in dBContext.Country on customer.CountryID equals country.ID into countryGroup
                from country in countryGroup.DefaultIfEmpty()
                join city in dBContext.City on country.ID equals city.CountyID into cityGroup
                from city in cityGroup.DefaultIfEmpty()
                where invoice.InvoiceNum == invoiceNum
                select new
                {
                    customer.FirstName,
                    customer.LastName,
                    customer.Phone,
                    customer.Address,                  
                    customer.Company,
                    CountryName = country != null ? country.CountryName : null,
                    CityName = city != null ? city.CityName : null,
                   
                }
            ).FirstOrDefaultAsync();

            if (customerInfo == null)
            {
                Debug.WriteLine($"No customer info found for InvoiceNum: {invoiceNum}");
                return (null, null, null, null, null, null,null);
            }

         
            Debug.WriteLine($"Customer Info Retrieved: FirstName: {customerInfo.FirstName}, LastName: {customerInfo.LastName}, Phone: {customerInfo.Phone}, Country: {customerInfo.CountryName}, City: {customerInfo.CityName},address:{customerInfo.Address},company:{customerInfo.Company}");

            return (customerInfo.FirstName, customerInfo.LastName, customerInfo.Phone, customerInfo.CountryName, customerInfo.CityName,customerInfo.Company,customerInfo.Address);
        }
        public async Task<Invoice> GetById(int id)
        {
            
            return await dBContext.Invoice.FindAsync(id);
        }



        public async Task<bool> FindAndUpdateInvoiceStatus(int invoiceNum, string status)
        {
            if (invoiceNum <= 0)
            {
                throw new ArgumentException("InvoiceNum must be greater than zero.", nameof(invoiceNum));
            }

            try
            {
                Debug.WriteLine($"Searching for invoice with InvoiceNum: {invoiceNum}");

             
                var invoice = await dBContext.Invoice
                    .FirstOrDefaultAsync(i => i.InvoiceNum == invoiceNum);

                if (invoice == null)
                {
                    Debug.WriteLine($"No invoice found with InvoiceNum: {invoiceNum}");
                    return false; 
                }

              
                invoice.Status = status;

               
                await dBContext.SaveChangesAsync();
                Debug.WriteLine($"Invoice {invoiceNum} status updated to '{status}'.");
                return true; 
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error occurred while searching for invoice: {ex.Message}");
                return false; 
            }
        }

        public async Task<string> GetInvoiceStatus(int invoiceNum)
        {
            try
            {
                Debug.WriteLine($"Fetching status for InvoiceNum: {invoiceNum}");

                var invoice = await dBContext.Invoice
                    .FirstOrDefaultAsync(i => i.InvoiceNum == invoiceNum); 

                return invoice?.Status; 
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching invoice status: {ex.Message}");
                return null;
            }
        }
    }
}