using CommunityToolkit.Maui.Views;
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

    private void CreateFolder_Opened(object? sender, EventArgs e)
    {
       
        FolderNameEntry.Focus();
    }
}
