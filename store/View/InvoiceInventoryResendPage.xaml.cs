using store.ViewModels;

namespace store.View;

public partial class InvoiceInventoryResendPage : ContentPage
{

	private readonly InvoiceInventoryResendViewModel _viewModel;
	public InvoiceInventoryResendPage()
	{

		
		InitializeComponent();
		_viewModel = new InvoiceInventoryResendViewModel();
		BindingContext= _viewModel;


    }
}