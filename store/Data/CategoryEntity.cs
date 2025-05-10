using EFCore.BulkExtensions;
using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class CategoryEntity : IDataHelper<Category>
    {

        private readonly DBContext dBContext;

        public CategoryEntity()
        {
            dBContext = new DBContext();
        }
        public Task AddData(Category table)
        {
            throw new NotImplementedException();
        }

        public Task AddDataRange(List<Category> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<Category>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(Category table)
        {
            throw new NotImplementedException();
        }

        public async Task UpsertCategoryData(List<Category> category)
        {
            await dBContext.BulkInsertOrUpdateAsync(category);
        }

        public async Task<List<Category>> GetAllCategories()
        {
            return await dBContext.Category.OrderBy(c => c.CategoryName).ToListAsync();
        }
    }
}
