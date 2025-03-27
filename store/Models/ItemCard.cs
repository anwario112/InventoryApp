using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    [Table("ItemCards")]
    public class ItemCard
    {
        public int ID { get; set; }

        [Column("ScanningNum")]
        public string ScanningNum { get; set; }

        [Column("ItemName")]
        public string ItemName { get; set; }

        [Column("Quantity")]
        public int Quantity { get; set; }

        [Column("Unit")]
        public string? Unit { get; set; }

        public string Price {  get; set; }

        [Column("LastUpdate")]
        public DateTime LastUpdate { get; set; } = DateTime.Now;
        public int SectionID { get; set; }

        [ForeignKey("SectionID")]
        public virtual Section Section { get; set; }

    }
}
