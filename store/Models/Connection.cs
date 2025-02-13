using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Models
{
    [Table("Connections")]
     public class Connection
    {
        [Key]
        public int Id { get; set; }
        [Column("ServerName")]
        public string ServerName { get; set; }

        [Column("DatabaseName")]
        public string DatabaseName { get; set; }

        [Column("Username")]
        public string Username { get; set; }

        [Column("Year")]
        public string Year { get; set; }

        [Column("Password")]
        public string Password { get; set; }

    }
}
