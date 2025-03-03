using store.ViewModels;
using System.Diagnostics;

namespace store.View;

public partial class InvoiceDetails : ContentPage
{
	public int invoiceNum { get; set; }
	public string  firstname { get; set; }
	public string lastname { get; set; }
    public string Total { get; set; }
    public InvoiceDetailsViewModel ViewModel { get; set; }

    public InvoiceDetails(int InvoiceNum,string FirstName,string LastName,string total)
	{
		InitializeComponent();
        invoiceNum=InvoiceNum;
		firstname = FirstName;
		lastname = LastName;
        FirstNameLabel.Text = FirstName;
        LastNameLabel.Text = LastName;
        Total = total;
        TotalLabel.Text= $"${Total}";
        InvoiceNumLabel.Text = $"Invoice # {InvoiceNum}";

        if (!string.IsNullOrEmpty(FirstName) && !string.IsNullOrEmpty(LastName))
        {
            InitialsLabel.Text = $"{FirstName[0]}{LastName[0]}".ToUpper(); 

        }

        ViewModel = new InvoiceDetailsViewModel(invoiceNum);
        BindingContext = ViewModel;
    }
}