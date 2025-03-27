using System;
using System.Globalization;
using Microsoft.Maui.Controls;

namespace store.JsonConverter
{
    public class GreaterThanOneConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            try
            {
                if (value is int pageNumber)
                {
                    return pageNumber > 1;
                }
                return false;
            }
            catch (Exception)
            {
                return false; 
            }
        }
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

   
    
}