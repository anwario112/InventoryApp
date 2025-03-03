using System;
using System.Globalization;


namespace store.JsonConverter
{
    public class ImageUrlToSourceConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string imageUrl = value as string;


            if (string.IsNullOrEmpty(imageUrl) || !Uri.IsWellFormedUriString(imageUrl, UriKind.Absolute))
            {
                return "gold.png";
            }
            return $"{imageUrl}.jpg";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}