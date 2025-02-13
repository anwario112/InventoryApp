using System;
using System.Net.Http;
using System.Threading.Tasks;
namespace store.Api
{
    public class HttpHelper
    {
        private static readonly HttpClient _client = new HttpClient();
        public HttpHelper()
        {

        
            _client.Timeout = TimeSpan.FromSeconds(5); 

        }
        public async Task<string> GetResponse(string url)
        {
            using (var client = new HttpClient())
            {
               
                HttpResponseMessage response = await client.GetAsync(url);

               
                if (response.IsSuccessStatusCode)
                {
                   
                    return await response.Content.ReadAsStringAsync();
                }
                else
                {
                    return null; 
                }
            }
        }
    }
}
