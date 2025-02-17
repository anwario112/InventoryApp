using store.Data;
using store.DTO; // Make sure to include the DTO namespace
using store.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace store.ViewModels
{
    public class InvoiceViewModel : INotifyPropertyChanged
    {
        private Color _unsentTextColor = Colors.Black;
        private Color _unsentBackgroundColor = Colors.White;
        private Color _sentTextColor = Colors.Black;
        private Color _sentBackgroundColor = Colors.Transparent;

        private List<InvoiceWithCustomer> _allInvoicesWithNames; 
        private ObservableCollection<InvoiceWithCustomer> _filteredInvoices; 
        private readonly InvoiceEntity _invoiceEntity;
        private readonly UserEntity _userEntity;
        public ICommand ItemTappedCommand { get; }

        public Color UnsentTextColor
        {
            get => _unsentTextColor;
            set
            {
                _unsentTextColor = value;
                OnPropertyChanged();
            }
        }

        public Color UnsentBackgroundColor
        {
            get => _unsentBackgroundColor;
            set
            {
                _unsentBackgroundColor = value;
                OnPropertyChanged();
            }
        }

        public Color SentTextColor
        {
            get => _sentTextColor;
            set
            {
                _sentTextColor = value;
                OnPropertyChanged();
            }
        }

        public Color SentBackgroundColor
        {
            get => _sentBackgroundColor;
            set
            {
                _sentBackgroundColor = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<InvoiceWithCustomer> FilteredInvoices
        {
            get => _filteredInvoices;
            set
            {
                _filteredInvoices = value;
                OnPropertyChanged();
            }
        }

        public Command SelectUnsentCommand { get; }
        public Command SelectSentCommand { get; }

        public InvoiceViewModel(string username)
        {
            _invoiceEntity = new InvoiceEntity();
            _userEntity = new UserEntity();
            SelectUnsentCommand = new Command(OnUnsentTapped);
            SelectSentCommand = new Command(OnSentTapped);
            ItemTappedCommand = new Command<InvoiceWithCustomer>(OnItemTapped);
            FilteredInvoices = new ObservableCollection<InvoiceWithCustomer>(); 

            LoadUser(username);
        }

        private async void LoadUser(string username)
        {
            var userId = await _userEntity.FindUser(username);

            if (userId.HasValue)
            {
                await LoadInvoicesAsync(userId.Value);
            }
            else
            {
                Debug.WriteLine("User  not found.");
            }
        }

        public async Task LoadInvoicesAsync(int userId)
        {
            var invoicesWithNames = await _invoiceEntity.GetInvoicesWithCustomerNamesAsync();
            Debug.WriteLine($"Loaded {invoicesWithNames.Count} invoices from the database.");

            
            _allInvoicesWithNames = invoicesWithNames
                .Where(i => i.Invoice.UserID == userId)
                .Select(i => new InvoiceWithCustomer
                {
                    Invoice = i.Invoice,
                    FirstName = i.FirstName,
                    LastName = i.LastName
                })
                .ToList();

            Debug.WriteLine($"Filtered invoices for user {userId}: {_allInvoicesWithNames.Count} invoices found.");

            foreach (var invoice in _allInvoicesWithNames)
            {
                FilteredInvoices.Add(invoice);
                Debug.WriteLine($"Added InvoiceNum: {invoice.Invoice.InvoiceNum}, Customer: {invoice.FirstName} {invoice.LastName}, Status: {invoice.Invoice.Status}");
            }

            Debug.WriteLine($"Total invoices displayed: {FilteredInvoices.Count} for user {userId}.");
        }

        public void FilterInvoicesByStatus(string status)
        {
            if (_allInvoicesWithNames == null) return;

            var filtered = _allInvoicesWithNames
                .Where(i => i.Invoice.Status.Equals(status, StringComparison.OrdinalIgnoreCase))
                .ToList();

            Debug.WriteLine($"Filtered invoices count for status '{status}': {filtered.Count}");

            FilteredInvoices.Clear(); 
            foreach (var invoice in filtered)
            {
                FilteredInvoices.Add(invoice);
            }
        }

        private void OnUnsentTapped()
        {
            UnsentTextColor = (Color)Application.Current.Resources["teal"];
            UnsentBackgroundColor = Colors.White;
            SentTextColor = Colors.Black;
            SentBackgroundColor = Colors.Transparent;

            FilterInvoicesByStatus("not sent");
        }

        private void OnSentTapped()
        {
            SentTextColor = (Color)Application.Current.Resources["teal"];
            SentBackgroundColor = Colors.White;
            UnsentTextColor = Colors.Black;
            UnsentBackgroundColor = Colors.Transparent;

            FilterInvoicesByStatus("sent");
        }

        private async void OnItemTapped(InvoiceWithCustomer tappedInvoice)
        {
            if (tappedInvoice != null)
            {
                Debug.WriteLine($"Tapped on Invoice: {tappedInvoice.Invoice.InvoiceNum}");
                await Application.Current.MainPage.Navigation.PushAsync(new View.InvoiceDetails(

                   tappedInvoice.Invoice.InvoiceNum,

                   tappedInvoice.FirstName,

                   tappedInvoice.LastName));
            }
        }
        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}