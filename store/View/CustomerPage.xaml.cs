
using CommunityToolkit.Maui.Views;
using store.Data;
using store.Models;
using store.ViewModels;
using System.Diagnostics;

namespace store.View;

public partial class CustomerPage : ContentPage
{
    private CustomerModelView viewModel;
    private readonly CustomerEntity customerEntity;
    public CustomerPage()
    {
		InitializeComponent();
        viewModel = new CustomerModelView();
        BindingContext = viewModel;

        customerEntity=new CustomerEntity();
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

    private async void Entry_TextChanged(object sender, TextChangedEventArgs e)
    {
        await viewModel.FilterCustomers();
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

    private async void Customer_Tapped(object sender, EventArgs e)
    {
        if (sender is Frame frame && frame.BindingContext is Customer customer)
        {
            Debug.WriteLine($"Tapped Customer ID: {customer.ID}");

            var customerDetails = await customerEntity.GetCustomerByIdAsync(customer.ID);

            if (customerDetails != null)
            {
                await this.ShowPopupAsync(new CustomerPopup("editCust", customerDetails));
            }
            else
            {
                Debug.WriteLine("Error: Customer details not found.");
                await DisplayAlert("Error", "Customer details not found.", "OK");
            }
        }
        else
        {
            Debug.WriteLine("Error: Invalid sender or BindingContext.");
            await DisplayAlert("Error", "Invalid customer data.", "OK");
        }
    }


    private async void OnCameraButtonClicked(object sender, EventArgs e)
    {
        var button = sender as Button;
        if (button == null) return;

        var customer = button.CommandParameter as Customer;
        if (customer == null) return;

        if (!MediaPicker.Default.IsCaptureSupported)
        {
            await DisplayAlert("Error", "Camera is not supported on this device.", "OK");
            return;
        }

        try
        {
            var photo = await MediaPicker.Default.CapturePhotoAsync();
            if (photo == null) return;

            var imagePath = await SaveImageToLocalStorage(photo);
            if (imagePath == null) return;

         
            var viewModel = BindingContext as CustomerModelView;
            if (viewModel != null)
            {
                bool success = await viewModel.UpdateCustomerImage(customer.ID, imagePath);
                if (!success)
                {
                    await DisplayAlert("Error", "Failed to update customer image.", "OK");
                }
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"Failed to capture photo: {ex.Message}", "OK");
        }
    }
    private async Task<string> SaveImageToLocalStorage(FileResult photo)
    {
        if (photo == null) return null;

      
        var fileName = $"{Guid.NewGuid()}.jpg";

       
        var localFilePath = Path.Combine(FileSystem.AppDataDirectory, fileName);

     
        using (var stream = await photo.OpenReadAsync())
        using (var fileStream = new FileStream(localFilePath, FileMode.Create, FileAccess.Write))
        {
            await stream.CopyToAsync(fileStream);
        }

        return localFilePath;
    }

}