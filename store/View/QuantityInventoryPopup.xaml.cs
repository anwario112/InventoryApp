
using CommunityToolkit.Maui.Views;
using store.ViewModels;
using System.Diagnostics;
using System.Globalization;
using ZXing;

namespace store.View;

public partial class QuantityInventoryPopup : Popup
{
	public string Barcode { get; set; }
    public int SectionID { get; set; }
    public int? ItemId { get; set; }
    private float _existingQuantity;
    public enum InputType { Inventory, Edit }
    private readonly InputType _inputType;
    private readonly bool _mergeEnabled;

    private readonly QuantityInventoryPopupViewModel _viewModel;
    private readonly InventoryViewModel inventoryViewModel;
  
    public QuantityInventoryPopup(InputType inputType,int sectionid, string barcode = null, int? itemId = null, float existingQuantity = 0, bool mergeEnabled = false)
	{
		InitializeComponent();
   
      
        _inputType = inputType;
        BindingContext = _viewModel;
        Barcode = barcode;
        SectionID=sectionid;
        ItemId = itemId;
        _mergeEnabled = mergeEnabled;
        _existingQuantity = existingQuantity;
        Debug.WriteLine($"itemid:{ItemId}");
       
        _viewModel = new QuantityInventoryPopupViewModel();
       

        Debug.WriteLine($"the barcode passsed:{Barcode}");

        ConfigureForInputType(inputType);
    }

    private void ConfigureForInputType(InputType inputType)
    {
        switch (inputType)
        {
            case InputType.Inventory:            
                QuantityField.Text = string.Empty;
                break;

            case InputType.Edit:
                
                QuantityField.Text = string.Empty;
                break;
        }
    }

    private async void SetQuantity(object sender, EventArgs e)
    {
        try
        {
            bool isSaved = false;
            float quantityToSet=0;
            bool isMergeQuantityChecked = Preferences.Get("MergeQuantityPreference", false);

            if (!float.TryParse(
             QuantityField.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out float enteredQuantity) || enteredQuantity <= 0)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please enter a valid positive quantity", "OK");
                return;
            }
            switch (_inputType)
            {
                case InputType.Inventory:
                    if (isMergeQuantityChecked && _existingQuantity > 0)
                    {
                       
                        quantityToSet = _existingQuantity + enteredQuantity;
                    }
                    else
                    {
                       
                        quantityToSet = enteredQuantity;
                    }
                    isSaved = await _viewModel.SetQauntity(Barcode, quantityToSet.ToString(), SectionID, isMergeQuantityChecked);
                    break;

                case InputType.Edit:
                   isSaved = await _viewModel.UpdateQuantity(QuantityField.Text, ItemId.Value);
                   break;
            }

            if (isSaved)
            {
               
                Close(quantityToSet);             
            }
           
        }
        catch (Exception ex)
        {
            Debug.WriteLine($"Error saving quantity: {ex}");
            await Shell.Current.DisplayAlert("Error", "An error occurred while saving", "OK");
        }
    }

    private void Button_Clicked(object sender, EventArgs e)
    {

    }
}