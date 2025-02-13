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
    public class ExportedSectionEntity : IDataHelper<ExportedSection>
    {
        private readonly DBContext dbContext;
        public ExportedSectionEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(ExportedSection table)
        {
           await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<ExportedSection> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ExportedSection>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(ExportedSection table)
        {
            throw new NotImplementedException();
        }


        public async Task<int?> GetSectionIdByName(string sectionName)
        {
            try
            {
              
                var sectionId = await dbContext.ExportedSection
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


        public async Task<bool> SectionNameExists(string sectionName)
        {
            if (string.IsNullOrEmpty(sectionName))
            {
                return false; 
            }

            
            return await dbContext.ExportedSection
                .AnyAsync(s => s.ExportedSectionName.ToLower() == sectionName.ToLower());
        }

        public async Task<string> GetRakNameBySectionName(string sectionName)
        {
           

            try
            {
                var rakName = await (from section in dbContext.ExportedSection
                                     join rak in dbContext.ExportedRak on section.ExportedakID equals rak.ID
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


        public async Task<List<ExportedCard>> GetCardsBySectionName(string sectionName)
        {
          
            try
            {
                var cards = await (from card in dbContext.ExportedCard
                                   join section in dbContext.ExportedSection on card.SectionID equals section.ID
                                   where section.ExportedSectionName.ToLower() == sectionName.ToLower()
                                   select card)
                                   .ToListAsync();

                return cards;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving cards for SectionName '{sectionName}': {ex.Message}");
                return new List<ExportedCard>(); 
            }
        }



        public async Task<List<ExportedCard>> GetAllCardsFromAllSections(List<string> sections)
        {
            try
            {
                if (sections == null || sections.Count == 0)
                {
                    Debug.WriteLine("No sections provided.");
                    return new List<ExportedCard>();
                }

              
                var sectionNames = sections.Select(s => s.Trim()).ToList();

                Debug.WriteLine($"Fetching cards for sections: {string.Join(", ", sectionNames)}");

                var allCards = await (from card in dbContext.ExportedCard
                                      join section in dbContext.ExportedSection on card.SectionID equals section.ID
                                      where sectionNames.Contains(section.ExportedSectionName)  
                                      select card)
                                     .ToListAsync();

                Debug.WriteLine($"Retrieved {allCards.Count} cards.");

                return allCards;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving all cards from specified sections: {ex.Message}");
                return new List<ExportedCard>();
            }
        }

        public async Task<List<ExportedCard>> GetAllCardsForSectionName(string sectionName)
        {
            try
            {
                if (string.IsNullOrEmpty(sectionName))
                {
                    Debug.WriteLine("Section name is null or empty.");
                    return new List<ExportedCard>();
                }

                var cards = await (from card in dbContext.ExportedCard
                                   join section in dbContext.ExportedSection on card.SectionID equals section.ID
                                   where section.ExportedSectionName.ToLower() == sectionName.ToLower()
                                   select card)
                                   .ToListAsync();

                Debug.WriteLine($"Retrieved {cards.Count} cards for SectionName '{sectionName}'.");

                return cards;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving cards for SectionName '{sectionName}': {ex.Message}");
                return new List<ExportedCard>();
            }
        }



    }
}
