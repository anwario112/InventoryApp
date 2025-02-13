using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    [Table("Rak")]
    public  class Rak
    {
        [Key]
        public int ID { get; set; }

        [Column("RakName")]
        public string RakName { get; set; }

        [Column("DateCreated")]
        public DateTime DateCreated { get; set; } = DateTime.Now;

        public virtual ICollection<Section> Sections { get; set; } = new List<Section>();
    }
}
