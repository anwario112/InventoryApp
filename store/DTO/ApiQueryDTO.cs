using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.DTO
{
    public class ApiQueryDTO
    {
        public string ItemID { get; set; }
        public string ItemNum { get; set; }
        public string ItemName { get; set; }
        public string Price { get; set; }
        public string ImageUrl { get; set; }
        public string ItemNumUnit {  get; set; }
        public string UnitDesc { get; set; }
        public string Barcode { get; set; }
        public string BarcodePrice { get; set; }
    }
}
