using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class SectionInventory
    {
        [Key]
        public int ID { get; set; }

        [Column("SectionName")]
        public string SectionName { get; set; }


        [Column("DateCreated")]
        public DateTime DateCreated { get; set; } = DateTime.Now;

        public int RakID { get; set; }

        [ForeignKey("RakID")]
        public virtual RakInventory RakInventory { get; set; }

        public virtual ICollection<ItemCardsInventory> ItemCardsInventory { get; set; } = new List<ItemCardsInventory>();
    }
}
