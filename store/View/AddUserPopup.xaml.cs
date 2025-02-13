using CommunityToolkit.Maui.Views;
using store.Data;
using store.Models;

namespace store.View
{
    public partial class AddUserPopup: Popup
    {
        private UserEntity userEntity;

    public AddUserPopup()
    {
        InitializeComponent();
        userEntity = new UserEntity(); 
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        
        var username = UsernameField.Text;
        var password = PasswordField.Text;
            var level = LevelField.Text;

            ErrorMessageLabel.Text = string.Empty;
            ErrorMessageLabel.IsVisible = false;

            if (await userEntity.CheckUsernameExists(username))
            {
                ErrorMessageLabel.Text = "Username already exists.";
                ErrorMessageLabel.IsVisible = true;
                return; 

            }

            // Create a new User object
            var user = new User
            {
                UserName = username,
                Password = password,
                Level=level
            };

       
        await userEntity.AddData(user);

            
    
        Close();
    }
}
}