using ZXing.Net.Maui.Controls;
using ZXing.Net.Maui;

namespace store.View
{
    public partial class CameraPopupPage : ContentPage
    {
        public CameraPopupPage(CameraBarcodeReaderView cameraView)
        {
            InitializeComponent();
            this.cameraView = cameraView;
            Content = new Grid
            {
                Children = { cameraView }
            };

            // Subscribe to barcode detection events
            cameraView.BarcodesDetected += OnBarcodesDetected;
        }

        private void OnBarcodesDetected(object sender, BarcodeDetectionEventArgs e)
        {
            var barcode = e.Results.FirstOrDefault();
            if (barcode != null)
            {
                // Send the barcode value back to the TransferData page
                MessagingCenter.Send(this, "BarcodeScanned", barcode.Value);

                // Close the popup page
                Navigation.PopModalAsync();
            }
        }

        private void OnCloseButtonClicked(object sender, EventArgs e)
        {
            Navigation.PopModalAsync();
        }
    }
}