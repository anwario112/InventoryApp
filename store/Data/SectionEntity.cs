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
    public class SectionEntity : IDataHelper<Section>
    {

        private readonly DBContext dbContext;

        public SectionEntity()
        {
            dbContext = new DBContext();
        }

        public async Task AddData(Section table)
        {
            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }

        public async Task<bool> SectionNameExist(string sectionName)
        {

            return await dbContext.Sections.AnyAsync(s => s.SectionName.ToLower() == sectionName.ToLower());

        }

        public async Task<List<Section>> GetSections(int RakID)
        {
            return await dbContext.Sections

         .Where(s => s.RakID == RakID)

         .ToListAsync();

        }



        public Task AddDataRange(List<Section> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<Section>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(Section table)
        {
            throw new NotImplementedException();
        }

        public async Task DeletSection(int SectionID)
        {
            var section = await dbContext.Sections.FindAsync(SectionID);
            if (section != null)
            {
                dbContext.Sections.Remove(section);
                await dbContext.SaveChangesAsync();
            }
            else
            {
                throw new Exception("Section not found.");
            }
        }

        public async Task<Section> GetSectionById(int sectionID)
        {
            return await dbContext.Sections.FindAsync(sectionID);
        }


        public async Task<(string SectionName, string RakName, List<ItemCard> ItemCards)> GetSectionRakDetailsBySectionID(int sectionID)
        {
            try
            {
                var result = await (from s in dbContext.Sections
                                    join r in dbContext.Raks on s.RakID equals r.ID
                                    where s.ID == sectionID
                                    select new
                                    {
                                        s.SectionName,
                                        r.RakName,
                                        ItemCards = dbContext.ItemCards
                                                            .Where(ic => ic.SectionID == s.ID) 
                                                            .ToList() 
                                    })
                                    .FirstOrDefaultAsync();

                if (result != null)
                {
                    return (result.SectionName, result.RakName, result.ItemCards);
                }
                else
                {
                    return (null, null, new List<ItemCard>());
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving Section and Rak details for SectionID {sectionID}: {ex.Message}");
                return (null, null, new List<ItemCard>());
            }
        }
    }
}
