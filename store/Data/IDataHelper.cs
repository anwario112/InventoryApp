using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Data
{
     public interface IDataHelper<Table>
    {
        Task<List<Table>> GetConnection(string serverName, string databaseName, string username, string password, string year);
        Task AddData(Table table);
        Task AddDataRange(List<Table> tables);
        Task UpdateData(Table table);
        Task<ItemBarcode> GetItemByBarcode(string barcode);


    }
}
