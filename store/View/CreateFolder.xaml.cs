using CommunityToolkit.Maui.Views;
using Microsoft.Maui;
using store.Models;
using store.ViewModels;

namespace store.View;

public partial class CreateFolder : Popup
{
    public event EventHandler? RakCreated;

    public CreateFolder(RakInsertData viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
        viewModel.RakCreated += ViewModel_RakCreated;

        this.Opened += CreateFolder_Opened;
    }

    private void ViewModel_RakCreated(Rak rak)
    {
        Close();
    }

    private async void CreateFolder_Opened(object? sender, EventArgs e)
    {
       
        FolderNameEntry.Focus();

      
        await Task.Delay(100);

        try
        {
        
            await FolderNameEntry.ShowSoftInputAsync(System.Threading.CancellationToken.None);
        }
        catch (Exception ex)
        {
           
            System.Diagnostics.Debug.WriteLine($"Error showing keyboard: {ex.Message}");
        }
    }
}