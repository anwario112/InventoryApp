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


        public MainPage(AuthenticationService authService,string apiKey="12345-ABCDE-67890-FGHIJ", string secretKey= "S3cr3tK3y!@#2023")
        {
            InitializeComponent();
            var httpHelper = new HttpHelper(apiKey, secretKey);

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

       

        private async void ShoopingPage(object sender, TappedEventArgs e)
        {

            Navigation.PushAsync(new View.CashVan(authService.Username));
        }

        private async void Inventory(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.RakInventoryPage());
        }

        private async void itemPrice(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.ItemPricePage());
        }

        private async void LogoutTap(object sender, EventArgs e)
        {
            authService.Logout();
            Application.Current.MainPage = new NavigationPage(new LoginPage(authService));
        }

       

        private void InvoiceTapped(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.InvoicePage(authService.Username));
        }
    }

}
