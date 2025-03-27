using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;

namespace store.JsonConverter
{
    public class LessThanTotalPagesConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int currentPage)
            {
                
                if (parameter is BindableObject bindable &&
                    bindable.BindingContext is ViewModels.ShoppingListFetch viewModel)
                {
                    var totalPages = viewModel.TotalPages;
                    return currentPage < totalPages;
                }
            }
            return false;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}