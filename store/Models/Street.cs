using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class Street
    {
        public int ID { get; set; }
        public int StreetNum { get; set; }
        public string StreetDesc { get; set; }
        public int CityID { get; set; }
    }
}
