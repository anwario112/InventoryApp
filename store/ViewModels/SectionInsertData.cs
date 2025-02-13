using Microsoft.EntityFrameworkCore;
using store.Data;
using store.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace store.ViewModels
{
    public class SectionInsertData : INotifyPropertyChanged
    {
        private readonly SectionEntity _sectionEntity;
        private readonly RakEntity _rakEntity;
      
        private readonly DBContext Context;

        private int _rakID;

        private string _sectionName;
        public string SectionName
        {
            get => _sectionName;
            set
            {
                if (_sectionName != value)
                {
                    _sectionName = value;
                    OnPropertyChanged(nameof(SectionName));
                }
            }
        }

        public ICommand SaveCommand { get; }

        public Action<Section>? SectionCreated;


        public SectionInsertData()
        {           
            _sectionEntity = new SectionEntity();
            _rakEntity = new RakEntity();
            SaveCommand = new Command(async () => await SaveSectionData());
        }


        public SectionInsertData(SectionEntity sectionEntity,int rakID)
        {
            _sectionEntity = sectionEntity;
            _rakEntity = new RakEntity();
            _rakID = rakID;
            SaveCommand = new Command(async () => await SaveSectionData());
        }

        public async Task<bool> SaveSectionData()
        {
            try
            {
                if (string.IsNullOrWhiteSpace(SectionName))
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "SectionName cannot be empty", "OK");
                    return false;
                }

                Debug.WriteLine($"SectionName: {SectionName}, RakID: {_rakID}");

                if (_rakID <= 0)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Invalid RakID", "OK");
                    return false;
                }

                var rakExists = await _rakEntity.RakIDExist(_rakID);
                if (!rakExists)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "RakID does not exist in the database", "OK");
                    return false;
                }

                bool exist = await _sectionEntity.SectionNameExist(SectionName);
                if (exist)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "SectionName already exists", "OK");
                    return false;
                }

                var section = new Section
                {
                    SectionName = SectionName,
                    RakID = _rakID
                };

                Debug.WriteLine($"Saving Section: {SectionName}, RakID: {_rakID}");

                await _sectionEntity.AddData(section);
                var createdSection = await _sectionEntity.GetSectionById(section.ID);

                if (createdSection != null)
                {
                    SectionCreated?.Invoke(createdSection);
                }


                return true;
            }
            catch (DbUpdateException ex)
            {
                Debug.WriteLine($"DbUpdateException: {ex.InnerException?.Message}");
                await Application.Current.MainPage.DisplayAlert("Error", "An error occurred while saving data.", "OK");
                return false;
            }
        }


        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
