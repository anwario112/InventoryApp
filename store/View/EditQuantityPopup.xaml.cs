using CommunityToolkit.Maui.Views;
using store.Data;
using System.Diagnostics;
using CommunityToolkit.Mvvm.Messaging;
using store.Messages;

namespace store.View;

public partial class EditQuantityPopup : Popup
{
	public int ID { get; set; }
	private readonly ItemCardEntity itemCardEntity;
	public EditQuantityPopup(int id)
	{
		InitializeComponent();
		itemCardEntity = new ItemCardEntity();
		ID = id;
		Debug.WriteLine($"the id of the card to edit quantity:{ID}");

	}

    private async void EditQuantity(object sender, EventArgs e)
    {
        var quantity = QuantityField.Text;
        await itemCardEntity.UpdateQuantity(ID, quantity);
        Debug.WriteLine($"Sending QuantityUpdated message for ID: {ID}, Quantity: {quantity}");
        WeakReferenceMessenger.Default.Send(new QuantityUpdatedMessage(ID, int.Parse(quantity)));

        Close();
    }
}