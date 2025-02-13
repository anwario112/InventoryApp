using store.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.JsonConverter
{

    public class QuantityConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            if (values.Length == 2 && values[0] is ItemFile item && values[1] is Dictionary<string, int> quantities)
            {
                Debug.WriteLine($"ItemNum: {item.ItemNum}, Quantities: {string.Join(", ", quantities.Select(kvp => $"{kvp.Key}: {kvp.Value}"))}");

                if (quantities.TryGetValue(item.ItemNum.Trim(), out int quantity)) 
                {
                    Debug.WriteLine($"Quantity found: {quantity}");
                    return quantity.ToString();
                }
            }
            Debug.WriteLine("Quantity not found, returning 0");
            return "0";
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}

