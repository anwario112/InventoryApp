using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows.Input;
using store.Data;
using store.Models;

namespace store.ViewModels
{
    public class ShoppingListFetch : INotifyPropertyChanged
    {
        private readonly ItemFileEntity _itemFileEntity;
        private ObservableCollection<ItemFile> _allItems; 
        private ObservableCollection<ItemFile> _displayedItems;
        private Dictionary<string, int> _itemQuantities;
        private readonly UserEntity _userEntity;
        private readonly ShoppingCardEntity _shoppingCardEntity;

        private int _currentPage = 1;
        private const int _pageSize = 20;
        private int _totalItems;
        private string _searchTerm;

        public ObservableCollection<ItemFile> AllItems
        {
            get => _allItems;
            set
            {
                if (_allItems != value)
                {
                    _allItems = value;
                    OnPropertyChanged();
                    FilterItems();
                }
            }
        }

        public ObservableCollection<ItemFile> DisplayedItems
        {
            get => _displayedItems;
            set
            {
                if (_displayedItems != value)
                {
                    _displayedItems = value;
                    OnPropertyChanged();
                }
            }
        }

        public string SearchTerm
        {
            get => _searchTerm;
            set
            {
                if (_searchTerm != value)
                {
                    _searchTerm = value;
                    OnPropertyChanged();
                    FilterItems();
                }
            }
        }

        public int CurrentPage
        {
            get => _currentPage;
            set
            {
                if (_currentPage != value)
                {
                    _currentPage = value;
                    OnPropertyChanged();
                    UpdateDisplayedItems();
                }
            }
        }

        public int TotalPages => (_totalItems + _pageSize - 1) / _pageSize;

        private int _shoppingCartCount;
        public int ShoppingCartCount
        {
            get => _shoppingCartCount;
            set
            {
                if (_shoppingCartCount != value)
                {
                   _shoppingCartCount = value;
                    OnPropertyChanged();
                }

            }

        }



        public ShoppingListFetch()
        {
            _itemFileEntity = new ItemFileEntity();
            _allItems = new ObservableCollection<ItemFile>();
            _displayedItems = new ObservableCollection<ItemFile>();
            _itemQuantities = new Dictionary<string, int>();
            _userEntity = new UserEntity();
            _shoppingCardEntity = new ShoppingCardEntity();

        }

        public Dictionary<string, int> ItemQuantities
        {
            get => _itemQuantities;
            set
            {
                if (_itemQuantities != value)
                {
                    _itemQuantities = value;
                    OnPropertyChanged();
                }
            }
        }

        public async Task FetchAllItems()
        {
            try
            {
                var (items, totalItems) = await _itemFileEntity.GetAllItems(1, int.MaxValue);

               

                AllItems = new ObservableCollection<ItemFile>(items);
                _totalItems = totalItems;
                OnPropertyChanged(nameof(TotalPages));
                UpdateDisplayedItems();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error fetching items: {ex.Message}");
            }
        }

        private void UpdateDisplayedItems()
        {
            var startIndex = (_currentPage - 1) * _pageSize;
            var paginatedItems = AllItems.Skip(startIndex).Take(_pageSize).ToList();
            DisplayedItems = new ObservableCollection<ItemFile>(paginatedItems);
        }

        private void FilterItems()
        {
            if (string.IsNullOrWhiteSpace(SearchTerm))
            {
                UpdateDisplayedItems();
            }
            else
            {
                var matchingItems = AllItems
                    .Where(item => item.ItemName.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase))
                    .ToList();
                DisplayedItems = new ObservableCollection<ItemFile>(matchingItems);
            }
        }

        public ICommand NextPageCommand => new Command(() =>
        {
            if (CurrentPage < TotalPages)
            {
                CurrentPage++;
                UpdateDisplayedItems();
            }
        });

        public ICommand PreviousPageCommand => new Command(() =>
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
                UpdateDisplayedItems();
            }
        });


        public ICommand MinusCommand => new Command(() =>
        {
            Debug.WriteLine("Minus button clicked from ViewModel!");
            
        });

        public ICommand PlusCommand => new Command(() =>
        {
            Debug.WriteLine("Plus button clicked from ViewModel!");
            
        });


        public ICommand IncreaseQuantityCommand => new Command<ItemFile>(item =>
        {
            if (item != null)
            {
                string key = item.ItemNum.Trim();
                if (_itemQuantities.ContainsKey(key))
                {
                    _itemQuantities[key]++;
                }
                else
                {
                    _itemQuantities[key] = 1;
                }
                Debug.WriteLine($"Increased quantity for {item.ItemName}. New quantity: {_itemQuantities[key]}");
                OnPropertyChanged(nameof(ItemQuantities));
                NotifyDisplayedItemsChanged();
            }
        });

        public ICommand DecreaseQuantityCommand => new Command<ItemFile>(item =>
        {
            if (item != null)
            {
                string key = item.ItemNum.Trim();
                if (_itemQuantities.ContainsKey(key) && _itemQuantities[key] > 0)
                {
                    _itemQuantities[key]--;
                    Debug.WriteLine($"Decreased quantity for {item.ItemName}. New quantity: {_itemQuantities[key]}");
                    OnPropertyChanged(nameof(ItemQuantities));
                    NotifyDisplayedItemsChanged();
                }
            }
        });

        private void NotifyDisplayedItemsChanged()
        {
           
            var updatedItems = new ObservableCollection<ItemFile>(DisplayedItems);
            DisplayedItems = updatedItems;
        }
        public int GetQuantityForItem(ItemFile item)
        {
            if (item != null && _itemQuantities.TryGetValue(item.ItemNum, out int quantity))
            {
                return quantity;
            }

            return 0; 

        }


        public async Task AddToShoppingCart(string username, string itemNum, string quantity, string totalPrice)
        {
            int userId = await _userEntity.FindUser(username) ?? 0;
            int? itemIDNullable = await _itemFileEntity.GetItemIdByItemNum(itemNum);

            if (!itemIDNullable.HasValue)
            {
                Debug.WriteLine($"Item with ItemNum '{itemNum}' not found.");
                return; 
            }

            int itemID = itemIDNullable.Value; 

            var shoppingCartItem = new Models.ShoppingCard
            {
                UserID = userId,
                ItemID = itemID,
                Quantity = quantity,
                Price = totalPrice
            };
            await _shoppingCardEntity.AddData(shoppingCartItem);
            
            Debug.WriteLine($"inserted to cart: {shoppingCartItem.ItemID}, Quantity: {shoppingCartItem.Quantity}, Total Price: {shoppingCartItem.Price},UserID:{shoppingCartItem.UserID}");
            await UpdateShoppingCartCount(username);
        }

        public async Task UpdateShoppingCartCount(string username)
        {
            var shoppingCartCount = await GetShoppingCartCount(username);
            ShoppingCartCount = shoppingCartCount;
        }
        public async Task<int> GetShoppingCartCount(string username)
        {
            int userId = await _userEntity.FindUser (username) ?? 0;
            var shoppingCartCount = await _shoppingCardEntity.GetShoppingCartCount(userId);
            return shoppingCartCount;
        }
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
