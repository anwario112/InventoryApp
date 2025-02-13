using CommunityToolkit.Maui.Views;
using store.ViewModels;
using System.Diagnostics;

namespace store.View;

public partial class PackingPopup : Popup
{
    private PackingPopupFunction _viewModel;
    public string Barcode { get; set; }
    public int ID { get; set; }
	public PackingPopup(string barcode,int id)
	{
		InitializeComponent();
		Barcode = barcode;
        ID = id;
        Debug.WriteLine($"barcode passed:{barcode}");
        _viewModel = new PackingPopupFunction(ID, this);
        BindingContext = _viewModel;
        _viewModel.FetchBarcodesByItemNum(barcode);
       

    }


}