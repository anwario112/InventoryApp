using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class City
    {
        public int ID { get; set; }
        public int CityNum { get; set; }
        public string CityName { get; set; }
        public int CountyID { get; set; }
    }
}
