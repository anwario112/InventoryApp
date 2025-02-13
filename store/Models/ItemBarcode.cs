using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace store.Models
{
    [Table("ItemBarcode")]
    public class ItemBarcode
    {

        [Key]

        public int Id { get; set; }


        [Column("Barcode")]
        public string? Barcode { get; set; }



        [Column("UnitDesc")]
        public string UnitDesc { get; set; }

        public decimal price { get; set; }

        [JsonConverter(typeof(IntConverter))]
        public int ItemID { get; set; }

        






    }
}
