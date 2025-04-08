using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.DTO
{
    public class ProductApi
    {
        public string ItemID { get; set; } 
        public string ItemNum { get; set; }
        public string ItemName { get; set; }
        public decimal BasePrice { get; set; }  
        public decimal ConvertedPrice { get; set; } 
        public string Unit { get; set; }  
        public decimal CurrencyRate { get; set; }  
        public int CurrencyID { get; set; }

       
        public string SaleNetLL => ConvertedPrice.ToString();
        public string SaleNetUSD => BasePrice.ToString();
    }
}
