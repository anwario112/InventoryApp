using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace store.Models
{
    public class ItemUnit
    {
        public int Id { get; set; }
        public string UnitDesc { get; set; }

        [JsonConverter(typeof(IntConverter))]
        public int ItemID { get; set; }



    }
}
