using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class Invoice
    {
        public int ID { get; set; }
        public int InvoiceNum { get; set; }
        public int? InvoiceTypeID { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.Now;
        public int? CurrencyID { get; set; }
        public string? Rate {  get; set; }
        public int UserID { get; set; }
        public int? BranchID { get; set; }
        public string Total { get; set; }
        public string? Discount { get; set; }
        public bool? TVA { get; set; }
        public string? TvaValue { get; set; }
        public string? NetTotalTVA { get; set; }
        public int? CustomerID { get; set; }
        public string Status { get; set; }
        public int? CashierID { get; set; }

    }
}
