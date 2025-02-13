using Microsoft.EntityFrameworkCore;
using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
    public  class ConnectionEntity :IDataHelper<Connection>
    {
        private DBContext db;

        public ConnectionEntity()
        {
            db = new DBContext();
        }

        public async Task AddData(Connection table)
        {
            await db.Connections.AddAsync(table);
            await db.SaveChangesAsync();
        }
        
       
        public async Task UpdateData(Connection table)
        {
            await Task.Run(() => db.Connections.Update(table));
            await db.SaveChangesAsync();
        }

        public async Task<List<Connection>> GetConnection(string serverName, string databaseName, string username, string password, string year)
        {
            return await db.Connections
                            .Where(c => (string.IsNullOrEmpty(serverName) || c.ServerName.Contains(serverName)) &&
                                        (string.IsNullOrEmpty(databaseName) || c.DatabaseName.Contains(databaseName)) &&
                                        (string.IsNullOrEmpty(username) || c.Username.Contains(username)) &&
                                        (string.IsNullOrEmpty(password) || c.Password.Contains(password)) &&
                                        (string.IsNullOrEmpty(year) || c.Year.Contains(year)))
                            .ToListAsync();
        }

        public Task AddDataRange(List<Connection> tables)
        {
            throw new NotImplementedException();
        }

        public Task<ItemBarcode> GetItemByBarcode(string barcode)
        {
            throw new NotImplementedException();
        }
    }
}
