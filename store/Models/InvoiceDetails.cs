using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public  class InvoiceDetails
    {
        public int ID { get; set; }
        public int InvoiceID { get; set; }
        public int ItemID { get; set; }
        public string   Quantity {  get; set; }
        public int UnitID { get; set; }
        public string Price { get; set; }
        public bool? TVA { get; set; }
        public string? TvaValue { get; set; }
        public string TotalNet {  get; set; }
        public string? TotalNetTVA { get; set; }
    }
}
