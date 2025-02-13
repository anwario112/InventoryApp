
using CommunityToolkit.Maui.Views;
using store.Data;
using store.ViewModels;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;

namespace store.View;

public partial class ChangePopup : Popup
{
    private ChangeToItemNum _viewModel;
    public event EventHandler ItemUpdated;
    private ItemCard _itemCard;

    public string Barcode { get; set; }
    public int ID { get; set; }
    public ChangePopup(ItemCard itemCard)
    {
        InitializeComponent();

        _viewModel = new ChangeToItemNum();
        BindingContext = new ChangeToItemNum();
        BindingContext = _viewModel;

        _itemCard = itemCard;
        _viewModel.FetchItemNumByBarcode(itemCard.ItemBarcode);
    }
    private async void ItemNumField_TextChanged(object sender, TextChangedEventArgs e)
    {



    }

    private async void Button_Clicked(object sender, EventArgs e)
    {

        string itemNum = _viewModel.ItemNum;
        string selectedUnit = _viewModel.SelectedUnit;


        if (string.IsNullOrEmpty(itemNum) || string.IsNullOrEmpty(selectedUnit))
        {
            await Application.Current.MainPage.DisplayAlert("Error", "Item number and unit must be provided.", "OK");
            return;

        }

        await _viewModel.UpdateItemCardAsync(itemNum, selectedUnit, _itemCard.ID);

        _itemCard.ItemBarcode = itemNum;
        _itemCard.Unit = selectedUnit;

        MessagingCenter.Send(this, "ItemUpdated", _itemCard);

        Close();

    }
}