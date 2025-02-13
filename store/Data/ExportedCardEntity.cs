using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public class ExportedCardEntity : IDataHelper<ExportedCard>
    {

        private readonly DBContext _dbContext;

        public ExportedCardEntity()
        {
            _dbContext = new DBContext();
        }
        public async Task AddData(ExportedCard table)
        {
            await _dbContext.AddAsync(table);
            await _dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<ExportedCard> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ExportedCard>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public async Task UpdateData(ExportedCard table)
        {
            if (table == null)
            {
                throw new ArgumentNullException(nameof(table), "The exported card cannot be null.");
            }

          
            var existingCard = await _dbContext.ExportedCard.FindAsync(table.ID);
            if (existingCard == null)
            {
                throw new InvalidOperationException($"No exported card found with ID {table.ID}.");
            }

         
            existingCard.ScanningNum = table.ScanningNum;
            existingCard.ItemName = table.ItemName;
            existingCard.Quantity = table.Quantity;
            existingCard.Unit = table.Unit;
            existingCard.SectionID = table.SectionID;

          
            await _dbContext.SaveChangesAsync();
        }

        public async Task<ExportedCard> GetItemByScanningNum(string barcode)
        {
            return await _dbContext.ExportedCard
                .FirstOrDefaultAsync(c => c.ScanningNum == barcode);
        }
    }
}
