using CommunityToolkit.Maui.Views;

namespace store.View;

public partial class CashVan : ContentPage
{

    public string username { get; set; }
	public CashVan(string Username)
	{
		InitializeComponent();
        username=Username;
	}

    private void CustomerTap(object sender, EventArgs e)
    {
		Navigation.PushAsync(new View.CustomerPage());
    }

    private void ItemsTap(object sender, EventArgs e)
    {
        Navigation.PushAsync(new View.ShoppingPage("shopping page",username));
    }
   
    private void CurrencyTap(object sender, TappedEventArgs e)
    {
        var popup = new View.CurrencyPopup();
        this.ShowPopup(popup);
    }
    private  void InvoiceTap(object sender, TappedEventArgs e)
    {
        Navigation.PushAsync(new View.InvoicePage(username)); 
    }
}