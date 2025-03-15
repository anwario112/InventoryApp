using CommunityToolkit.Maui.Views;
using Microsoft.Maui.Controls;
using store.Models;
using store.ViewModels;
using System.Xml.Linq;

namespace store.View
{
    public partial class CustomerPopup : Popup
    {

        private Customer _customer;
        private string _mode;
        private CustomerModelView _viewModel;

        public CustomerPopup(string mode, Customer customer = null)
        {
            InitializeComponent();

            _viewModel = new CustomerModelView();
            BindingContext = _viewModel;

            _mode = mode;
            _customer = customer;

            if (mode == "editCust")
            {
                CustomerFirstNameEntry.Text = _customer.FirstName;
                CustomerLastNameEntry.Text = _customer.LastName;               
                CustomerPhoneEntry.Text = _customer.Phone;
                SaveButton.Text = "Update";
            }
            else
            {
                CustomerFirstNameEntry.Text = string.Empty;
                CustomerLastNameEntry.Text = string.Empty;
                CustomerPhoneEntry.Text = string.Empty;
                SaveButton.Text = "Save";
            }

        }

        public void OnSaveButtonClicked(object sender, EventArgs e)
        {
            
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
           
            currencyoption.IsVisible = !currencyoption.IsVisible;
        }

        private void CurrencyPick(object sender, SelectionChangedEventArgs e)
        {
            if (e.CurrentSelection.FirstOrDefault() is string selectedCurrency)
            {
                _viewModel.SelectedCurrency = selectedCurrency;
                currencyoption.IsVisible = false;
            }
        }

        private async void SaveButton_Clicked(object sender, EventArgs e)
        {
            var isSaved=await _viewModel.SaveData();

            if (isSaved)
            {
                LabelSave.Text = "Customer Is Saved";
                LabelSave.TextColor = Colors.Green;
                LabelSave.IsVisible = true;

                await Task.Delay(1000);
                LabelSave.IsVisible = false;

                Close();
            }
            else
            {
                LabelSave.Text = "Customer Is not saved";
                LabelSave.TextColor = Colors.Red;
                LabelSave.IsVisible = true;

                await Task.Delay(1000);
                LabelSave.IsVisible = false;

            }
        }
    }
}