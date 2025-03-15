using CommunityToolkit.Maui.Views;
using store.Data;
using store.Models;

namespace store.View;

public partial class CurrencyPopup : Popup
{

	private readonly CurrencyEntity currencyEntity;
	public CurrencyPopup()
	{
		InitializeComponent();

		currencyEntity=new CurrencyEntity();
	}

    private async void SaveButton_Clicked(object sender, EventArgs e)
    {
		var SetCurrency = new Currency
		{
			CurrencyCode= CuurencyCode.Text
        };

		
		LabelText.Text = "Saved Currency";
        LabelText.TextColor = Colors.Green;
        LabelText.IsVisible = true;

        await Task.Delay(1000);
        LabelText.IsVisible = false;

        await currencyEntity.AddData(SetCurrency);
		Close();

    }
}