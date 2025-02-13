using CommunityToolkit.Maui.Views;
using Microsoft.Maui.Controls;
using store.Data;
using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace store.View
{
    public partial class ItemCard : ContentView, INotifyPropertyChanged
    {

 
        public event PropertyChangedEventHandler PropertyChanged;
        private readonly ItemCardEntity _itemCardEntity;


     

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)

        {

            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        }

        public ItemCard()
        {
            InitializeComponent();
            _itemCardEntity=new ItemCardEntity();

           

        }




        public static readonly BindableProperty IDProperty =
            BindableProperty.Create(nameof(ID), typeof(int), typeof(ItemCard), default(int));


        public int ID
        {

            get => (int)GetValue(IDProperty);

            set
            {
                Debug.WriteLine($"the ID of this Card is:{value}");
                SetValue(IDProperty, value);
                OnPropertyChanged();
            }

        }


        public static readonly BindableProperty ItemBarcodeProperty =
            BindableProperty.Create(nameof(ItemBarcode), typeof(string), typeof(ItemCard), default(string));

        public string ItemBarcode
        {
            get => (string)GetValue(ItemBarcodeProperty);

            set
            {
                Debug.WriteLine($"Setting ItemBarcode: {value}");
                SetValue(ItemBarcodeProperty, value);
                OnPropertyChanged();
                
            }
        }


        public static readonly BindableProperty ItemNameProperty =
            BindableProperty.Create(nameof(ItemName), typeof(string), typeof(ItemCard), default(string));

        public string ItemName
        {
            get => (string)GetValue(ItemNameProperty);
            set { 
                
                SetValue(ItemNameProperty, value);
                Debug.WriteLine($"the Itemname set:{value}");
                OnPropertyChanged();
            }
        }


        public static readonly BindableProperty QuantityProperty =
            BindableProperty.Create(nameof(Quantity), typeof(int), typeof(ItemCard), default(int));

        public int Quantity
        {
            get => (int)GetValue(QuantityProperty);
            set {
                SetValue(QuantityProperty, value);
                OnPropertyChanged();
            }
        }


        public static readonly BindableProperty UnitProperty =
            BindableProperty.Create(nameof(Unit), typeof(string), typeof(ItemCard), default(string));

        public string Unit
        {
            get => (string)GetValue(UnitProperty);
            set { 
                
                SetValue(UnitProperty, value);
                Debug.WriteLine($"the Unit set is :{value}");
                OnPropertyChanged();
            }

         
        }





        private async void Button_Clicked(object sender, EventArgs e)
        {
            Debug.WriteLine("Change button clicked");
            string barcode = ItemBarcode;
            int id = ID;

            var currentPage = Application.Current.MainPage;
            var changePopup = new ChangePopup(this);
           
            await currentPage.ShowPopupAsync(changePopup);
        }

        private void OnExitImageTapped(object sender, EventArgs e)
        {

            int id = ID;
            _itemCardEntity.DeleteCard(id);
            MessagingCenter.Send(this, "ItemCardDeleted", id);


        }




        private async void Button_Clicked_1(object sender, EventArgs e)
        {
            Debug.WriteLine("Packing button clicked");
            string barcode = ItemBarcode;
            int id = ID;

            var currentPage = Application.Current.MainPage;
            var packingPopup = new PackingPopup(barcode,id);

            await currentPage.ShowPopupAsync(packingPopup);

        }

        private async void EditClicked(object sender, EventArgs e)
        {
            int id = ID;

            var currentPage = Application.Current.MainPage;
            var EditQuantity = new EditQuantityPopup(id);

            await currentPage.ShowPopupAsync(EditQuantity);
        }
    }
}
