﻿using store.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Observation
{
    public static class ObservableCollectionExtensions
    {
       


        public static void AddRange<T>(this ObservableCollection<T> collection, IEnumerable<T> items)
        {

            foreach (var item in items)
            {

                collection.Add(item);

            }

        }

    }
}
