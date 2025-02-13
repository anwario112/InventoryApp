using CommunityToolkit.Maui.Views;
using store.Data;
using store.Models;
using store.ViewModels;

namespace store.View;

public partial class RakPage : ContentPage
{
    private readonly RakEntity _rakEntity;
	public RakPage()
	{
		InitializeComponent();
        _rakEntity = new RakEntity();
        LoadRak();
    }

    private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {
        var rakEntity = new RakEntity();
        var viewModel = new RakInsertData(rakEntity); 
        var popup = new View.CreateFolder(viewModel);
        viewModel.RakCreated += ViewModel_RakCreated;
        this.ShowPopup(popup); 
    }



    private void ViewModel_RakCreated(Rak newRak)
    {
        var rakCard = new RakCard();
        rakCard.SetData(newRak);
        rakCard.RakDeleted += RakCard_RakDeleted;
        RakStackLayout.Children.Add(rakCard);
    }


    public async Task LoadRak()
    {
        List<Rak> raks = await _rakEntity.GetAllRaks();
        foreach (var rak in raks)
        {
            var rakCard = new RakCard();
            rakCard.SetData(rak);
            rakCard.RakDeleted += RakCard_RakDeleted;
            RakStackLayout.Children.Add(rakCard); 

        }
    }

    private async void RakCard_RakDeleted(object sender, int rakId)
    {
        var rakCardToRemove = RakStackLayout.Children.OfType<RakCard>().FirstOrDefault(card => card.RakID == rakId);

        if (rakCardToRemove != null)

        {
            RakStackLayout.Children.Remove(rakCardToRemove); 
        }
    }



}