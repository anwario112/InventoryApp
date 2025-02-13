using CommunityToolkit.Maui.Views;

namespace store.View;

public partial class ConnectionBox : Popup
{
	public ConnectionBox()
	{
		InitializeComponent();
	}

    private async void saveData_Clicked(object sender, EventArgs e)
    {
        var View = (ViewModels.SaveConnection)this.BindingContext;

       
        await View.SaveConnect();
    }
}