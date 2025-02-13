using CommunityToolkit.Maui.Views;
using System.Diagnostics;
using store.ViewModels;
using store.Data;
using store.Models;

namespace store.View
{
    public partial class SectionPage : ContentPage
    {
        private readonly SectionEntity _sectionEntity;
        private int _rakID;

        public SectionPage(int rakID)
        {
            InitializeComponent();
            _sectionEntity = new SectionEntity();
            _rakID = rakID;
            LoadSection().ConfigureAwait(false); 
        }

        private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {
            var sectionInsertData = new SectionInsertData(_sectionEntity, _rakID);
            var sectionPopup = new SectionPopup(sectionInsertData);
            sectionInsertData.SectionCreated += ViewModel_SectionCreated;
            this.ShowPopup(sectionPopup);
        }

        private void ViewModel_SectionCreated(Section newSection)
        {
            var sectionCard = new SectionCard();
            sectionCard.SetData(newSection);
            sectionCard.SectionDeleted += SectionCard_SectionDeleted;
            RakStackLayout.Children.Add(sectionCard);
        }

        public async Task LoadSection()
        {
            try
            {
                List<Section> sections = await _sectionEntity.GetSections(_rakID);
                foreach (var section in sections)
                {
                    var sectionCard = new SectionCard();
                    sectionCard.SetData(section);
                    sectionCard.SectionDeleted += SectionCard_SectionDeleted;
                    RakStackLayout.Children.Add(sectionCard);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error loading sections: {ex.Message}");
                await Application.Current.MainPage.DisplayAlert("Error", "Failed to load sections.", "OK");
            }
        }

        private async void SectionCard_SectionDeleted(object sender, int sectionID)
        {
            var sectionCardToRemove = RakStackLayout.Children.OfType<SectionCard>().FirstOrDefault(card => card.SectionID == sectionID);

            if (sectionCardToRemove != null)
            {
                RakStackLayout.Children.Remove(sectionCardToRemove);
            }
        }

        protected override void OnDisappearing()
        {
            base.OnDisappearing();
            
        }
    }
}