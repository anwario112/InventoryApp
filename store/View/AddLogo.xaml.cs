using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using CommunityToolkit.Maui.Views;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using store.Data;
using store.Models;
using System.Diagnostics;
namespace store.View;
public partial class CurrencyPopup : Popup
{
    private byte[] _imageBytes;
    private string _imageFileName;
    private LogoEntity _logoEntity;

    public CurrencyPopup()
    {
        InitializeComponent();
        try
        {
            _logoEntity = new LogoEntity();
            Debug.WriteLine("LogoEntity initialized successfully");
        }
        catch (Exception ex)
        {
            Debug.WriteLine($"CRITICAL ERROR: Failed to initialize LogoEntity: {ex}");
            
            SaveButton.IsEnabled = false;
        }
    }

    private async void OnPickImageClicked(object sender, EventArgs e)
    {
        try
        {
            var status = await Permissions.CheckStatusAsync<Permissions.Photos>();
            if (status != PermissionStatus.Granted)
            {
                status = await Permissions.RequestAsync<Permissions.Photos>();
                if (status != PermissionStatus.Granted)
                {
                    await Shell.Current.DisplayAlert("Permission required",
                        "Please grant photos permission to select images", "OK");
                    return;
                }
            }

            var result = await FilePicker.Default.PickAsync(new PickOptions
            {
                PickerTitle = "Select Currency Image",
                FileTypes = FilePickerFileType.Images
            });

            if (result != null)
            {
                _imageFileName = result.FileName;
                FileNameLabel.Text = _imageFileName;

                using var stream = await result.OpenReadAsync();
                using var memoryStream = new MemoryStream();
                await stream.CopyToAsync(memoryStream);
                _imageBytes = memoryStream.ToArray();

                PreviewImage.Source = ImageSource.FromStream(() => new MemoryStream(_imageBytes));

               
                SaveButton.IsEnabled = _logoEntity != null;
            }
        }
        catch (Exception ex)
        {
            Debug.WriteLine($"Image picking failed: {ex}");
            await Shell.Current.DisplayAlert("Error", "Failed to pick image: " + ex.Message, "OK");
        }
    }

    private async void OnSaveClicked(object sender, EventArgs e)
    {
        try
        {
          
            if (_logoEntity == null)
            {
                Debug.WriteLine("ERROR: _logoEntity is null");
                await Shell.Current.DisplayAlert("Error", "Database connection not initialized", "OK");
                return;
            }

           
            if (_imageBytes == null || string.IsNullOrEmpty(_imageFileName))
            {
                await Shell.Current.DisplayAlert("Error", "No image selected", "OK");
                return;
            }

            var logo = new LogoCompany
            {
                image = _imageFileName,
                ImageData = _imageBytes
            };

            Debug.WriteLine($"image: {logo.image}, ImageData length: {logo.ImageData.Length}");

          
            bool success = await _logoEntity.AddData(logo);

            if (success)
            {
                await Toast.Make("Saved!", ToastDuration.Short, 14).Show();
                this.Close(true);
            }
            else
            {
                await Toast.Make("error!", ToastDuration.Short, 14).Show();
            }
        }
        catch (Exception ex)
        {
            Debug.WriteLine($"[SAVE ERROR] {ex}");
            await Shell.Current.DisplayAlert("Error", $"Save failed: {ex.Message}", "OK");
        }
    }
}