using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class UserEntity:IDataHelper<User>
    {
        private DBContext dbContext;

        public UserEntity()
        {
            dbContext = new DBContext();
        }

        public async Task AddData(User table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<User> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<User>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(User table)
        {
            throw new NotImplementedException();
        }

        public async Task<List<User>> GetAllData() 
        {

            return await dbContext.User.ToListAsync(); 

        }

        public async Task<bool> CheckUsernameExists(string username)
        {
            return await dbContext.User.AnyAsync(u => u.UserName.ToLower() == username.ToLower());
        }


        public async Task<int?> FindUser(string username)
        {
           
            if (string.IsNullOrWhiteSpace(username))
            {
                return null; 
            }
   
            var userId = await dbContext.User
                .Where(u => u.UserName.ToLower() == username.ToLower())
                .Select(u => u.ID) 
                .FirstOrDefaultAsync(); 
            

            return userId;
        }

       
    }
}
