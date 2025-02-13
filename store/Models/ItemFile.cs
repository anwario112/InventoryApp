using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;

namespace store.Models
{
    [Table("ItemFile")]
    public  class ItemFile
    {
        [Key]
        public int Id { get; set; }


        [Column("ItemNum")]
        public string ItemNum { get; set; }

        [Column("ItemName")]
        public string ItemName { get; set; }

        [Column("Price")]
        public string Price { get; set; }

        [Column("ImageUrl")]
        public string? ImageUrl { get; set; }



        [JsonConverter(typeof(IntConverter))]
        public int ItemID { get; set; }

     

    }
}
