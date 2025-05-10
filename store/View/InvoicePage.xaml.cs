using store.Data;
using store.ViewModels;

namespace store.View;

public partial class InvoicePage : ContentPage
{
    
	public string Username { get; set; }
    private InvoiceViewModel _viewModel;
 
    public InvoicePage(string username)
	{
        InitializeComponent();
      
        Username = username;
        _viewModel = new InvoiceViewModel(username);  
        BindingContext = _viewModel;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

      
        if (_viewModel.UnsentBackgroundColor == Colors.White)
        {
            _viewModel.OnUnsentTapped(); 
        }
        else if (_viewModel.SentBackgroundColor == Colors.White)
        {
            _viewModel.OnSentTapped(); 
        }
    }

    private void OnUnsentTapped(object sender, TappedEventArgs e)
    {
    }

    private void InvoiceTap(object sender, TappedEventArgs e)
    {
        Navigation.PushAsync(new View.ShoppingCardPage(Username));
    }
}