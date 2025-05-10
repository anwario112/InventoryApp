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
    public class ExportedRakInventoryEntity : IDataHelper<ExportedRakInventory>
    {
        private readonly DBContext dbContext;

        public ExportedRakInventoryEntity()
        {
            dbContext = new DBContext();
        }

        public async Task AddData(ExportedRakInventory table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<ExportedRakInventory> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ExportedRakInventory>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<Models.ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }



        public async Task<Dictionary<string, List<string>>> GetRaksWithSections()
        {
            var raksWithSections = await (from rak in dbContext.ExportedRakInventory
                                          join section in dbContext.ExportedSectionInventory on rak.ID equals section.ExportedakID
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
        public Task UpdateData(ExportedRakInventory table)
        {
            throw new NotImplementedException();
        }

        public async Task<int?> GetIdByRakName(string rakName)
        {
            Debug.WriteLine($"the rakname passed to entity:{rakName}");
            var exportedRak = await dbContext.ExportedRakInventory
                                             .Where(r => r.ExportedRakName == rakName)
                                             .Select(r => r.ID)
                                             .FirstOrDefaultAsync();
            Debug.WriteLine($"the debug is:{exportedRak}");
            return exportedRak == 0 ? (int?)null : exportedRak;
        }


        public async Task<List<string>> GetSectionsByRakName(string rakName)
        {
            try
            {
                Debug.WriteLine($"Getting sections for rak: {rakName}");

                var rakId = await GetIdByRakName(rakName);
                if (rakId == null)
                {
                    Debug.WriteLine($"No rak found with name: {rakName}");
                    return new List<string>();
                }

                var sections = await dbContext.ExportedSectionInventory
                    .Where(s => s.ExportedakID == rakId)
                    .Select(s => s.ExportedSectionName)
                    .ToListAsync();

                Debug.WriteLine($"Found {sections.Count} sections: {string.Join(", ", sections)}");
                return sections;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error getting sections: {ex}");
                return new List<string>();
            }
        }

        public async Task<bool> DeleteByRakName(string rakName)
        {
            try
            {
                Debug.WriteLine($"Attempting to delete rak: {rakName}");

              
                var rakToDelete = await dbContext.ExportedRakInventory
                    .FirstOrDefaultAsync(r => r.ExportedRakName == rakName);

                if (rakToDelete == null)
                {
                    Debug.WriteLine($"Rak '{rakName}' not found");
                    return false;
                }

            
                var sectionsToDelete = await dbContext.ExportedSectionInventory
                    .Where(s => s.ExportedakID == rakToDelete.ID)
                    .ToListAsync();

                var itemCardsToDelete = new List<ExportedItemCardInventory>();
                foreach (var section in sectionsToDelete)
                {
                    var cards = await dbContext.ExportedItemCardInventory
                        .Where(c => c.SectionID == section.ID)
                        .ToListAsync();
                    itemCardsToDelete.AddRange(cards);
                }

              
                using (var transaction = await dbContext.Database.BeginTransactionAsync())
                {
                    try
                    {
                      
                        if (itemCardsToDelete.Any())
                        {
                            dbContext.ExportedItemCardInventory.RemoveRange(itemCardsToDelete);
                            await dbContext.SaveChangesAsync();
                        }

                      
                        if (sectionsToDelete.Any())
                        {
                            dbContext.ExportedSectionInventory.RemoveRange(sectionsToDelete);
                            await dbContext.SaveChangesAsync();
                        }

                     
                        dbContext.ExportedRakInventory.Remove(rakToDelete);
                        await dbContext.SaveChangesAsync();

                        await transaction.CommitAsync();
                        Debug.WriteLine($"Successfully deleted rak '{rakName}' and all related data");
                        return true;
                    }
                    catch (Exception ex)
                    {
                        await transaction.RollbackAsync();
                        Debug.WriteLine($"Error deleting rak '{rakName}': {ex.Message}");
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in DeleteByRakName: {ex}");
                return false;
            }
        }

    }
}
