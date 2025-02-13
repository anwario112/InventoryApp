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
    public class ShoppingCardEntity : IDataHelper<ShoppingCard>
    {
        private readonly DBContext dBContext;

        public ShoppingCardEntity()
        {
            dBContext = new DBContext();
        }
        public async Task AddData(ShoppingCard table)
        {
            await dBContext.AddAsync(table);
            await dBContext.SaveChangesAsync();
        }

        public Task AddDataRange(List<ShoppingCard> tables)
        {
            throw new NotImplementedException();
        }

        public Task<List<ShoppingCard>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            throw new NotImplementedException();
        }

        public Task<Models.ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }

        public Task UpdateData(ShoppingCard table)
        {
            throw new NotImplementedException();
        }

        public async Task<int> GetShoppingCartCount(int userId)
        {
            var shoppingCartCount = await dBContext.ShoppingCard
                .Where(sc => sc.UserID == userId)
                .CountAsync();
            return shoppingCartCount;
        }


        public async Task<IEnumerable<dynamic>> GetShoppingCartItems(int userId)
        {

            var shoppingCartItems = await (from shoppingCard in dBContext.ShoppingCard
                                           join itemFile in dBContext.ItemFile
                                           on shoppingCard.ItemID equals itemFile.ItemID
                                           where shoppingCard.UserID == userId
                                           select new
                                           {
                                               shoppingCard.ID,
                                               shoppingCard.Quantity,
                                               shoppingCard.Price,
                                               itemFile.ItemName,
                                               itemFile.ItemNum,
                                               itemFile.ImageUrl

                                           })
                                            .ToListAsync();


            return shoppingCartItems;

        }

        public async Task<decimal> CalculateTotalPrice(int userId)
        {
            
            var shoppingCartItems = await dBContext.ShoppingCard
                .Where(sc => sc.UserID == userId)
                .ToListAsync();

          
            var totalPrice = shoppingCartItems.Sum(sc =>
            {
                decimal price = 0;

                
                if (!string.IsNullOrEmpty(sc.Price))
                {
                    
                    if (decimal.TryParse(sc.Price, out price))
                    {
                        return price; 
                    }
                }

                return 0; 
            });

            return totalPrice; 
        }

        public async Task<bool> DeleteShoppingCartItem(int itemId)
        {
            try
            {
                
                var itemToDelete = await dBContext.ShoppingCard
                    .FirstOrDefaultAsync(sc => sc.ID == itemId);

                if (itemToDelete != null)
                {
                    
                    dBContext.ShoppingCard.Remove(itemToDelete);
                    await dBContext.SaveChangesAsync();

                    return true; 
                }

                return false; 
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error deleting item: {ex.Message}");
                return false;
            }
        }
    }
}
