using store.Data;
using store.Models;
using System.Diagnostics;

namespace store.View;

public partial class SectionCard : ContentView
{

    public event EventHandler<int> SectionDeleted;
    private readonly SectionEntity _sectionEntity;
    public int SectionID { get; private set; }
    public SectionCard()
	{
		InitializeComponent();
        _sectionEntity = new SectionEntity();
	}
    public void SetData(Section section)
    {
        SectionName.Text = section.SectionName;
        Date.Text = section.DateCreated.ToString("g");
        SectionID = section.ID;
       
    }

    private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)

    {

        bool confirm = await Application.Current.MainPage.DisplayAlert("Confirm Deletion", "Are you sure you want to delete this Rak?", "Yes", "No");
        if (confirm)
        {
            try
            {
                await DeleteSectionAsync(SectionID);
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }

        }

    }


    private async Task DeleteSectionAsync(int sectionId)

    {

        await _sectionEntity.DeletSection(SectionID);

        SectionDeleted?.Invoke(this, sectionId);

        Debug.WriteLine("The Section is deleted");

    }

    private async void TapGestureRecognizer_Tapped_1(object sender, TappedEventArgs e)
    {
        Debug.WriteLine($"SectionID recieved from section:{SectionID}");
        await Navigation.PushAsync(new View.TransferData(SectionID));
    }
}