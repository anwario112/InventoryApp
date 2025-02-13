using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public  class ShoppingCard
    {
        public int ID { get; set; }

        [Column("Quantity")]
        public string Quantity  { get; set; }

        [Column("DateCreated")]
        public DateTime DateCreated { get; set; } = DateTime.Now;
        [Column("Price")]
        public string Price   { get; set; }

        [Column("UserID")]
        public int UserID { get; set; }

        [Column("ItemID")]
        public int  ItemID { get; set; }
    }
}
