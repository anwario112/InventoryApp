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
        public string UnitID { get; set; }
        public string UnitDesc { get; set; }
        public string UnitIDSel { get; set; }
        public string SalePrice { get; set; }
        public string SaleNetLL { get; set; }
        public string SaleNetUSD { get; set; }
        public string CurrencyIdSel { get; set; }
        public string Rate { get; set; }
        public string PackingPrincipalCost { get; set; }
    }
}
