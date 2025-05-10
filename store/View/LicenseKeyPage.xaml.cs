using store.Models;
using store.Service;
using store.Api;
using System.Diagnostics;
using System.Net.Http;
namespace store.View;
public partial class LicenseKeyPage : ContentPage
{
    private readonly HttpHelper _httpHelper;
    private const string ApiUrl = "http://dddsoft-001-site4.anytempurl.com/api/licensekey/verify";
    private AuthenticationService authService;
    private const string DeviceIdKey = "DeviceId";
    private const string IsLicenseEnteredKey = "IsLicenseEntered";
    private const string LicenseKeyPrefKey = "LicenseKey";

    public LicenseKeyPage(AuthenticationService authService)
    {
        InitializeComponent();
        _httpHelper = new HttpHelper("12345-ABCDE-67890-FGHIJ", "S3cr3tK3y!@#2023");
        this.authService = authService;
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        string LicenseKey = licenseKeyEntry.Text;
        if (string.IsNullOrWhiteSpace(LicenseKey))
        {
            await DisplayAlert("Error", "Please enter a license key", "OK");
            return;
        }

        try
        {
            var response = await _httpHelper.LicenseGetResponse(ApiUrl, LicenseKey);
            var result = System.Text.Json.JsonSerializer.Deserialize<LicenseVerificationResult>(response);

            if (result?.IsVerified == true)
            {
            
                string deviceId = GetDeviceId();
                Preferences.Set(DeviceIdKey, deviceId);

            
                Preferences.Set(IsLicenseEnteredKey, true);
                Preferences.Set(LicenseKeyPrefKey, LicenseKey);

                await DisplayAlert("Success", "License verified successfully", "OK");
                await Navigation.PushAsync(new LoginPage(authService));
            }
            else
            {
                await DisplayAlert("Error", "Invalid license key", "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"Verification failed: {ex.Message}", "OK");
            Debug.WriteLine($"License verification error: {ex}");
        }
    }

    private string GetDeviceId()
    {
      
        return DeviceInfo.Current.Idiom.ToString() + "_" +
               DeviceInfo.Name + "_" +
               DeviceInfo.Model + "_" +
               DeviceInfo.Manufacturer + "_" +
               DeviceInfo.Platform;
    }
}