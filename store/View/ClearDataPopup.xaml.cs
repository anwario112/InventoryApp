using CommunityToolkit.Maui.Views;
using Microsoft.Maui.Controls;
using store.ViewModels;
using System.Diagnostics;

namespace store.View
{
    public partial class ClearDataPopup : Popup
    {
        private readonly SettingsClearData _viewModel;
        private readonly int _sectionID;
        public ClearDataPopup(SettingsClearData viewModel, string context, int sectionID = 0)
        {
            InitializeComponent();

            if (viewModel == null)
            {
                Debug.WriteLine("Error: viewModel is null.");
                return;
            }

            _viewModel = viewModel;
            this.BindingContext = _viewModel;
            _sectionID = sectionID;

            if (ContentStack == null)
            {
                Debug.WriteLine("Error: ContentStack is null.");
                return;
            }

            CreateForm(context);
            this.Opened += ClearDataPopup_Opened;
        }

        private void CreateForm(string context)
        {

            ContentStack.Children.Clear();

            var passwordField = new Entry
            {
                Placeholder = "Password",
                WidthRequest = 200
            };
            passwordField.SetBinding(Entry.TextProperty, nameof(SettingsClearData.Password));

            var actionButton = new Button
            {
                Margin = new Thickness(0, 10, 0, 0),
                WidthRequest = 200,
                BackgroundColor = (Color)Application.Current.Resources["teal"]
            };


            if (context == "Settings")
            {
                actionButton.Text = "Save";
                actionButton.Clicked += async (s, e) =>
                {
                    string password = passwordField.Text;
                    await _viewModel.SavePassword();
                    Close();
                };
            }
            else if (context == "Other")
            {
                actionButton.Text = "Enter";
                actionButton.Clicked += async (s, e) =>
                {
                    await _viewModel.CheckPasswordAndDeleteCards(_sectionID);
                    Close();
                };
            }


            ContentStack.Children.Add(passwordField);
            ContentStack.Children.Add(actionButton);





        }

        private void ClearDataPopup_Opened(object? sender, EventArgs e)
        {


            var passwordField = ContentStack.Children.OfType<Entry>().FirstOrDefault();

            passwordField?.Focus();

        }
    }
}
