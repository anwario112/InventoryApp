using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Globalization;
using Microsoft.Maui.Controls;

namespace store.JsonConverter
{
    public class StringInListConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            try
            {
                if (value == null || parameter == null)
                {
                    Debug.WriteLine("StringInListConverter: value or parameter is null");
                    return false;
                }

                string stringToCheck = value.ToString();
                Debug.WriteLine($"StringInListConverter: Checking if '{stringToCheck}' is in list");

             
                if (parameter is ObservableCollection<string> strings)
                {
                    bool result = strings.Contains(stringToCheck);
                    Debug.WriteLine($"StringInListConverter: Result = {result}");
                    return result;
                }
                else if (parameter is IEnumerable<string> stringList)
                {
                    bool result = false;
                    foreach (var item in stringList)
                    {
                        if (item == stringToCheck)
                        {
                            result = true;
                            break;
                        }
                    }
                    Debug.WriteLine($"StringInListConverter: Result = {result}");
                    return result;
                }
                else if (parameter is Dictionary<string, bool> dict)
                {
                    bool result = dict.ContainsKey(stringToCheck) && dict[stringToCheck];
                    Debug.WriteLine($"StringInListConverter: Dictionary result = {result}");
                    return result;
                }

                Debug.WriteLine($"StringInListConverter: Parameter is of unsupported type: {parameter.GetType().Name}");
                return false;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"StringInListConverter exception: {ex.Message}");
                return false;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}