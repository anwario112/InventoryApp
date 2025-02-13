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
    public class ExportedRakEntity : IDataHelper<ExportedRak>
    {
        private readonly DBContext dbContext;

        public ExportedRakEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(ExportedRak table)
        {
           await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<ExportedRak> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ExportedRak>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(ExportedRak table)
        {
            throw new NotImplementedException();
        }

        public async Task<int?> GetIdByRakName(string rakName)
        {
            var exportedRak = await dbContext.ExportedRak
                                             .Where(r => r.ExportedRakName == rakName)
                                             .Select(r => r.ID)
                                             .FirstOrDefaultAsync();
            return exportedRak == 0 ? (int?)null : exportedRak;
        }


        public async Task<bool> RakNameExists(string rakName)
        {        

         
            return await dbContext.ExportedRak
                .AnyAsync(r => r.ExportedRakName.ToLower() == rakName.ToLower());
        }

        public async Task<Dictionary<string, List<string>>> GetRaksWithSections()
        {
            var raksWithSections = await (from rak in dbContext.ExportedRak
                                          join section in dbContext.ExportedSection on rak.ID equals section.ExportedakID
                                          group section by rak.ExportedRakName into g
                                          select new
                                          {
                                              RakName = g.Key,
                                              SectionNames = g.Select(s => s.ExportedSectionName).ToList()
                                          }).ToListAsync();
            Debug.WriteLine("RaksWithSections:");
            foreach (var rakWithSections in raksWithSections)
            {
                Debug.WriteLine($"RakName: {rakWithSections.RakName}");
                Debug.WriteLine($"SectionNames: {string.Join(", ", rakWithSections.SectionNames)}");
            }

            var result = raksWithSections.ToDictionary(x => x.RakName, x => x.SectionNames);
            return result;
        }


        public async Task<List<string>> GetSectionsByRakName(string rakName)
        {
            
            var rakId = await GetIdByRakName(rakName);

       
            if (rakId == null)
            {
               
                return new List<string>(); 
            }

          
            var sections = await dbContext.ExportedSection
                                           .Where(section => section.ExportedakID == rakId)
                                           .Select(section => section.ExportedSectionName)
                                           .ToListAsync();

            return sections;
        }



    }
}
