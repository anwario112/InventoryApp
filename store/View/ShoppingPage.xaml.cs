using store.Models;
using store.ViewModels;
using System.Diagnostics;

namespace store.View
{
    public partial class ShoppingPage : ContentPage
    {
        private readonly ShoppingListFetch _fetchList;
        public string Username { get; set; }

        public ShoppingPage(string username)
        {
            InitializeComponent();
            Username = username;
            Debug.WriteLine($"the Username is:{username}");
            _fetchList = new ShoppingListFetch();
            BindingContext = _fetchList;
            LoadItems();
            UpdateShoppingCartCount();

        }

        private async void LoadItems()
        {
            await _fetchList.FetchAllItems();
        }

        private void Barcode_TextChanged(object sender, TextChangedEventArgs e)
        {
            _fetchList.SearchTerm = e.NewTextValue;

        }





        private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {

        }

        private async void ShoppingCardTap(object sender, TappedEventArgs e)
        {
            var border = sender as Border;

            var item = border?.BindingContext as ItemFile;

            if (item != null)
            {
                int quantity = _fetchList.GetQuantityForItem(item);
                decimal price;

                if (!decimal.TryParse(item.Price.ToString(), out price))
                {

                    Debug.WriteLine("Invalid price format.");
                    return;

                }

                decimal totalPrice = quantity * price;

                string quantityString = quantity.ToString();
                string totalPriceString = totalPrice.ToString("F2");

                Debug.WriteLine($"the data to the shoppingCard:{Username},{item.ItemNum},{quantityString},{totalPriceString}");

                await _fetchList.AddToShoppingCart(Username, item.ItemNum, quantityString, totalPriceString);

            }
        }

        private void OnShoppingCartTapped(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.ShoppingCardPage(Username));
        }
        private async void UpdateShoppingCartCount()
        {
            await _fetchList.UpdateShoppingCartCount(Username);
        }

       
    }
}