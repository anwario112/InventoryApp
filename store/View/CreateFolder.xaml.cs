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
    }

    private void ViewModel_RakCreated(Rak rak)
    {
        Close();
    }

    
    }




