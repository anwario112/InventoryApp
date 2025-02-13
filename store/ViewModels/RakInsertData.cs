using store.Data;
using store.Models;
using System.ComponentModel;
using System.Windows.Input;
using System.Threading.Tasks;
using System.Diagnostics;

namespace store.ViewModels
{
    public class RakInsertData : INotifyPropertyChanged
    {
        private readonly RakEntity _rakEntity;

        private string _rakName;
        public string RakName
        {
            get => _rakName;
            set
            {
                if (_rakName != value)
                {
                    _rakName = value;
                    OnPropertyChanged(nameof(RakName));
                }
            }
        }

        public ICommand SaveCommand { get; }

        public Action<Rak>? RakCreated;

        public RakInsertData()
        {
            _rakEntity = new RakEntity();
            SaveCommand = new Command(async () => await SaveRakData());
        }

        public RakInsertData(RakEntity rakEntity)
        {
            _rakEntity = rakEntity;
            SaveCommand = new Command(async () => await SaveRakData());
        }

        public async Task<bool> SaveRakData()
        {
            if (string.IsNullOrWhiteSpace(RakName))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "RakName cannot be empty", "OK");
                return false;
            }

            bool exists = await _rakEntity.RakNameExists(RakName);
            Debug.WriteLine($"Checking existence for '{RakName}': {exists}");

            if (exists)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "RakName already exists.", "OK");
                return false;
            }
            else
            {
                var rak = new Rak
                {
                    RakName = RakName
                };

                await _rakEntity.AddData(rak);
                Debug.WriteLine($"Added Rak: {RakName}");
                var createdRak = await _rakEntity.GetRakById(rak.ID);

                if (createdRak != null)
                {
                    RakCreated?.Invoke(createdRak);
                }

                return true;
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
