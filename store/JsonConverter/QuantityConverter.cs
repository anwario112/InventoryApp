using System;
using System.Collections.Generic;
using System.Globalization;
using Microsoft.Maui.Controls;
using store.Models;
using store.ViewModels;
using System.Diagnostics;

namespace store.JsonConverter
{
    public class QuantityConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            try
            {
              
                if (values == null || values.Length != 2 || values[0] == null || values[1] == null)
                {
                    Debug.WriteLine("QuantityConverter: Invalid input values.");
                    return "0";
                }

              
                var item = values[0] as ItemFile;
                var itemQuantities = values[1] as Dictionary<string, int>;

               
                if (item == null || itemQuantities == null)
                {
                    Debug.WriteLine("QuantityConverter: Item or itemQuantities is null.");
                    return "0";
                }

                string key = item.ItemNum?.Trim();
                if (string.IsNullOrEmpty(key))
                {
                    Debug.WriteLine("QuantityConverter: ItemNum is null or empty.");
                    return "0";
                }

                if (itemQuantities.TryGetValue(key, out int quantity))
                {
                    return quantity.ToString(culture);
                }

                return "0";
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"QuantityConverter: An error occurred: {ex.Message}");
                return "0";
            }
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}