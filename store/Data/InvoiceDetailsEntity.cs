using Microsoft.Data.Sqlite;
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

        public async Task UpdateData(InvoiceDetails updatedInvoiceDetail)
        {
            
            var existingDetail = await dbContext.invoiceDetails
                .FirstOrDefaultAsync(detail => detail.ID == updatedInvoiceDetail.ID);

            if (existingDetail != null)
            {
                existingDetail.Quantity = updatedInvoiceDetail.Quantity;
                existingDetail.Price = updatedInvoiceDetail.Price;
                existingDetail.TotalNet = updatedInvoiceDetail.TotalNet;

                await dbContext.SaveChangesAsync();
            }
            else
            {
                Debug.WriteLine($"InvoiceDetail with ID {updatedInvoiceDetail.ID} not found.");
            }
        }

        public async Task<decimal> GetTotalNetSumByInvoiceId(int invoiceId)
        {
            var invoiceDetails = await dbContext.invoiceDetails
                .Where(id => id.InvoiceID == invoiceId)
                .ToListAsync(); 

           
            decimal totalNetSum = 0m;

            foreach (var detail in invoiceDetails)
            {
               
                if (decimal.TryParse(detail.TotalNet, out var totalNetValue))
                {
                    totalNetSum += totalNetValue; 
                }
                else
                {

                }
            }

            return totalNetSum; 
        }


        public async Task<bool> ItemExists(int itemId)
        {
           
            return await dbContext.invoiceDetails
                .AnyAsync(detail => detail.ItemID == itemId);
        }

        public async Task<InvoiceDetails> GetInvoiceDetailsByItemIdAndInvoiceId(int itemId, int invoiceId)
        {
            return await dbContext.invoiceDetails
                .FirstOrDefaultAsync(detail => detail.ItemID == itemId && detail.InvoiceID == invoiceId);
        }

        public async Task<List<InvoiceDetails>> GetInvoiceDetailsByInvoiceNum(int invoiceNum)
        {
            return await dbContext.invoiceDetails
                .Where(detail => detail.InvoiceID == invoiceNum)
                .ToListAsync();
        }

        public async Task<bool> DeleteData(int id)
        {
           
            var invoiceDetail = await dbContext.invoiceDetails.FindAsync(id);

            if (invoiceDetail != null)
            {
                dbContext.invoiceDetails.Remove(invoiceDetail); 
                await dbContext.SaveChangesAsync();
                return true; 
            }
            else
            {
                Debug.WriteLine($"InvoiceDetail with ID {id} not found.");
                return false;
            }
        }

        public async Task<List<InvoiceDetails>> GetAllByInvoiceIdAsync(int invoiceId)
        {
            return await dbContext.invoiceDetails
                .Where(d => d.InvoiceID == invoiceId)
                .ToListAsync();
        }



        public async Task<bool> UpdateItemQuantity(int itemId, int quantity)
        {
            try
            {
                var invoiceDetail = await dbContext.invoiceDetails.FindAsync(itemId);
                if (invoiceDetail == null)
                {
                    Debug.WriteLine($"Item with ID {itemId} not found in database");
                    return false;
                }

                
                invoiceDetail.Quantity = quantity.ToString();

          
                if (decimal.TryParse(invoiceDetail.Price, out decimal price))
                {
                    decimal newTotal = price * quantity;
                    invoiceDetail.TotalNet = newTotal.ToString("F2");
                    Debug.WriteLine($"New total calculated: {newTotal}");
                }
                else
                {
                    Debug.WriteLine($"Failed to parse price: {invoiceDetail.Price}");
                }

                await dbContext.SaveChangesAsync();
                Debug.WriteLine($"Item {itemId} quantity updated to {quantity} in database");
                return true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error updating item quantity: {ex.Message}");
                return false;
            }
        }



    }
}
