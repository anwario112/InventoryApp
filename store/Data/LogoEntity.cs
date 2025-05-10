using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using store.Models;
namespace store.Data
{
    public class LogoEntity : IDataHelper<LogoCompany>
    {
        private readonly DBContext _dbContext;

        public LogoEntity()
        {
            try
            {
                _dbContext = new DBContext();
                Debug.WriteLine("DBContext created successfully in LogoEntity");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"CRITICAL ERROR: Failed to create DBContext in LogoEntity: {ex}");
                throw;
            }
        }

        public async Task<List<LogoCompany>> GetAllLogos()
        {
            try
            {
                return await _dbContext.LogoCompany.ToListAsync();
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error getting logos: {ex.Message}");
                throw;
            }
        }

        public async Task<bool> AddData(LogoCompany logo)
        {
            try
            {
                if (logo == null)
                {
                    Debug.WriteLine("[ERROR] LogoCompany is null");
                    return false;
                }

                if (string.IsNullOrEmpty(logo.image) || logo.ImageData == null)
                {
                    Debug.WriteLine("[ERROR] LogoCompany properties are invalid");
                    return false;
                }

                if (_dbContext == null)
                {
                    Debug.WriteLine("[ERROR] DBContext is null");
                    return false;
                }

                Debug.WriteLine($"Adding logo: {logo.image}, ImageData length: {logo.ImageData.Length}");
                await _dbContext.LogoCompany.AddAsync(logo);
                int result = await _dbContext.SaveChangesAsync();
                Debug.WriteLine($"Save result: {result}");
                return result > 0;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"[DB ERROR] {ex}");
                throw;
            }
        }

        public async Task<bool> UpdateData(LogoCompany logo)
        {
            try
            {
                _dbContext.LogoCompany.Update(logo);
                int result = await _dbContext.SaveChangesAsync();
                return result > 0;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in UpdateData: {ex.Message}");
                throw;
            }
        }

        public async Task<bool> DeleteData(int id)
        {
            try
            {
                var logo = await _dbContext.LogoCompany.FindAsync(id);
                if (logo == null)
                    return false;

                _dbContext.LogoCompany.Remove(logo);
                int result = await _dbContext.SaveChangesAsync();
                return result > 0;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in DeleteData: {ex.Message}");
                throw;
            }
        }

       

        public Task<List<LogoCompany>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        async Task IDataHelper<LogoCompany>.AddData(LogoCompany table)
        {
            await AddData(table);
        }

        public Task AddDataRange(List<LogoCompany> tables)
        {
            throw new NotImplementedException();
        }

        async Task IDataHelper<LogoCompany>.UpdateData(LogoCompany table)
        {
            await UpdateData(table);
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }
    }
}