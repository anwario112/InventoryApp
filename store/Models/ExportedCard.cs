using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public  class ExportedCard
    {
        public int ID { get; set; }

        [Column("ScanningNum")]
        public string ScanningNum { get; set; }

        [Column("ItemName")]
        public string ItemName { get; set; }

        [Column("Quantity")]
        public float Quantity { get; set; }

        [Column("Price")]
        public string Price { get; set; }

        [Column("ItemID")]
        public string ItemID { get; set; }

        [Column("UnitID")]
        public int UnitID { get; set; }
        public int SectionID { get; set; }

        [ForeignKey("SectionID")]
        public virtual ExportedSection ExportedSection { get; set; }
    }
}
