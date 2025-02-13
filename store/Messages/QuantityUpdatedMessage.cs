using CommunityToolkit.Mvvm.Messaging.Messages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Messages
{
    public class QuantityUpdatedMessage : ValueChangedMessage<(int ID, int Quantity)>
    {
        public QuantityUpdatedMessage(int id, int quantity) : base((id, quantity)) { }
    }
}
