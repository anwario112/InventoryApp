using System;
using System.Globalization;
using Microsoft.Maui.Controls;

namespace store.JsonConverter
{
    public class FullNameConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is string firstName && parameter is string lastName)
            {
           
                if (string.IsNullOrWhiteSpace(firstName) && string.IsNullOrWhiteSpace(lastName))
                    return "Unknown Name";

                return $"{firstName} {lastName}".Trim();
            }

            return "Invalid Name";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}