using store.Service;
using store.View;
using System.Diagnostics;
namespace store
{
    public partial class App : Application
    {
        private AuthenticationService authService;
        private const string DeviceIdKey = "DeviceId";
        private const string IsLicenseEnteredKey = "IsLicenseEntered";

        public App()
        {
            InitializeComponent();
            authService = new AuthenticationService();

         
            ValidateDeviceBinding();
        }

        private void ValidateDeviceBinding()
        {
           
            string currentDeviceId = GetDeviceId();

         
            string storedDeviceId = Preferences.Get(DeviceIdKey, string.Empty);

          
            if (!string.IsNullOrEmpty(storedDeviceId) && storedDeviceId != currentDeviceId)
            {
            
                Preferences.Set(IsLicenseEnteredKey, false);
            
                Preferences.Remove(DeviceIdKey);
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

        protected override Window CreateWindow(IActivationState? activationState)
        {
          
            bool isLicenseEntered = Preferences.Get(IsLicenseEnteredKey, false);
            Debug.WriteLine($"isLicenseEntered: {isLicenseEntered}");
            Debug.WriteLine($"authService.IsAuthenticated: {authService.IsAuthenticated}");
            if (!isLicenseEntered)
            {
                Debug.WriteLine("Navigating to LicenseKeyPage");
               
                return new Window(new NavigationPage(new LicenseKeyPage(authService)));
            }
            if (authService.IsAuthenticated)
            {
                // User is authenticated, navigate to MainPage
                return new Window(new NavigationPage(new MainPage(authService)));
            }
            else
            {
                // User is not authenticated, navigate to LoginPage
                return new Window(new NavigationPage(new LoginPage(authService)));
            }
        }
    }
}