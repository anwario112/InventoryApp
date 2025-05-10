using CommunityToolkit.Maui.Views;
using store.Models;
using store.ViewModels;
using System.Collections.ObjectModel;
using System.Diagnostics;

namespace store.View;

public partial class ExportPage : ContentPage
{

    private readonly ExportData exportData;
    public ExportPage()
	{
		InitializeComponent();
        exportData = new ExportData();
        BindingContext = exportData;
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

    private void OnImageTapped(object sender, EventArgs e)
    {

        if (e is TappedEventArgs tappedEventArgs &&
             tappedEventArgs.Parameter is KeyValuePair<string, List<string>> item)
        {
            Debug.WriteLine($"the ID of the rak:{item.Key}");
            exportData.DeleteRak(item.Key);
        }
    }




}