using store.ViewModels;

namespace store.View;

public partial class InvoicePage : ContentPage
{
    
	public string Username { get; set; }
	public InvoicePage(string username)
	{
		InitializeComponent();
		Username = username;
        BindingContext = new InvoiceViewModel(username);
    }


    
    private void OnUnsentTapped(object sender, TappedEventArgs e)
    {
    }

   
}