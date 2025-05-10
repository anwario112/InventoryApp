using store.Models;
using store.ViewModels;
using System.Diagnostics;
using Microsoft.Maui.Controls;
using store.DTO;
using store.Data;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using iText.Kernel.Pdf.Canvas.Draw;
using iText.Layout.Properties;
using iText.IO.Font.Constants;
using iText.Kernel.Font;
using iText.Kernel.Geom;
using iText.IO.Image;

namespace store.View
{
    public partial class ShoppingCardPage : ContentPage
    {
        private readonly shoppingCards _fetchCardList;
        private readonly InvoiceDetailsViewModel _invoiceDetailsViewModel;
        private readonly string _mode;

        public string Username { get; set; }
        public int InvoiceNum { get; set; }


        public ShoppingCardPage(string username, string mode = "shopping", int invoiceNum = 0)
        {
            InitializeComponent();

            _fetchCardList = new shoppingCards();
            BindingContext = _fetchCardList;
            Username = username;
            _mode = mode;
            InvoiceNum = invoiceNum;





            if (_mode == "shopping")
            {
                LoadShoppingCartItems(Username);
                ShoppingCartUI.IsVisible = true;
                InvoiceUI.IsVisible = false;
            }
            else if (_mode == "invoice")
            {
                _invoiceDetailsViewModel = new InvoiceDetailsViewModel(InvoiceNum);

                BindingContext = _invoiceDetailsViewModel;           
                ShoppingCartUI.IsVisible = false;
                InvoiceUI.IsVisible = true;
                _invoiceDetailsViewModel.NavigationRequested += ViewModel_NavigationRequested;
            }

            Debug.WriteLine($"ShoppingCardPage initialized with Username: {Username}, Mode: {_mode}, InvoiceNum: {InvoiceNum}");
        }


        private async void ViewModel_NavigationRequested(object sender, EventArgs e)
        {
          
            await Navigation.PushAsync(new InvoicePage(Username));
          
        }
        protected override async void OnAppearing()
        {
            base.OnAppearing();

            if (_mode == "invoice")
            {

                LoadInvoiceDetails(InvoiceNum);

            }

        }

        private void CustomerSearchResults_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedCustomer = e.CurrentSelection.FirstOrDefault() as Customer;
            if (selectedCustomer != null)
            {
                Debug.WriteLine($"Selected Customer: {selectedCustomer.FirstName} {selectedCustomer.LastName}");

               
                var viewModel = BindingContext as shoppingCards;
                viewModel.SelectedCustomer = selectedCustomer;
            }
        }

        private async void LoadShoppingCartItems(string username)
        {
            await _fetchCardList.LoadShoppingCartItems(username);
        }


        private async void LoadInvoiceDetails(int invoiceNum)
        {

            await _invoiceDetailsViewModel.GetInvoiceDetails(invoiceNum);
            if (_invoiceDetailsViewModel.InvoiceStatus == "sent")
            {
                invoiceStatus.Opacity = 0.5;
                invoiceStatus.GestureRecognizers.Clear();
            }
           

        }
        private void OnCustomerSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = e.NewTextValue?.Trim();

          
        }

        private void OnCustomerSelected(object sender, SelectionChangedEventArgs e)
        {
           
        }
        private void OnClearSelectedCustomer(object sender, TappedEventArgs e)
        {
            
        }
        private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {
            var item = e.Parameter as dynamic;

            if (item != null)
            {
                Debug.WriteLine($"Item ID: {item.ID}");
                bool isDeleted = await _fetchCardList.DeleteShoppingCartItem(item.ID, Username);

                if (isDeleted)
                {
                    await _fetchCardList.LoadShoppingCartItems(Username);
                }
                else
                {
                    Debug.WriteLine("Failed to delete the item.");
                }
            }
        }

        private async void SendShoppingCards(object sender, TappedEventArgs e)
        {
            var isSaved = await _fetchCardList.SaveInvoice(Username);

            if (isSaved)
            {
                invoiceSavedLabel.Text = "Invoice is Saved!";
                invoiceSavedLabel.TextColor = Colors.Green;
                invoiceSavedLabel.IsVisible = true;

                await Task.Delay(3000);
                invoiceSavedLabel.IsVisible = false;
            }
            else
            {
                invoiceSavedLabel.Text = "Failed To save invoice!";
                invoiceSavedLabel.TextColor = Colors.Red;
                invoiceSavedLabel.IsVisible = true;

                await Task.Delay(3000);
                invoiceSavedLabel.IsVisible = false;
            }
        }
        private async void OnAddItemTapped(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.ShoppingPage("Invoice", Username, InvoiceNum));
        }


        private async void OnAddCustomerTapped(object sender, TappedEventArgs e)
        {
            Navigation.PushAsync(new View.CustomerPage());
        }

        private async void OnExitTapped(object sender, TappedEventArgs e)
        {

            var image = sender as Microsoft.Maui.Controls.Image;


            var item = image?.BindingContext as InvoiceDetailDTO;

            if (item != null)
            {

                Debug.WriteLine($"Item ID: {item.ID}");
                bool isDeleted = await _invoiceDetailsViewModel.DeleteInvoiceItem(item.ID, InvoiceNum);
                if (isDeleted)
                {
                    Debug.WriteLine("Item deleted successfully.");
                }
                else
                {
                    await DisplayAlert("Error", "Failed to delete the item.", "OK");
                }

            }
            else
            {
                Debug.WriteLine("Item not found.");
            }
        }
        private async void SendData(object sender, TappedEventArgs e)
        {
            await _invoiceDetailsViewModel.SendData();
        }

        private async void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            var searchBar = sender as SearchBar;
            var viewModel = BindingContext as shoppingCards;

            if (searchBar != null && viewModel != null)
            {
                viewModel.SearchBar = searchBar.Text;
                viewModel.SearchCustomers().Wait(); 

              
                CustomerSearchResults.ItemsSource = viewModel.FilteredCustomers;
            }
        }


        private async void GeneratePdf(object sender, TappedEventArgs e)
        {
            string filename = $"invoice_{InvoiceNum}.pdf";

#if ANDROID
    var docsDirectory = Android.App.Application.Context.GetExternalFilesDir(Android.OS.Environment.DirectoryDocuments);
    var filePath = System.IO.Path.Combine(docsDirectory.AbsolutePath, filename);
#else
            var filePath = System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), filename);
#endif


            try
            {


                var logoEntity = new LogoEntity();
                var logo = (await logoEntity.GetAllLogos()).FirstOrDefault();
                using (PdfWriter writer = new PdfWriter(filePath))
                {
                 
                    PageSize smallPage = new PageSize(226.77f, 600f);
                    PdfDocument pdf = new PdfDocument(writer);
                    pdf.SetDefaultPageSize(smallPage);

                    Document document = new Document(pdf);
                    document.SetMargins(10, 10, 10, 10);

                    if (logo?.ImageData != null)
                    {
                        try
                        {
                          
                            var logoImageData = ImageDataFactory.Create(logo.ImageData);
                            var logoImage = new iText.Layout.Element.Image(logoImageData)
                                .SetWidth(30) 
                                .SetAutoScaleHeight(true)
                                .SetHorizontalAlignment(iText.Layout.Properties.HorizontalAlignment.CENTER);

                            document.Add(logoImage);
                            document.Add(new Paragraph("\n")); 
                        }
                        catch (Exception ex)
                        {
                            Debug.WriteLine($"Error adding logo: {ex.Message}");
                           
                        }
                    }

                    PdfFont boldFont = PdfFontFactory.CreateFont(StandardFonts.HELVETICA_BOLD);

                    Paragraph header = new Paragraph("INVOICE")
                        .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                        .SetFontSize(14)
                        .SetFont(boldFont);
                    document.Add(header);


                    Paragraph invoiceInfo = new Paragraph()
                        .Add(new Text("Invoice #: ").SetFont(boldFont))
                        .Add(new Text($"{InvoiceNum}\n"))
                        .Add(new Text("Date: ").SetFont(boldFont))
                        .Add(new Text($"{_invoiceDetailsViewModel.InvoiceDateString}\n"))
                        .Add(new Text("Status: ").SetFont(boldFont))
                        .Add(new Text($"{_invoiceDetailsViewModel.InvoiceStatus.ToUpper()}\n"))
                        .SetTextAlignment(iText.Layout.Properties.TextAlignment.LEFT)
                        .SetFontSize(12)
                        .SetMarginTop(10);
                    document.Add(invoiceInfo);

                   
                    Paragraph customerInfo = new Paragraph()
                        .Add(new Text("Customer: ").SetFont(boldFont))
                        .Add(new Text($"{_invoiceDetailsViewModel.CustomerFirstName} {_invoiceDetailsViewModel.CustomerLastName}\n"))
                        .Add(new Text("Phone: ").SetFont(boldFont))
                        .Add(new Text($"{_invoiceDetailsViewModel.CustomerPhone}\n"))
                        .SetTextAlignment(iText.Layout.Properties.TextAlignment.LEFT)
                        .SetFontSize(12)
                        .SetMarginTop(10);
                    document.Add(customerInfo);

                  
                    LineSeparator ls = new LineSeparator(new SolidLine());
                    document.Add(ls);

                 
                    var table = new Table(UnitValue.CreatePercentArray(new float[] { 50, 15, 15, 20 }))
                        .UseAllAvailableWidth();

                
                    table.AddHeaderCell(new iText.Layout.Element.Cell().Add(new Paragraph("Item").SetFont(boldFont)));
                    table.AddHeaderCell(new iText.Layout.Element.Cell().Add(new Paragraph("Price").SetFont(boldFont)));
                    table.AddHeaderCell(new iText.Layout.Element.Cell().Add(new Paragraph("Qty").SetFont(boldFont)));
                    table.AddHeaderCell(new iText.Layout.Element.Cell().Add(new Paragraph("Total").SetFont(boldFont)));

                  
                    foreach (var item in _invoiceDetailsViewModel.InvoiceItems)
                    {
                        table.AddCell(new iText.Layout.Element.Cell().Add(new Paragraph(item.ItemName)));
                        table.AddCell(new iText.Layout.Element.Cell().Add(new Paragraph(item.Price.ToString("F2"))));
                        table.AddCell(new iText.Layout.Element.Cell().Add(new Paragraph(item.Quantity.ToString())));
                        table.AddCell(new iText.Layout.Element.Cell().Add(new Paragraph(item.TotalNet.ToString("F2"))));
                    }

                    document.Add(table);

                  
                    Paragraph total = new Paragraph()
                        .Add(new Text("\nTotal: ").SetFont(boldFont))
                        .Add(new Text(_invoiceDetailsViewModel.TotalString).SetFont(boldFont))
                        .SetTextAlignment(iText.Layout.Properties.TextAlignment.RIGHT)
                        .SetFontSize(14)
                        .SetMarginTop(10);
                    document.Add(total);

                
                    Paragraph footer = new Paragraph("Thank you for your business!")
                        .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                        .SetFontSize(12)                     
                        .SetMarginTop(20);
                    document.Add(footer);

                    document.Close();
                }

                await DisplayAlert("Success", $"PDF generated at: {filePath}", "OK");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error generating PDF: {ex.Message}");
                await DisplayAlert("Error", "Failed to generate PDF", "OK");
            }
        }

    }
    }
