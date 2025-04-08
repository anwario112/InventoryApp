using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class RakInventory
    {
        [Key]
        public int ID { get; set; }

        [Column("RakName")]
        public string RakName { get; set; }

        [Column("DateCreated")]
        public DateTime DateCreated { get; set; } = DateTime.Now;

        public virtual ICollection<SectionInventory> SectionInventory { get; set; } = new List<SectionInventory>();
    }
}
