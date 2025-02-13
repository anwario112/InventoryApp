using store.ViewModels;

namespace store.View;

public partial class ItemCardArchive : ContentPage
{
	public ItemCardArchive()
	{
		InitializeComponent();
        var viewModel = new ItemCardArchiveViewModel();

        BindingContext = viewModel;
    }
}