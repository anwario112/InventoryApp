using System.Diagnostics;
using CommunityToolkit.Maui.Views;
using store.Api;
using Microsoft.Maui.Storage; 
using System.ComponentModel;
using System.Runtime.CompilerServices;
using store.ViewModels;

namespace store.View;

public partial class Settings : ContentPage, INotifyPropertyChanged
{
    private readonly SettingsClearData viewModel;
    private readonly InsertDataApi _insertDataApi;

    private bool _quantityPopupPreference;
    private bool _mergeQuantityPreference;

    public bool QuantityPopupPreference
    {
        get
        {
            Debug.WriteLine($"Getting QuantityPopupPreference: {_quantityPopupPreference}");
            return _quantityPopupPreference;
        }
        set
        {
            if (_quantityPopupPreference != value)
            {
                Debug.WriteLine($"Setting QuantityPopupPreference to: {value}");
                _quantityPopupPreference = value;
                OnPropertyChanged();

             
                Preferences.Set("QuantityPopupPreference", value);
            }
        }
    }

    public bool MergeQuantityPreference
    {
        get
        {
            Debug.WriteLine($"Getting MergeQuantityPreference: {_mergeQuantityPreference}");
            return _mergeQuantityPreference;
        }
        set
        {
            if (_mergeQuantityPreference != value)
            {
                Debug.WriteLine($"Setting MergeQuantityPreference to: {value}");
                _mergeQuantityPreference = value;
                OnPropertyChanged();

              
                Preferences.Set("MergeQuantityPreference", value);
            }
        }
    }

    public Settings()
    {
        InitializeComponent();

       
        _quantityPopupPreference = Preferences.Get("QuantityPopupPreference", false);
        _mergeQuantityPreference = Preferences.Get("MergeQuantityPreference", false); 

        Debug.WriteLine($"Restored QuantityPopupPreference: {_quantityPopupPreference}");
        Debug.WriteLine($"Restored MergeQuantityPreference: {_mergeQuantityPreference}");

        
        BindingContext = this;
        Debug.WriteLine("BindingContext set to this page.");

        var httpHelper = new HttpHelper("12345-ABCDE-67890-FGHIJ", "S3cr3tK3y!@#2023");
        _insertDataApi = new InsertDataApi(httpHelper);
    }

    public event PropertyChangedEventHandler PropertyChanged;

    protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
    {
        Debug.WriteLine($"PropertyChanged raised for: {propertyName}");
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

    private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {
        this.ShowPopup(new View.ConnectionBox());
    }

    private async void AddUserTap(object sender, TappedEventArgs e)
    {
        this.ShowPopup(new View.AddUserPopup());
    }

    private async void archiveTap(object sender, TappedEventArgs e)
    {
        await Navigation.PushAsync(new View.ItemCardArchive());
    }

    private async void clearDataTap(object sender, TappedEventArgs e)
    {
        this.ShowPopup(new ClearDataPopup(viewModel, "Settings"));
    }

    private async void ImportData(object sender, TappedEventArgs e)
    {
        LoadingIndicator.IsVisible = true;
        LoadingCompleteLabel.IsVisible = true;
        await _insertDataApi.InsertApiData();

        LoadingIndicator.IsVisible = false;
        LoadingCompleteLabel.IsVisible = false;
    }

    private async void ExportCards(object sender, TappedEventArgs e)
    {
        Navigation.PushAsync(new View.ExportPage());
    }
}