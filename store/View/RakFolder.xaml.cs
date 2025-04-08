using CommunityToolkit.Maui.Views;
using store.ViewModels;

namespace store.View;

public partial class RakFolder : Popup
{
    public enum InputType { RakName, SectionName }

    private readonly InventoryNoDataViewModel _viewModel;
    private readonly InputType _inputType;
    private readonly int _rakId;

    public RakFolder(InputType inputType, int rakId = 0)
    {
        InitializeComponent();
        _viewModel = new InventoryNoDataViewModel();
        _inputType = inputType;
        _rakId = rakId;
        BindingContext = _viewModel;

        ConfigureForInputType(inputType);
    }

    private void ConfigureForInputType(InputType inputType)
    {
        switch (inputType)
        {
            case InputType.RakName:
                TitleLabel.Text = "Create New Rak";
                NameEntry.Placeholder = "Enter Rak Name";
                _viewModel.EntryName = string.Empty;
                break;

            case InputType.SectionName:
                TitleLabel.Text = "Create New Section";
                NameEntry.Placeholder = $"Enter Section Name (Rak ID: {_rakId})";
                _viewModel.EntryName = string.Empty;
                break;
        }
    }

    private async void savedData(object sender, EventArgs e)
    {
        bool dataSaved = false;

        switch (_inputType)
        {
            case InputType.RakName:
                dataSaved = await _viewModel.SaveRakData();
                break;

            case InputType.SectionName:
                dataSaved = await _viewModel.SaveSectionData(_rakId);
                break;
        }

        if (dataSaved)
        {
            await CloseAsync(true);
        }
    }
}