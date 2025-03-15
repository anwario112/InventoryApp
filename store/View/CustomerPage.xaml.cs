
using CommunityToolkit.Maui.Views;
using store.Models;
using store.ViewModels;
using System.Diagnostics;

namespace store.View;

public partial class CustomerPage : ContentPage
{
    private CustomerModelView viewModel;
    public CustomerPage()
    {
		InitializeComponent();
        viewModel = new CustomerModelView();
        BindingContext = viewModel;
    }

    private async void AddCustomer(object sender, EventArgs e)
    {
        var popup = new CustomerPopup("addCust");
        var result = await this.ShowPopupAsync(popup);

       
        if (result is bool success && success)
        {
            await viewModel.RefreshCustomers();
        }
    }
    private void ImageButton_Clicked(object sender, EventArgs e)
    {

    }

    private void ImageButton_Clicked_1(object sender, EventArgs e)
    {

    }

    private void Button_Clicked(object sender, EventArgs e)
    {

    }

    private void ImageButton_Clicked_2(object sender, EventArgs e)
    {

    }

    private void Entry_TextChanged(object sender, TextChangedEventArgs e)
    {

    }

    private void CollectionView_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
        Debug.WriteLine("SelectionChanged event fired");

        var selectedCustomer = e.CurrentSelection.FirstOrDefault() as Customer;

        if (selectedCustomer != null)
        {
            Debug.WriteLine($"Selected Customer ID: {selectedCustomer.ID}");
        }
    }

    private void Customer_Tapped(object sender, EventArgs e)
    {
        if (sender is Element element && element.BindingContext is Customer customer)
        {
            Debug.WriteLine($"Tapped Customer ID: {customer.ID}");
           

            
        }
    }
}