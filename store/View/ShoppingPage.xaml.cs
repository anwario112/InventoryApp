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
            try
            {
              
                bool forceRefresh = false;

                await _fetchList.DisplayCategories();
                await _fetchList.FetchAllItems(forceRefresh);
                Debug.WriteLine("fetch end");

              
                if (_mode != "Invoice")
                {
                    await UpdateShoppingCartCount();
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error fetching items: {ex.Message}");
            }
        }

        private void TapGestureRecognizer_Tapped_1(object sender, EventArgs e)
        {
            if (sender is Border border && border.BindingContext is Models.Category category)
            {
                var viewModel = (ViewModels.ShoppingListFetch)BindingContext;

               
                viewModel.SelectCategory = category;

             

                System.Diagnostics.Debug.WriteLine($"Category selected: {category.CategoryName}");
            }
        }

        private async void LoadItems()
        {
          
            await _fetchList.FetchAllItems();
          
        }

        private void Barcode_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                Debug.WriteLine($"searching...");
                _fetchList.SearchTerm = e.NewTextValue;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in Barcode_TextChanged: {ex.Message}");
            }
        }



        private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {

        }

        private bool _isAddingToCart = false;

        private async void ShoppingCardTap(object sender, TappedEventArgs e)
        {
            Debug.WriteLine($"shoopingCard tapped");
            if (_isAddingToCart) return;

            _isAddingToCart = true;

            var border = sender as Border;
            var item = border?.BindingContext as ItemFile;

            if (item == null)
            {
                Debug.WriteLine("Item is null in ShoppingCardTap.");
                _isAddingToCart = false;
                return;
            }

            Debug.WriteLine($"the itemID:{item.ItemID}");
            int quantity = _fetchList.GetQuantityForItem(item);
            decimal price;

            if (!decimal.TryParse(item.Price.ToString(), out price))
            {
                Debug.WriteLine("Invalid price format.");
                _isAddingToCart = false;
                return;
            }

            decimal totalPrice = quantity * price;

            string quantityString = quantity.ToString();
            string totalPriceString = totalPrice.ToString("F2");

            Debug.WriteLine($"the data to the shoppingCard:{Username},{item.ItemNum},{quantityString},{totalPriceString}");

            await _fetchList.AddToShoppingCart(Username, item.ItemNum, quantityString, totalPriceString);

            _isAddingToCart = false;
        }

        private void OnShoppingCartTapped(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.ShoppingCardPage(Username, "shopping"));
        }
        private async Task UpdateShoppingCartCount()
        {
            await _fetchList.UpdateShoppingCartCount(Username);
        }

        private async void AddToInvoice(object sender, TappedEventArgs e)
        {
            Debug.WriteLine("AddToInvoice triggered"); 

            var border = sender as Border;
            if (border == null)
            {
                Debug.WriteLine("Sender is not a Border");
                return;
            }

            var item = border.BindingContext as ItemFile;
            if (item == null)
            {
                Debug.WriteLine("Item is null - BindingContext issue?");
                return;
            }

            Debug.WriteLine($"Adding ItemNum: {item.ItemNum}, InvoiceNum: {InvoiceNum}");

            try
            {
                int quantity = _fetchList.GetQuantityForItem(item);
                decimal price;

                if (!decimal.TryParse(item.Price.ToString(), out price))
                {
                    Debug.WriteLine("Invalid price format");
                    return;
                }

                decimal totalPrice = quantity * price;
                string quantityString = quantity.ToString();
                string totalPriceString = totalPrice.ToString("F2");
                string itemNumString = item.ItemNum.ToString();

                Debug.WriteLine($"Calling AddItemToInvoice with: InvoiceNum={InvoiceNum}, ItemNum={itemNumString}, Qty={quantityString}, Total={totalPriceString}");

               await _fetchList.AddItemToInvoice(InvoiceNum, itemNumString, quantityString, totalPriceString);

               
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in AddToInvoice: {ex.Message}");
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

        private void TapGestureRecognizer_Tapped_1(object sender, TappedEventArgs e)
        {

        }
    }
}