using CommunityToolkit.Maui.Views;
using Microsoft.Maui.Controls;
using store.DTO;
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

        public CustomerPopup(string mode, CustomerDetails customerDetails = null)
        {
            InitializeComponent();

            _viewModel = new CustomerModelView();
            BindingContext = _viewModel;

            _mode = mode;
           

            if (mode == "editCust" && customerDetails != null)
            {
                _viewModel.CustomerID = customerDetails.CustomerID;
                _viewModel.FirstName = customerDetails.FirstName;
                _viewModel.LastName = customerDetails.LastName;
                _viewModel.Phone = customerDetails.Phone;
                _viewModel.CompanyName = customerDetails.Company;
                _viewModel.Address = customerDetails.Address;
                _viewModel.Country = customerDetails.CountryName;
                _viewModel.City = customerDetails.CityName;
                _viewModel.VatNum = customerDetails.TvaNum;
                _viewModel.Email = customerDetails.Email;




                SaveButton.Text = "Update";
            }
            else
            {
                _viewModel.FirstName = string.Empty;
                _viewModel.LastName = string.Empty;
                _viewModel.Phone = string.Empty;
                _viewModel.CompanyName = string.Empty;
                _viewModel.Address = string.Empty;
                _viewModel.Country = string.Empty;
                _viewModel.City = string.Empty;
                _viewModel.VatNum = string.Empty;
                _viewModel.Email = string.Empty;

                SaveButton.Text = "Save";
            }

        }

        public void OnSaveButtonClicked(object sender, EventArgs e)
        {
            
        }

   
      

        private async void SaveButton_Clicked(object sender, EventArgs e)
        {
            bool isSuccess;

            if (_mode == "editCust")
            {
                
                isSuccess = await _viewModel.UpdateData();

            }
            else
            {
                
                isSuccess = await _viewModel.SaveData();
            }

            if (isSuccess)
            {
                LabelSave.Text = _mode == "editCust" ? "Customer Updated Successfully" : "Customer Saved Successfully";
                LabelSave.TextColor = Colors.Green;
                LabelSave.IsVisible = true;

                await Task.Delay(1000);
                LabelSave.IsVisible = false;

                Close();
            }
            else
            {
                LabelSave.Text = _mode == "editCust" ? "Failed to Update Customer" : "Failed to Save Customer";
                LabelSave.TextColor = Colors.Red;
                LabelSave.IsVisible = true;

                await Task.Delay(1000);
                LabelSave.IsVisible = false;
            }
        }
    }
}