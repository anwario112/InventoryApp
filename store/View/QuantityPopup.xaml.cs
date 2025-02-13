using CommunityToolkit.Maui.Views;
using System.Diagnostics;

namespace store.View
{
    public partial class QuantityPopup : Popup
    {
        public Action<int, string, string, string, int> OnQuantitySet;
        public int ItemID { get; private set; }
        public string ItemName { get; set; }
        public string Barcode { get; set; }
        public string UnitDesc { get; set; }
        public int SectionID { get; set; }

        public QuantityPopup(string itemName, string barcode, string unitDesc, int sectionID, int itemID)
        {

            InitializeComponent();

            ItemName = itemName;

            Barcode = barcode;

            UnitDesc = unitDesc;


            SectionID = sectionID;
            ItemID = itemID;
            Debug.WriteLine($"in quantityPopup:ItemName:{ItemName},barcode:{Barcode},unitdesc:{UnitDesc}");

        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            if (int.TryParse(QuantityField.Text, out int quantity))
            {
                OnQuantitySet?.Invoke(quantity,ItemName,Barcode,UnitDesc,SectionID);
                this.Close();
            }
            else
            {
              
                Application.Current.MainPage.DisplayAlert("Error", "Please enter a valid quantity.", "OK");
                QuantityField.Text = string.Empty; 
            }
        }
    }
}