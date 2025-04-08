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
    class ExportedSectionInventoryEntity : IDataHelper<ExportedSectionInventory>
    {

        private readonly DBContext dbContext;
        public ExportedSectionInventoryEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(ExportedSectionInventory table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<ExportedSectionInventory> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ExportedSectionInventory>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(ExportedSectionInventory table)
        {
            throw new NotImplementedException();
        }
        public async Task<bool> SectionNameExists(string sectionName)
        {
            if (string.IsNullOrEmpty(sectionName))
            {
                return false;
            }


            return await dbContext.ExportedSectionInventory
                .AnyAsync(s => s.ExportedSectionName.ToLower() == sectionName.ToLower());
        }

        public async Task<int?> GetSectionIdByName(string sectionName)
        {
            try
            {

                var sectionId = await dbContext.ExportedSectionInventory
                    .Where(s => s.ExportedSectionName.ToLower() == sectionName.ToLower())
                    .Select(s => s.ID)
                    .FirstOrDefaultAsync();

                return sectionId;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving Section ID for SectionName '{sectionName}': {ex.Message}");
                return null;
            }
        }


        public async Task<List<ExportedItemCardInventory>> GetAllCardsFromAllSections(List<string> sections)
        {
            try
            {
                if (sections == null || sections.Count == 0)
                {
                    Debug.WriteLine("No sections provided.");
                    return new List<ExportedItemCardInventory>();
                }


                var sectionNames = sections.Select(s => s.Trim()).ToList();

                Debug.WriteLine($"Fetching cards for sections: {string.Join(", ", sectionNames)}");

                var allCards = await (from card in dbContext.ExportedItemCardInventory
                                      join section in dbContext.ExportedSectionInventory on card.SectionID equals section.ID
                                      where sectionNames.Contains(section.ExportedSectionName)
                                      select card)
                                     .ToListAsync();

                Debug.WriteLine($"Retrieved {allCards.Count} cards.");

                return allCards;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving all cards from specified sections: {ex.Message}");
                return new List<ExportedItemCardInventory>();
            }
        }

        public async Task<List<ExportedItemCardInventory>> GetCardsBySectionName(string sectionName)
        {

            try
            {
                var cards = await (from card in dbContext.ExportedItemCardInventory
                                   join section in dbContext.ExportedSectionInventory on card.SectionID equals section.ID
                                   where section.ExportedSectionName.ToLower() == sectionName.ToLower()
                                   select card)
                                   .ToListAsync();

                return cards;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving cards for SectionName '{sectionName}': {ex.Message}");
                return new List<ExportedItemCardInventory>();
            }
        }



        public async Task<string> GetRakNameBySectionName(string sectionName)
        {


            try
            {
                var rakName = await (from section in dbContext.ExportedSectionInventory
                                     join rak in dbContext.ExportedRakInventory on section.ExportedakID equals rak.ID
                                     where section.ExportedSectionName.ToLower() == sectionName.ToLower()
                                     select rak.ExportedRakName)
                                     .FirstOrDefaultAsync();

                return rakName;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving RakName for SectionName '{sectionName}': {ex.Message}");
                return null;
            }
        }


    }
}
