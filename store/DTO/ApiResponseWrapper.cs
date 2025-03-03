using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace store.DTO
{
    public class ApiResponseWrapper
    {
        [JsonPropertyName("data_query1")]
        public List<ApiQueryDTO> DataQuery1 { get; set; }
    }
}
