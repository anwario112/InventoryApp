using CommunityToolkit.Maui.Views;
using store.Models;
using store.ViewModels;
using System.Collections.ObjectModel;

namespace store.View;

public partial class ExportPage : ContentPage
{


    public ExportPage()
	{
		InitializeComponent();
        BindingContext = new ExportData();
    }

    private void exportTxt(object sender, TappedEventArgs e)
    {

    }


    private void OnInventoryTabTapped(object sender, TappedEventArgs e)
    {
     
        SelectionIndicator.TranslateTo(0, 0, 250, Easing.SinInOut);

    
        InventoryCollectionView.IsVisible = true;
        InventoryNoDataCollectionView.IsVisible = false;

     
        InventoryTab.FontAttributes = FontAttributes.Bold;
        InventoryNoDataTab.FontAttributes = FontAttributes.None;
    }

    private void OnInventoryNoDataTabTapped(object sender, TappedEventArgs e)
    {
      
        SelectionIndicator.TranslateTo(this.Width / 2, 0, 250, Easing.SinInOut);

        InventoryCollectionView.IsVisible = false;
        InventoryNoDataCollectionView.IsVisible = true;

     
        InventoryTab.FontAttributes = FontAttributes.None;
        InventoryNoDataTab.FontAttributes = FontAttributes.Bold;
    }




}