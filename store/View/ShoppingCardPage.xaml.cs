using store.Models;
using store.ViewModels;
using System.Diagnostics;
 using Microsoft.Maui.Controls; 

namespace store.View;

public partial class ShoppingCardPage : ContentPage
{

    private readonly shoppingCards _fetchCardList;
   
    public string Username { get;set; }

    public ShoppingCardPage(string username)
	{
		InitializeComponent();
		_fetchCardList = new shoppingCards();
        BindingContext = _fetchCardList;
        Username = username;
        LoadShoppingCartItems(Username);
    }

    private async void LoadShoppingCartItems(string username)
    {
        await _fetchCardList.LoadShoppingCartItems(username);
    }

    private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {
        var item = e.Parameter as dynamic;

        if (item != null)
        {
            
            Debug.WriteLine($"Item ID: {item.ID}"); 
            bool isDeleted = await _fetchCardList.DeleteShoppingCartItem(item.ID, Username);

            if (isDeleted)
            {
                await _fetchCardList.LoadShoppingCartItems(Username);
            }
            else
            {
                Debug.WriteLine("Failed to delete the item.");
            }
        }
    }

    private async void SendShoppingCards(object sender, TappedEventArgs e)
    {
       var isSaved= await _fetchCardList.SaveInvoice(Username);

        if (isSaved)
        {
            invoiceSavedLabel.Text = "Invoice is Saved!";
            invoiceSavedLabel.TextColor = Colors.Green;

            invoiceSavedLabel.IsVisible = true;

            await Task.Delay(3000);
            invoiceSavedLabel.IsVisible= false;
            

        }
        else
        {

            invoiceSavedLabel.Text = "Failed To save invoice!";
            invoiceSavedLabel.TextColor = Colors.Red;
            invoiceSavedLabel.IsVisible = true;

            await Task.Delay(3000);
            invoiceSavedLabel.IsVisible = false;

        }
    }


}