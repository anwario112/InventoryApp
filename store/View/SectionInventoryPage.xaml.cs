
using store.ViewModels;
using System.Diagnostics;
using CommunityToolkit.Maui.Views;
using store.Models;
namespace store.View;

public partial class SectionInventoryPage : ContentPage
{

	public int RakID { get; set; }
    private readonly InventoryNoDataViewModel _viewModel;
	public SectionInventoryPage(int rakID)
	{
		InitializeComponent();
        RakID=rakID;
        _viewModel=new InventoryNoDataViewModel();
        BindingContext = _viewModel;

        Debug.WriteLine($"the rakID recieved :{RakID}");

    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await _viewModel.LoadInventoryItems(InventoryNoDataViewModel.InventoryType.Section,RakID);
    }

    private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {
        if (e.Parameter is SectionInventory item)
        {
            Debug.WriteLine($"the sectionID:{item.ID},sectionName:{item.SectionName}");
            await Navigation.PushAsync(new View.InventoryPage(item.ID));

        }
    }

    private async void TapGestureRecognizer_Tapped_1(object sender, TappedEventArgs e)
    {
        if (e.Parameter is SectionInventory item)
        {
            Debug.WriteLine($"the id:{item.ID}");
            var deletedSection = await _viewModel.DeleteSection(item.ID);
            if (deletedSection)
            {
                await _viewModel.LoadInventoryItems(InventoryNoDataViewModel.InventoryType.Section, RakID);
            }
        }
    }

    private async void TapGestureRecognizer_Tapped_2(object sender, TappedEventArgs e)
    {
        var popup = new RakFolder(RakFolder.InputType.SectionName,RakID);
        var result = await this.ShowPopupAsync(popup);

        if (result is bool success && success)
        {
            await _viewModel.LoadInventoryItems(InventoryNoDataViewModel.InventoryType.Section, RakID);
        }
    }
}