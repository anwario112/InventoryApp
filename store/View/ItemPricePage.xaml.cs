using store.ViewModels;

namespace store.View;

public partial class ItemPricePage : ContentPage
{
	public ItemPricePage()
	{
		InitializeComponent();
        BindingContext = new ItemPriceViewModel();
      
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();       
        BarcodeEntry.Focus();
    }
}