using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.DTO
{
    public class ApiResponse
    {
        public bool Success { get; set; }
        public ProductApi Data { get; set; }
    }
}
