using CommunityToolkit.Maui.Views;
using store.Models;
using store.ViewModels;
using System.Diagnostics;

namespace store.View;

public partial class RakInventoryPage : ContentPage
{

    private readonly InventoryNoDataViewModel _viewModel;
	public RakInventoryPage()
	{
		InitializeComponent();
        _viewModel=new InventoryNoDataViewModel();
        BindingContext = _viewModel;


    }


    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await _viewModel.LoadInventoryItems(InventoryNoDataViewModel.InventoryType.Rak);
    }

    private async void OnExitTapped(object sender, TappedEventArgs e)
    {

        Debug.WriteLine($"tapped");
        if (e.Parameter is RakInventory item)
        {
            Debug.WriteLine($"Tapped on item with ID: {item.ID}, Name: {item.RakName}");
            var deleted = await _viewModel.DeleteRak(item.ID);
            if (deleted)
            {
                _viewModel.LoadInventoryItems(InventoryNoDataViewModel.InventoryType.Rak);
            }

         
        }
    }
    private async void TapGestureRecognizer_Tapped_1(object sender, TappedEventArgs e)
    {
        var popup = new RakFolder(RakFolder.InputType.RakName);
        var result = await this.ShowPopupAsync(popup);

        if (result is bool success && success)
        {
            await _viewModel.LoadInventoryItems(InventoryNoDataViewModel.InventoryType.Rak); 
        }
    }

    private async void BorderTap(object sender, TappedEventArgs e)
    {
        if (e.Parameter is RakInventory item)
        {
            await Navigation.PushAsync(new View.SectionInventoryPage(item.ID));
        }
    }
}