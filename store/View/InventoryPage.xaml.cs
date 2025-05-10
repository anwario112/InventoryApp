
using CommunityToolkit.Maui.Views;
using store.Models;
using store.ViewModels;
using System.Diagnostics;
using Microsoft.Maui.Controls;
using CommunityToolkit.Mvvm.Messaging;
using static store.ViewModels.QuantityInventoryPopupViewModel;

namespace store.View;

public partial class InventoryPage : ContentPage
{

    private int SectionID {  get; set; }
    public readonly InventoryViewModel inventoryViewModel;


    public InventoryPage(int sectionid)
	{
		InitializeComponent();
        SectionID = sectionid;
        Debug.WriteLine($"the sectionID passed:{SectionID}");
        inventoryViewModel=new InventoryViewModel(SectionID);
        BindingContext= inventoryViewModel;


      


        MessagingCenter.Subscribe<QuantityInventoryPopupViewModel>(this, "DataSaved", async (sender) =>
        {
            Debug.WriteLine("Received DataSaved without parameter");
            await inventoryViewModel.LoadCards(SectionID);
        });

    }

   

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await inventoryViewModel.LoadCards(SectionID);

     
    }
  

    private void InventoryViewModel_DataSaved()
    {
      
        inventoryViewModel.LoadCards(SectionID);
    }




    private async void Barcode_TextChanged(object sender, TextChangedEventArgs e)
    {
       
    }

    private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {

    }

    private async void TapGestureRecognizer_Tapped_1(object sender, TappedEventArgs e)
    {
        if (e.Parameter is ItemCardsInventory item)
        {
            Debug.WriteLine($"the ID of the card:{item.ID}");
            await inventoryViewModel.DeletedCard(item.ID,SectionID);
            await inventoryViewModel.LoadCards(SectionID);
        }
    }

    private void TapGestureRecognizer_Tapped_2(object sender, TappedEventArgs e)
    {
      
    }

    private async void TapGestureRecognizer_Tapped_3(object sender, TappedEventArgs e)
    {
        var savedData = await inventoryViewModel.SaveItems(SectionID);
        if (savedData)
        {
            await Application.Current.MainPage.DisplayAlert("Success", "Items saved successfully!", "OK");
        }
        else
        {
            await Application.Current.MainPage.DisplayAlert("Error", "Failed to save items.", "OK");
        }
    }

    private async void editClick(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is ItemCardsInventory item)
        {
            Debug.WriteLine($"Editing item: {item.ID}");

            var popup = new QuantityInventoryPopup(
                inputType: QuantityInventoryPopup.InputType.Edit,
                sectionid: SectionID,
                barcode: null, 
                itemId: item.ID 
            );
          
            await this.ShowPopupAsync(popup);
        }
    }
}