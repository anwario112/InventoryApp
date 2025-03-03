
using System;
using System.Diagnostics;
using System.Net.Http;
using System.Threading.Tasks;

namespace store.Api
{
    public class HttpHelper
    {
        public string ApiKey { get; set; }
        public string SecretKey { get; set; }

        public HttpHelper(string apiKey, string secretKey)
        {
            ApiKey = apiKey;
            SecretKey = secretKey;
            Debug.WriteLine($"HttpHelper Constructor - ApiKey: {ApiKey}, SecretKey: {SecretKey}");
        }

        private HttpClient CreateHttpClient()
        {
            var client = new HttpClient();
            client.Timeout = TimeSpan.FromSeconds(300);
            SetHeaders(client); 
            return client;
        }

        private void SetHeaders(HttpClient client)
        {
            client.DefaultRequestHeaders.Clear(); 
            client.DefaultRequestHeaders.Add("X-API-KEY", ApiKey);
            client.DefaultRequestHeaders.Add("X-SECRET-KEY", SecretKey);
            Debug.WriteLine($"SetHeaders - X-API-KEY: {ApiKey}, X-SECRET-KEY: {SecretKey}");
        }

        public async Task<string> GetResponse(string url, string serverName, string databaseName, string username, string password, string year)
        {
            using (var client = CreateHttpClient())
            {
              
                client.DefaultRequestHeaders.Add("serverName", serverName);
                client.DefaultRequestHeaders.Add("databaseName", databaseName);
                client.DefaultRequestHeaders.Add("username", username);
                client.DefaultRequestHeaders.Add("password", password);
                client.DefaultRequestHeaders.Add("year", year);

                Debug.WriteLine($"Requesting URL: {url}");
                Debug.WriteLine($"Headers: X-Server-Name: {serverName}, X-Database-Name: {databaseName}, X-Username: {username}, X-Password: {password}, X-Year: {year}");

                try
                {
                    HttpResponseMessage response = await client.GetAsync(url).ConfigureAwait(false);

                    if (response.IsSuccessStatusCode)
                    {
                        return await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                    }
                    else
                    {
                        string responseContent = await response.Content.ReadAsStringAsync();
                        Debug.WriteLine($"Server response: {responseContent}");
                        throw new Exception($"Error fetching data from {url}: {response.StatusCode} - {response.ReasonPhrase}");
                    }
                }
                catch (Exception ex)
                {
                    Debug.WriteLine($"Request failed for {url}: {ex.Message}");
                    throw new Exception($"Request failed for {url}: {ex.Message}", ex);
                }
            }
        }

        public async Task<string> PostResponse(string url, string jsonContent)
        {
            using (var client = CreateHttpClient())
            {
                Debug.WriteLine($"PostResponse - URL: {url}");
                Debug.WriteLine($"X-API-KEY: {ApiKey}, X-SECRET-KEY: {SecretKey}");

                foreach (var header in client.DefaultRequestHeaders)
                {
                    Debug.WriteLine($"{header.Key}: {string.Join(", ", header.Value)}");
                }

                var content = new StringContent(jsonContent, System.Text.Encoding.UTF8, "application/json");

                try
                {
                    HttpResponseMessage response = await client.PostAsync(url, content).ConfigureAwait(false);

                    if (response.IsSuccessStatusCode)
                    {
                        return await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                    }
                    else
                    {
                        string responseContent = await response.Content.ReadAsStringAsync();
                        Debug.WriteLine($"Server response: {responseContent}");
                        throw new Exception($"Error posting data to {url}: {response.StatusCode} - {response.ReasonPhrase}");
                    }
                }
                catch (Exception ex)
                {
                    Debug.WriteLine($"Request failed for {url}: {ex.Message}");
                    throw new Exception($"Request failed for {url}: {ex.Message}", ex);
                }
            }
        }
    }
}
