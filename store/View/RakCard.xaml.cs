using store.Data;
using store.Models;
using System.Diagnostics;

namespace store.View;

public partial class RakCard : ContentView
{
    public int RakID{ get; private set; }
    private readonly RakEntity _rakEntity;

    public event EventHandler<int> RakDeleted;

    public RakCard()
	{
		InitializeComponent();
        _rakEntity = new RakEntity();
    }

   
    public void SetData(Rak rak)
    {  

        RakName.Text = rak.RakName; 
        Date.Text = rak.DateCreated.ToString("g");
        RakID = rak.ID;      
    }



    private async void TapGestureRecognizer_Tapped(object sender, EventArgs e)
    {

       

        bool confirm = await Application.Current.MainPage.DisplayAlert("Confirm Deletion", "Are you sure you want to delete this Rak?", "Yes", "No");
        if (confirm)
        {
            try
            {

                await _rakEntity.DeleteRak(RakID);

                RakDeleted?.Invoke(this, RakID); 

                Debug.WriteLine("The Rak is deleted");

            }

            catch (Exception ex)

            {

                await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");

            }

        }

    }

    private async void TapGestureRecognizer_Tapped_1(object sender, TappedEventArgs e)
    {
        Debug.WriteLine($"the RakID:{RakID}");
        await Navigation.PushAsync(new View.SectionPage(RakID));
    }
}