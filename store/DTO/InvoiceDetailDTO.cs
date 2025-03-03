using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.DTO
{
    public  class InvoiceDetailDTO
    {
        public int ID { get; set; }
        public DateTime DateCreated { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal TotalNet { get; set; }
        public string ItemName { get; set; }
        public string TotalString { get; set; }
        public string ImageUrl { get; set; }
        public int ItemID { get; set; }


    }
}
