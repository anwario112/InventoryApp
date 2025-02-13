using store.Service;

namespace store.View;

public partial class LoginPage : ContentPage
{
    private AuthenticationService authService;
    public LoginPage(AuthenticationService authService)
	{
		InitializeComponent();
        this.authService = authService;
    }

    private async void loginTap(object sender, EventArgs e)
    {
		var username = Username.Text;
		var password = Password.Text;
        bool loginSuccessful = await authService.Login(username, password);

        if (authService.IsAuthenticated)
		{
            await Navigation.PushAsync(new MainPage(authService));
        }
		else
		{
            await DisplayAlert("Error", "Invalid username or password.", "OK");
        }

    }
}