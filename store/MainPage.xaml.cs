using store.Api;
using store.Data;
using store.Service;
using store.View;
using store.ViewModels;

namespace store
{
    public partial class MainPage : ContentPage
    {

        private readonly DBContext db;
      
        private readonly InsertDataApi _insertDataApi;
        private AuthenticationService authService;


        public MainPage(AuthenticationService authService)
        {
            InitializeComponent();
            var httpHelper = new HttpHelper();

            db = new DBContext();
            this.authService = authService;
            usernameLabel.Text = $"Welcome to the App, {authService.Username}!";
            _insertDataApi = new InsertDataApi(httpHelper);
            BindingContext = _insertDataApi;
            

            if (authService.UserLevel == "admin")
            {
                SettingsBorder.Opacity = 1; 
            }
            else
            {            
                SettingsBorder.Opacity = 0.5; 

                SettingsBorder.GestureRecognizers.Clear(); 

            }
        }
        private async void InventoryTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new View.RakPage());
        }

        private async void OnSettingsTapped(object sender, TappedEventArgs e)
        {
            await Navigation.PushAsync(new View.Settings());
        }

       

        private async void importData(object sender, TappedEventArgs e)
        {

            LoadingIndicator.IsVisible = true;
            LoadingIndicator.IsRunning = true;

            await _insertDataApi.InsertApiData();


            LoadingIndicator.IsRunning = false;
            LoadingIndicator.IsVisible = false;

            LoadingCompleteLabel.IsVisible = true;
       

            await Task.Delay(2000);

            LoadingCompleteLabel.IsVisible = false;
        }

        private async void ExportData(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.ExportPage());
        }

        private async void LogoutTap(object sender, EventArgs e)
        {
            authService.Logout();
            Application.Current.MainPage = new NavigationPage(new LoginPage(authService));
        }

        private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.ShoppingPage(authService.Username));
        }
    }

}
