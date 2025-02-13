using store.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Messages
{
    public class ItemCardsUpdatedMessage
    {
        public List<ItemCheckBox> UpdatedItems { get; }

        public ItemCardsUpdatedMessage(List<ItemCheckBox> updatedItems)

        {

            UpdatedItems = updatedItems;

        }
    }
}
