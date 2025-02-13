using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Service
{
    public class AuthenticationService
    {
        private bool isAuthenticated;
        private string username;
        private readonly UserEntity userEntity;
        private string userLevel;
        public bool IsAuthenticated => isAuthenticated;
        public string Username => username;
        public string UserLevel => userLevel;

        public AuthenticationService()
        {
           userEntity = new UserEntity(); 
        }


        public async Task<bool> Login(string username, string password)
        {


            if (username.Equals("admin", StringComparison.OrdinalIgnoreCase) && password == "admin12345")
            {
                isAuthenticated = true;
                this.username = username;
                this.userLevel = "admin";
                return true; 
            }
            else
            {     
                List<User> users = await userEntity.GetAllData();

                foreach (var user in users)
                {
                    if (user.UserName.Equals(username, StringComparison.OrdinalIgnoreCase) && user.Password == password)
                    {
                        isAuthenticated = true;

                        this.username = username;
                        this.userLevel = user.Level;
                        Debug.WriteLine($"the user:{username},userlevel:{user.Level}");

                        return true; 

                    }

                }

            }
         

            return false; 

        }


        public void Logout()
        {
            isAuthenticated = false;
            username = null;
            userLevel = null;
        }
    }
}
