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
    }


    private void ViewModel_SectionCreated(Section section)
    {
        Close();
    }
}