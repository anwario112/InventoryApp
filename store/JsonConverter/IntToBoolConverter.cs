using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;

namespace store.JsonConverter
{
    public class IntToBoolConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int currentPage && parameter is string direction)
            {
              
                if (value is Tuple<int, int> pageInfo)
                {
                    currentPage = pageInfo.Item1;
                    int totalPages = pageInfo.Item2;

                    switch (direction)
                    {
                        case "prev":
                            return currentPage > 1;
                        case "next":
                            return currentPage < totalPages;
                        default:
                            return false;
                    }
                }

           
                switch (direction)
                {
                    case "prev":
                        return currentPage > 1;
                    default:
                        return false;
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