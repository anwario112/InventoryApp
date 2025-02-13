using CommunityToolkit.Maui.Views;

namespace store.View;

public partial class Settings : ContentPage
{
	public Settings()
	{
		InitializeComponent();
	}

    private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {
		this.ShowPopup(new View.ConnectionBox());
    }
    private async void AddUserTap(object sender, TappedEventArgs e)
    {
        this.ShowPopup(new View.AddUserPopup());
    }

    private async void archiveTap(object sender, TappedEventArgs e)
    {
        await Navigation.PushAsync(new View.ItemCardArchive());
    }
}