using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class ItemCardsInventory
    {
        public int ID { get; set; }

        [Column("ScanningNum")]
        public string ScanningNum { get; set; }

       

        [Column("Quantity")]
        public float Quantity { get; set; }


        [Column("LastUpdate")]
        public DateTime LastUpdate { get; set; } = DateTime.Now;
        public int SectionID { get; set; }

        [ForeignKey("SectionID")]
        public virtual SectionInventory SectionInventory { get; set; }
    }
}
