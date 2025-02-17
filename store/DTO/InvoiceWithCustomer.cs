using store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.DTO
{
    public class InvoiceWithCustomer
    {
        public Invoice Invoice { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Initials => $"{FirstName[0]}{LastName[0]}".ToUpper();
    }
}
