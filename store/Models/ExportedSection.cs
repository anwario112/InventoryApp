using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class ExportedSection
    {
        public int ID { get; set; }
        public string ExportedSectionName { get; set; }
        public int ExportedakID { get; set; }

        [ForeignKey("ExportedakID")]
        public virtual ExportedRak ExportedRak { get; set; }

    }
}
