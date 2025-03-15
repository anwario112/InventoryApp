using CommunityToolkit.Maui.Views;

namespace store.View;

public partial class CashVan : ContentPage
{
	public CashVan()
	{
		InitializeComponent();
	}

    private void CustomerTap(object sender, EventArgs e)
    {
		Navigation.PushAsync(new View.CustomerPage());
    }

    private void CurrencyTap(object sender, TappedEventArgs e)
    {
        var popup = new View.CurrencyPopup();
        this.ShowPopup(popup);
    }
}