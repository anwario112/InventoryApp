using System;
using System.Globalization;

namespace store.Converters
{
    public class DateToRelativeTimeConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)

        {

            if (value is DateTime date)

            {

                var now = DateTime.Now;
                var difference = now - date;

                string relativeTime;

                if (difference.TotalDays < 1)
                {
                    relativeTime = "Today";
                }
                else if (difference.TotalDays < 2)
                {
                    relativeTime = "Yesterday";
                }
                else if (difference.TotalDays < 30)
                {
                   relativeTime = $"{(int)difference.TotalDays} days ago";
                }
                else if (difference.TotalDays < 365)
                {
                    var months = (int)(difference.TotalDays / 30);
                    relativeTime = $"{months} month{(months > 1 ? "s" : "")} ago";
                }
                else
                {
                    var years = (int)(difference.TotalDays / 365);
                    relativeTime = $"{years} year{(years > 1 ? "s" : "")} ago";
                }

                return $"Due {relativeTime}"; 
            }
            return value;
        }


        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}