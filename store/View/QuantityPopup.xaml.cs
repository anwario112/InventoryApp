using CommunityToolkit.Maui.Views;
using System.Diagnostics;

namespace store.View
{
    public partial class QuantityPopup : Popup
    {
        public Action<int, string, string, string, int,string,int,int> OnQuantitySet;
        public int ItemID { get; private set; }
        public string ItemName { get; set; }
        public string Barcode { get; set; }
        public string UnitDesc { get; set; }
        public int SectionID { get; set; }
        public string Price { get; set; }

        public int UnitID { get; set; }

        public QuantityPopup(string itemName, string barcode, string unitDesc, int sectionID, int itemID,string price,int unitID)
        {

            InitializeComponent();

            ItemName = itemName;
            Barcode = barcode;
            UnitDesc = unitDesc;
            SectionID = sectionID;
            ItemID = itemID;
            Price = price;
            UnitID = unitID;

            Debug.WriteLine($"in quantityPopup:ItemName:{ItemName},barcode:{Barcode},unitdesc:{UnitDesc}");
            this.Opened += QuantityPopup_Opened;
           

                
        }
        private async void QuantityPopup_Opened(object? sender, EventArgs e)
        {
            QuantityField.Focus();
        
        }
        private void Button_Clicked(object sender, EventArgs e)
        {
            if (int.TryParse(QuantityField.Text, out int quantity))
            {
                OnQuantitySet?.Invoke(quantity,ItemName,Barcode,UnitDesc,SectionID,Price, ItemID, UnitID);
                this.Close();
            }
            else
            {
              
                Application.Current.MainPage.DisplayAlert("Error", "Please enter a valid quantity.", "OK");
                QuantityField.Text = string.Empty;
                QuantityField.Focus();
            }
        }
    }
}