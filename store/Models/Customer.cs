using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    public class Customer
    {
        public int ID { get; set; }
        public int CustomerNum { get; set; }
        public int? CurrencyID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string? Company { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string? Floor { get; set; }
        public int? BranchID { get; set; }
        public int? TvaNum { get; set; }
       
    }
}
