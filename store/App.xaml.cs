using store.Service;
using store.View;

namespace store
{
    public partial class App : Application
    {
        private AuthenticationService authService; 

        public App()
        {
            InitializeComponent();
            authService = new AuthenticationService();
            
        }

        protected override Window CreateWindow(IActivationState? activationState)
        {
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