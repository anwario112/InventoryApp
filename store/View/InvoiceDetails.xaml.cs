using System.Diagnostics;

namespace store.View;

public partial class InvoiceDetails : ContentPage
{
	public int invoiceNum { get; set; }
	public string  firstname { get; set; }
	public string lastname { get; set; }
    public string Phone { get; set; }
    public InvoiceDetails(int InvoiceNum,string FirstName,string LastName)
	{
		InitializeComponent();
        invoiceNum=InvoiceNum;
		firstname = FirstName;
		lastname = LastName;
        FirstNameLabel.Text = FirstName;
        LastNameLabel.Text = LastName;

        if (!string.IsNullOrEmpty(FirstName) && !string.IsNullOrEmpty(LastName))
        {
            InitialsLabel.Text = $"{FirstName[0]}{LastName[0]}".ToUpper(); 

        }

        Debug.WriteLine($"the invoiceNum:{invoiceNum}");
    }
}