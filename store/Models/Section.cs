using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class Section
    {
        [Key]
        public int ID { get; set; }

        [Column("SectionName")]
        public string SectionName { get; set; }


        [Column("DateCreated")]
        public DateTime DateCreated { get; set; } = DateTime.Now;

        public int RakID { get; set; }

        [ForeignKey("RakID")]
       public virtual Rak Rak { get; set; }

        public virtual ICollection<ItemCard> ItemCards { get; set; } = new List<ItemCard>();
    }
}
