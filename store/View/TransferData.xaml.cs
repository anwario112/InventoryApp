using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.Messaging;
using Microsoft.EntityFrameworkCore;
using store.Api;
using store.Data;
using store.Messages;
using store.Models;
using store.Observation;
using store.ViewModels;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Threading;
using ZXing.Net.Maui;
using ZXing.Net.Maui.Controls;
using ZXing.QrCode.Internal;
using CommunityToolkit.Maui.Core;




namespace store.View
{
    public partial class TransferData : ContentPage
    {
        private readonly DBContext db;
  
        private readonly InsertDataApi _insertDataApi;
  
        private CancellationTokenSource _cancellationTokenSource;
        private readonly TransferDataViewModel transferDataViewModel;
 
        private int sectionID;


        public TransferData(int SectionID, string apiKey = "12345-ABCDE-67890-FGHIJ", string secretKey = "S3cr3tK3y!@#2023")
        {
            InitializeComponent();
            var httpHelper = new HttpHelper(apiKey, secretKey);

            db = new DBContext();
          

            _insertDataApi = new InsertDataApi(httpHelper);
            BindingContext = this;
            sectionID = SectionID;
            transferDataViewModel = new TransferDataViewModel(sectionID, apiKey, secretKey);
            BindingContext = transferDataViewModel;
            Barcode.Focus();
            Dispatcher.Dispatch(() =>
            {
                Barcode.Focus();
            });

        }


        protected override async void OnAppearing()
        {
            base.OnAppearing();
           
            Barcode.Focus();

        }




        private async void Entry_TextChanged(object sender, TextChangedEventArgs e)
        {
            Debug.WriteLine("Entry_TextChanged called");
            await transferDataViewModel.Entry_TextChanged(sender, e);
        }


        private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {
            if (sender is Image image && image.BindingContext is Models.ItemCard itemCard)
            {
                int id = itemCard.ID; 
                await transferDataViewModel.OnExitImageTapped(id); 
            }
            else
            {
                Debug.WriteLine("BindingContext is not an ItemCard object.");
            }
        }

        private async void clearData(object sender, TappedEventArgs e)
        {
           
            var viewModel = new SettingsClearData();

            var clearDataPopup = new View.ClearDataPopup(viewModel, "Other", sectionID);

             await this.ShowPopupAsync(clearDataPopup);
        }
        private async void SaveData(object sender, TappedEventArgs e)
        {
            await _insertDataApi.SaveExportData(sectionID);
        }

        private async void OnCameraImageTapped(object sender, EventArgs e)
        {
            var cameraView = new CameraBarcodeReaderView
            {
                IsDetecting = true,
                Options = new BarcodeReaderOptions
                {
                    Formats = BarcodeFormats.All,
                    AutoRotate = true,
                    Multiple = false
                },
                CameraLocation = CameraLocation.Rear,
                IsTorchOn = false
            };

            var popupPage = new CameraPopupPage(cameraView);

            MessagingCenter.Subscribe<CameraPopupPage, string>(this, "BarcodeScanned", (sender, barcodeValue) =>
            {
                Barcode.Text = barcodeValue;
                Debug.WriteLine($"Barcode scanned: {barcodeValue}");

                MessagingCenter.Unsubscribe<CameraPopupPage, string>(this, "BarcodeScanned");
            });

            await Navigation.PushModalAsync(popupPage);
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            if (sender is Button button && button.BindingContext is Models.ItemCard itemCard)
            {
                await transferDataViewModel.OnChangeButtonClicked(itemCard);
            }
            else
            {
                Debug.WriteLine("BindingContext is not an ItemCard object.");
            }
        }

        private async void Button_Clicked_1(object sender, EventArgs e)
        {
            await transferDataViewModel.EditClicked(sender, e);
        }

        private async void Button_Clicked_2(object sender, EventArgs e)
        {
            await transferDataViewModel.PackingButton_Clicked(sender, e);
        }
    }
}