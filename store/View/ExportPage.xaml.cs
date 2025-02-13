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



    
}