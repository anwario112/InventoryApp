using store.Models;
using store.ViewModels;
using System.Diagnostics;


namespace store.View
{
    public partial class ShoppingPage : ContentPage
    {
        private readonly ShoppingListFetch _fetchList;
        public string Username { get; set; }
        public int InvoiceNum { get; set; }
        private readonly string _mode;

        public ShoppingPage(string mode, string username = null, int invoiceNum = 0)
        {
            InitializeComponent();
            Username = username;
            _mode = mode;
           
            Debug.WriteLine($"the Username is:{username}");
            _fetchList = new ShoppingListFetch();
            BindingContext = _fetchList;
            InvoiceNum = invoiceNum;
            Debug.WriteLine($"the InvoiceNum is: {InvoiceNum}");
            SetupUI();


        }


        private void SetupUI()
        {

            if (_mode == "Invoice")
            {

                Title = "Add Items to Invoice";
                InvoiceModeLayout.IsVisible = true;
                ShoppingCartModeLayout.IsVisible = false;
               
            }
            else
            {
                Title = "Shopping Page";
                InvoiceModeLayout.IsVisible = false;
                ShoppingCartModeLayout.IsVisible = true;
               
                UpdateShoppingCartCount();

            }

        }
        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await _fetchList.FetchAllItems();
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
                Debug.WriteLine($"the itemID:{item.ItemID}");
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
            Navigation.PushAsync(new View.ShoppingCardPage(Username, "shopping"));
        }
        private async void UpdateShoppingCartCount()
        {
            await _fetchList.UpdateShoppingCartCount(Username);
        }

        private async void AddToInvoice(object sender, TappedEventArgs e)
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

               
                string itemNumString = item.ItemNum.ToString();

                Debug.WriteLine($"the data to the shoppingCard:{InvoiceNum},{itemNumString},{quantityString},{totalPriceString}");
                await _fetchList.AddItemToInvoice(InvoiceNum, itemNumString, quantityString, totalPriceString);
            }
        }

        private void OnImageFailed(object sender, EventArgs e)
        {
            var image = sender as Image;
            if (image != null)
            {
                image.Source = "gold.png"; 
            }
        }
    }
}