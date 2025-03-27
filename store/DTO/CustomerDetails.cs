using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.DTO
{
    
        public class CustomerDetails
        {
            public int CustomerID { get; set; }
            public int CityID { get; set; }
            public int CountryID { get; set; }
            public int CurrencyID { get; set; }
            public string TvaNum { get; set; }
 
           public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Company { get; set; }
            public string Phone { get; set; }
            public string Address { get; set; }
           public string Email { get; set; }


           public string CurrencyName { get; set; }
            public string CityName { get; set; }
            public string CountryName { get; set; }
        }
    }

