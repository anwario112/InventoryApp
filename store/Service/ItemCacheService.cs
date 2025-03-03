using store.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace store.Service
{
    public class ItemCacheService
    {
        private ObservableCollection<ItemFile> _cachedItems;
        private DateTime _lastFetchTime;
        private readonly TimeSpan _cacheDuration = TimeSpan.FromMinutes(10);

        public ObservableCollection<ItemFile> GetCachedItems()
        {
            if (_cachedItems != null && DateTime.Now - _lastFetchTime < _cacheDuration)
            {
                Debug.WriteLine("Cache hit: Returning cached items.");
                return _cachedItems;
            }
            Debug.WriteLine("Cache miss: No valid cached items.");
            return null;
        }

        public void UpdateCache(ObservableCollection<ItemFile> items)
        {
            _cachedItems = items;
            _lastFetchTime = DateTime.Now;
            Debug.WriteLine("Cache updated with new items.");
        }

        public void InvalidateCache()
        {
            _cachedItems = null;
            Debug.WriteLine("Cache invalidated.");
        }
    }
}
