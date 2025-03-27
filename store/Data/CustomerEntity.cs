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

       public async Task<bool> UpdateData(Customer table)
        {
            try
            {
               
                var customer = await dbContext.Customer
                    .FirstOrDefaultAsync(c => c.ID == table.ID);

                if (customer == null)
                {
                    
                    return false;
                }

               
                customer.FirstName = table.FirstName;
                customer.LastName = table.LastName;
                customer.Phone = table.Phone;
                customer.Company = table.Company;
                customer.Address = table.Address;
              

             
                await dbContext.SaveChangesAsync();

               
                return true;
            }
            catch (Exception ex)
            {
               
                Console.WriteLine($"Error updating customer: {ex.Message}");

           
                return false;
            }
        }


        public async Task<int?> GetCustomerIDByPhone(string phone)
        {
            var customer = await dbContext.Customer
                .FirstOrDefaultAsync(c => c.Phone.ToLower() == phone.ToLower()); 

            return customer?.ID;
        }

        public async Task<List<Customer>> SearchCustomersAsync(string searchTerm)
        {
            if (string.IsNullOrWhiteSpace(searchTerm))
                return new List<Customer>();

            searchTerm = searchTerm.ToLower();

            return await dbContext.Customer
                .Where(c =>
                    c.FirstName.ToLower().StartsWith(searchTerm) ||
                    c.LastName.ToLower().StartsWith(searchTerm) ||
                    (c.FirstName + " " + c.LastName).ToLower().StartsWith(searchTerm) ||
                    c.Phone.StartsWith(searchTerm))
                .OrderByDescending(c => c.ID)
                .ToListAsync();
        }
        public async Task<List<Customer>> GetAllCustomersAsync()
        {
            Debug.WriteLine("Fetching customers from the database...");

            var customers = await dbContext.Customer
                                           .OrderByDescending(c => c.ID)
                                           .ToListAsync();

            Debug.WriteLine($"Number of customers retrieved: {customers.Count}");

           
            foreach (var customer in customers)
            {
                Debug.WriteLine($"Customer ID: {customer.ID}, Name: {customer.FirstName} {customer.LastName}, Phone: {customer.Phone}, Address: {customer.Address}");
            }

            return customers;
        }

        public async Task<CustomerDetails> GetCustomerByIdAsync(int customerId)
        {
            var result = await (
                from customer in dbContext.Customer              
                join city in dbContext.City
                    on customer.CityID equals city.ID
                join country in dbContext.Country
                    on customer.CountryID equals country.ID
                where customer.ID == customerId
                select new CustomerDetails
                {
                    CustomerID = customer.ID,
                    CityID=customer.CityID ?? 0,
                    CountryID=customer.CountryID ?? 0,
                    TvaNum=customer.TvaNum,
                  
                    FirstName = customer.FirstName,
                    LastName = customer.LastName,
                    Company = customer.Company,
                    Phone = customer.Phone,
                    Address = customer.Address,                                   
                    Email=customer.Email,
                    CityName = city.CityName,
                    CountryName = country.CountryName
                }
            ).FirstOrDefaultAsync();

            return result;
        }
        public async Task<bool> DoesCustomerExistAsync(int customerId)
        {
           
            return await dbContext.Customer.AnyAsync(c => c.ID == customerId);
        }

        Task IDataHelper<Customer>.UpdateData(Customer table)
        {
            throw new NotImplementedException();
        }
        public async Task<bool> UpdateCustomerImagePath(int customerId, string imagePath)
        {
            try
            {
                
                var customer = await dbContext.Customer
                    .FirstOrDefaultAsync(c => c.ID == customerId);

                if (customer == null)
                {
                    Debug.WriteLine($"Customer with ID {customerId} not found");
                    return false;
                }

              
                customer.ImagePath = imagePath;

          
                await dbContext.SaveChangesAsync();

                Debug.WriteLine($"Successfully updated image path for customer {customerId}");
                return true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error updating customer image path: {ex.Message}");
                return false;
            }
        }

    }
}
