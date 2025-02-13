using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class ItemArchive
    {

        public int ID { get; set; }

        [Column("ScanningNum")]
        public string ScanningNum { get; set; }

        [Column("ItemName")]
        public string ItemName { get; set; }

        [Column("Quantity")]
        public int Quantity { get; set; }

        [Column("Unit")]
        public string Unit { get; set; }
        public int SectionID { get; set; }

        [ForeignKey("SectionID")]
        public virtual Section Section { get; set; }
    }
}
