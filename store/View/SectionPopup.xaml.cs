using CommunityToolkit.Maui.Views;
using store.Models;
using store.ViewModels;

namespace store.View;

public partial class SectionPopup : Popup
{
    public event EventHandler? SectionCreated;

    public SectionPopup(SectionInsertData viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
        viewModel.SectionCreated += ViewModel_SectionCreated;

        this.Opened += SectionPopup_Opened;
    }

    private void ViewModel_SectionCreated(Section section)
    {
        Close();
    }

    private async void SectionPopup_Opened(object? sender, EventArgs e)
    {
      
        FolderNameEntry.Focus();

        
        await Task.Delay(100);

        try
        {
           
            if (FolderNameEntry.Handler != null)
            {
                await FolderNameEntry.ShowSoftInputAsync(System.Threading.CancellationToken.None);
            }
        }
        catch (Exception ex)
        {
          
            System.Diagnostics.Debug.WriteLine($"Error showing keyboard: {ex.Message}");
        }
    }
}