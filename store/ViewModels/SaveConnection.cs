using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using System.ComponentModel;

namespace store.ViewModels
{
    public class SaveConnection : INotifyPropertyChanged
    {
        private readonly ConnectionEntity _connectionEntity;

        private string _serverName;
        private string _databaseName;
        private string _username;
        private string _year;
        private string _password;
        private string _successMessage;
        private bool _isSuccessMessageVisible;

        public string ServerName
        {
            get => _serverName;
            set
            {
                _serverName = value;
                OnPropertyChanged(nameof(ServerName));
            }
        }

        public string DatabaseName
        {
            get => _databaseName;
            set
            {
                _databaseName = value;
                OnPropertyChanged(nameof(DatabaseName));
            }
        }

        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                OnPropertyChanged(nameof(Username));
            }
        }

        public string Year
        {
            get => _year;
            set
            {
                _year = value;
                OnPropertyChanged(nameof(Year));
            }
        }

        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }

        public string SuccessMessage
        {
            get => _successMessage;
            set
            {
                _successMessage = value;
                OnPropertyChanged(nameof(SuccessMessage));
            }
        }


        public bool IsSuccessMessageVisible
        {
            get => _isSuccessMessageVisible;
            set
            {
                _isSuccessMessageVisible = value;
                OnPropertyChanged(nameof(IsSuccessMessageVisible));
            }

        }

        public ICommand SaveCommand { get; }

        public SaveConnection()
        {
            _connectionEntity = new ConnectionEntity();
            SaveCommand = new Command(async () => await SaveConnect());
            LoadConnection(); 
        }

        private async void LoadConnection()
        {
          
            var connections = await _connectionEntity.GetConnection(null, null, null, null, null);
            if (connections.Any())
            {
             
                var connection = connections.First();
                ServerName = connection.ServerName;
                DatabaseName = connection.DatabaseName;
                Username = connection.Username;
                Year = connection.Year;
                Password = connection.Password;
            }
        }

        public async Task SaveConnect()
        {
            if (!string.IsNullOrEmpty(ServerName) &&
                !string.IsNullOrEmpty(DatabaseName) &&
                !string.IsNullOrEmpty(Username) &&
                !string.IsNullOrEmpty(Password) &&
                !string.IsNullOrEmpty(Year))
            {
                Debug.WriteLine($"Checking if connection exists {ServerName},{DatabaseName},{Username},{Year},{Password}");
                
                var connectionExists = await _connectionEntity.GetConnection(null, null, null, null, null);

                if (connectionExists.Any())
                {
                    Debug.WriteLine($"CONNECTION found, Updating");
                   
                    var connectionExist = connectionExists.First();
                    connectionExist.ServerName = ServerName;
                    connectionExist.DatabaseName = DatabaseName;
                    connectionExist.Username = Username;
                    connectionExist.Password = Password;
                    connectionExist.Year = Year;

                    // Update the connection in the database
                    await _connectionEntity.UpdateData(connectionExist);
                    Debug.WriteLine($"Data is updated");
                    SuccessMessage = "Data updated successfully!";
                  
                  
                }
                else
                {
                    Debug.WriteLine($"Creating new Connection");
                 
                    var connection = new Connection
                    {
                        ServerName = ServerName,
                        DatabaseName = DatabaseName,
                        Username = Username,
                        Year = Year,
                        Password = Password
                    };

                    await _connectionEntity.AddData(connection);
                    Debug.WriteLine($"New connection saved");
                    SuccessMessage = "Saved";
                  
                }
                IsSuccessMessageVisible = true;

                await Task.Delay(3000);
                IsSuccessMessageVisible = false;
      
            }
            else
            {
                Debug.WriteLine("Please fill in all fields.");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}