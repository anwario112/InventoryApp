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
    public class SectionInventoryEntity : IDataHelper<SectionInventory>
    {


        private readonly DBContext dbContext;

        public SectionInventoryEntity()
        {
            dbContext = new DBContext();
        }
        public async Task AddData(SectionInventory table)
        {

            await dbContext.AddAsync(table);
            await dbContext.SaveChangesAsync();
        }


        public async Task<bool> SectionNameExist(string sectionName)
        {

            return await dbContext.SectionInventory.AnyAsync(s => s.SectionName.ToLower() == sectionName.ToLower());

        }



        public async Task<List<SectionInventory>> GetSections(int RakID)
        {
                var sections= await dbContext.SectionInventory

             .Where(s => s.RakID == RakID)

             .ToListAsync();

            foreach (var section in sections)
            {
                Debug.WriteLine($"[GetSections] Section ID: {section.ID}, Name: {section.SectionName}, RakID: {section.RakID}");
            }
            return sections;



        }
        public async Task DeletSection(int SectionID)
        {
            var section = await dbContext.SectionInventory.FindAsync(SectionID);
            if (section != null)
            {
                dbContext.SectionInventory.Remove(section);
                await dbContext.SaveChangesAsync();
            }
            else
            {
                throw new Exception("Section not found.");
            }
        }




        public async Task<(string sectionName, string rakName, List<ItemCardsInventory> itemCardsInventory)>
      GetSectionRakDetailsBySectionID(int sectionID)
        {
            try
            {
                var result = await (from s in dbContext.SectionInventory
                                    join r in dbContext.RakInventory on s.RakID equals r.ID
                                    where s.ID == sectionID
                                    select new
                                    {
                                        SectionName = s.SectionName,
                                        RakName = r.RakName,
                                        ItemCards = dbContext.ItemCardsInventory
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
                    return (null, null, new List<ItemCardsInventory>());
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error retrieving Section and Rak details for SectionID {sectionID}: {ex.Message}");
                return (null, null, new List<ItemCardsInventory>());
            }
        }


        public Task AddDataRange(List<SectionInventory> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<SectionInventory>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(SectionInventory table)
        {
            throw new NotImplementedException();
        }
    }
}
