using store.Models;
using store.ViewModels;
using System.Diagnostics;
using Microsoft.Maui.Controls;
using store.DTO;
using store.Data;

namespace store.View
{
    public partial class ShoppingCardPage : ContentPage
    {
        private readonly shoppingCards _fetchCardList;
        private readonly InvoiceDetailsViewModel _invoiceDetailsViewModel;
        private readonly string _mode;

        public string Username { get; set; }
        public int InvoiceNum { get; set; }

        public ShoppingCardPage(string username, string mode = "shopping", int invoiceNum = 0)
        {
            InitializeComponent();

            _fetchCardList = new shoppingCards();
            BindingContext = _fetchCardList;
            Username = username;
            _mode = mode;
            InvoiceNum = invoiceNum;





            if (_mode == "shopping")
            {
                LoadShoppingCartItems(Username);
                ShoppingCartUI.IsVisible = true;
                InvoiceUI.IsVisible = false;
            }
            else if (_mode == "invoice")
            {
                _invoiceDetailsViewModel = new InvoiceDetailsViewModel(InvoiceNum);

                BindingContext = _invoiceDetailsViewModel;           
                ShoppingCartUI.IsVisible = false;
                InvoiceUI.IsVisible = true;
            }

            Debug.WriteLine($"ShoppingCardPage initialized with Username: {Username}, Mode: {_mode}, InvoiceNum: {InvoiceNum}");
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            if (_mode == "invoice")
            {

                LoadInvoiceDetails(InvoiceNum);

            }

        }

        private void CustomerSearchResults_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedCustomer = e.CurrentSelection.FirstOrDefault() as Customer;
            if (selectedCustomer != null)
            {
                Debug.WriteLine($"Selected Customer: {selectedCustomer.FirstName} {selectedCustomer.LastName}");

               
                var viewModel = BindingContext as shoppingCards;
                viewModel.SelectedCustomer = selectedCustomer;
            }
        }

        private async void LoadShoppingCartItems(string username)
        {
            await _fetchCardList.LoadShoppingCartItems(username);
        }


        private async void LoadInvoiceDetails(int invoiceNum)
        {

            await _invoiceDetailsViewModel.GetInvoiceDetails(invoiceNum);
            if (_invoiceDetailsViewModel.InvoiceStatus == "sent")
            {
                invoiceStatus.Opacity = 0.5;
                invoiceStatus.GestureRecognizers.Clear();
            }
           

        }
        private void OnCustomerSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = e.NewTextValue?.Trim();

          
        }

        private void OnCustomerSelected(object sender, SelectionChangedEventArgs e)
        {
           
        }
        private void OnClearSelectedCustomer(object sender, TappedEventArgs e)
        {
            
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
            var isSaved = await _fetchCardList.SaveInvoice(Username);

            if (isSaved)
            {
                invoiceSavedLabel.Text = "Invoice is Saved!";
                invoiceSavedLabel.TextColor = Colors.Green;
                invoiceSavedLabel.IsVisible = true;

                await Task.Delay(3000);
                invoiceSavedLabel.IsVisible = false;
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
        private async void OnAddItemTapped(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.ShoppingPage("Invoice", Username, InvoiceNum));
        }

        private async void OnExitTapped(object sender, TappedEventArgs e)
        {

            var image = sender as Image;


            var item = image?.BindingContext as InvoiceDetailDTO;

            if (item != null)
            {

                Debug.WriteLine($"Item ID: {item.ID}");
                bool isDeleted = await _invoiceDetailsViewModel.DeleteInvoiceItem(item.ID, InvoiceNum);
                if (isDeleted)
                {
                    Debug.WriteLine("Item deleted successfully.");
                }
                else
                {
                    await DisplayAlert("Error", "Failed to delete the item.", "OK");
                }

            }
            else
            {
                Debug.WriteLine("Item not found.");
            }
        }
        private async void SendData(object sender, TappedEventArgs e)
        {
            await _invoiceDetailsViewModel.SendData();
        }

        private async void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            var searchBar = sender as SearchBar;
            var viewModel = BindingContext as shoppingCards;

            if (searchBar != null && viewModel != null)
            {
                viewModel.SearchBar = searchBar.Text;
                viewModel.SearchCustomers().Wait(); 

              
                CustomerSearchResults.ItemsSource = viewModel.FilteredCustomers;
            }
        }
    }
}