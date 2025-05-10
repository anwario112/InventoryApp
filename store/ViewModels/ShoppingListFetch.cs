using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows.Input;

using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using store.Data;
using store.Models;
using store.Service;

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
        private readonly InvoiceDetailsEntity _invoiceDetailsEntity;
        private readonly InvoiceEntity _invoiceEntity;
        private readonly ItemCacheService _cacheService;
        private readonly CategoryEntity categoryEntity;
        private Category _selectedCategory;



        public int TotalPages { get; private set; }



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
            get => _displayedItems ?? (_displayedItems = new ObservableCollection<ItemFile>());
            set
            {
                if (_displayedItems != value)
                {
                    _displayedItems = value;
                    OnPropertyChanged();
                }
            }
        }

        private ObservableCollection<Category> _categoryItems;
        public ObservableCollection<Category> CategoryItems
        {
            get=> _categoryItems ?? (_categoryItems = new ObservableCollection<Category>());
            set
            {
                if( _categoryItems != value)
                {
                    _categoryItems = value;
                    OnPropertyChanged();
                }
            }
        }


        public Category SelectCategory
        {
            get => _selectedCategory;
            set
            {
                if (_selectedCategory != value)
                {
                    _selectedCategory = value;
                    OnPropertyChanged();
                    FilterItems();
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
            _categoryItems = new ObservableCollection<Category>();
            _itemQuantities = new Dictionary<string, int>();
            _userEntity = new UserEntity();
            _shoppingCardEntity = new ShoppingCardEntity();
            _invoiceDetailsEntity = new InvoiceDetailsEntity();
            _invoiceEntity = new InvoiceEntity();
            _cacheService = new ItemCacheService();
            categoryEntity = new CategoryEntity();

            _cacheService = ItemCacheService.Instance;
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

        public async Task FetchAllItems(bool forceRefresh = false)
        {
            try
            {
                if (!forceRefresh)
                {
                    var cachedItems = await Task.Run(() => _cacheService.GetCachedItems());
                    if (cachedItems != null && cachedItems.Count > 0)
                    {
                        Debug.WriteLine("Using cached data...");
                        AllItems = cachedItems;
                        _totalItems = cachedItems.Count;
                        OnPropertyChanged(nameof(TotalPages));
                        UpdateDisplayedItems();
                        return;
                    }
                }

                Debug.WriteLine("Fetching data from database...");
                var (items, totalItems) = await _itemFileEntity.GetAllItems(1, int.MaxValue).ConfigureAwait(false);
                if (items != null)
                {
                    _cacheService.UpdateCache(new ObservableCollection<ItemFile>(items));
                    AllItems = new ObservableCollection<ItemFile>(items);
                    _totalItems = totalItems;
                    OnPropertyChanged(nameof(TotalPages));
                    UpdateDisplayedItems();
                }
                else
                {
                    Debug.WriteLine("Fetched items were null.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"FetchAllItems ERROR: {ex.Message}\n{ex.StackTrace}");
            }
        }

        private void UpdateDisplayedItems()
        {
            if (AllItems == null || !AllItems.Any())
            {
                Debug.WriteLine("AllItems is null or empty.");
                return;
            }

            var startIndex = (_currentPage - 1) * _pageSize;
            var paginatedItems = AllItems.Skip(startIndex).Take(_pageSize).ToList();

            if (paginatedItems == null) return;

            DisplayedItems = new ObservableCollection<ItemFile>(paginatedItems);

         
            TotalPages = (_totalItems + _pageSize - 1) / _pageSize;
            OnPropertyChanged(nameof(TotalPages));

        
            (_previousPageCommand as Command)?.ChangeCanExecute();
            (_nextPageCommand as Command)?.ChangeCanExecute();

            Debug.WriteLine($"Updated Displayed Items: Page {CurrentPage} of {TotalPages}, Total Items: {_totalItems}");
        }


        public async Task DisplayCategories()
        {
            var categories = await categoryEntity.GetAllCategories();
            Debug.WriteLine($"Retrieved {categories?.Count} categories from database");
            categories.Insert(0, new Category { CategoryName = "All Categories" });
           
            CategoryItems = new ObservableCollection<Category>(categories);
            Debug.WriteLine($"CategoryItems now contains {CategoryItems.Count} items");
            SelectCategory = CategoryItems[0]; 
        }

        public void FilterByCategory(Category category)
        {
            SelectCategory = category;
        }




        // Update this method in your ShoppingListFetch.cs ViewModel

        private void FilterItems()
        {
            try
            {
                Debug.WriteLine($"Filtering with term: '{SearchTerm}' and category: '{SelectCategory?.CategoryName}'");

              
                var filteredByCategory = AllItems;

                if (SelectCategory != null && SelectCategory.CategoryName != "All Categories")
                {
                  
                    Debug.WriteLine($"Selected Category ID: {SelectCategory.CategoryID}, Name: {SelectCategory.CategoryName}");

                    foreach (var item in AllItems.Take(5))
                    {
                        Debug.WriteLine($"Item: {item.ItemName}, CategoryID: {item.ItemFileCategoryID}");
                    }

                 
                    filteredByCategory = new ObservableCollection<ItemFile>(
                        AllItems.Where(item => item.ItemFileCategoryID == SelectCategory.CategoryID)
                    );

                    Debug.WriteLine($"Filtered by category: Found {filteredByCategory.Count} items for category {SelectCategory.CategoryName}");
                }

             
                if (!string.IsNullOrWhiteSpace(SearchTerm))
                {
                    var matchingItems = new List<ItemFile>();

                    foreach (var item in filteredByCategory)
                    {
                        try
                        {
                            if (item.ItemName != null && item.ItemName.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase))
                            {
                                matchingItems.Add(item);
                            }
                        }
                        catch (Exception ex)
                        {
                            Debug.WriteLine($"Error filtering individual item: {ex.Message}");
                        }
                    }

                    _totalItems = matchingItems.Count;
                    CurrentPage = 1;

                    var paginatedItems = matchingItems
                        .Skip((_currentPage - 1) * _pageSize)
                        .Take(_pageSize)
                        .ToList();

                    DisplayedItems = new ObservableCollection<ItemFile>(paginatedItems);
                    Debug.WriteLine($"Found {matchingItems.Count} total items matching search criteria");
                }
                else
                {
                  
                    _totalItems = filteredByCategory.Count;

                    var paginatedItems = filteredByCategory
                        .Skip((_currentPage - 1) * _pageSize)
                        .Take(_pageSize)
                        .ToList();

                    DisplayedItems = new ObservableCollection<ItemFile>(paginatedItems);
                }

                TotalPages = (_totalItems + _pageSize - 1) / _pageSize;
                OnPropertyChanged(nameof(TotalPages));
                (_previousPageCommand as Command)?.ChangeCanExecute();
                (_nextPageCommand as Command)?.ChangeCanExecute();
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in FilterItems: {ex.Message}\n{ex.StackTrace}");
                UpdateDisplayedItems();
            }
        }
        public void FilterItemsAndRefresh()
        {
            FilterItems();
            OnPropertyChanged(nameof(DisplayedItems));
        }
        private void NotifyDisplayedItemsChanged()
        {
          
            OnPropertyChanged(nameof(ItemQuantities));
        }

        public void NotifyItemQuantityChanged(ItemFile item)
        {
           
            if (item != null)
            {
              
                OnPropertyChanged(nameof(ItemQuantities));

               
                var displayedItem = DisplayedItems.FirstOrDefault(i => i.ItemNum == item.ItemNum);
                if (displayedItem != null)
                {
                    int index = DisplayedItems.IndexOf(displayedItem);
                    if (index >= 0)
                    {
                     
                        DisplayedItems[index] = displayedItem;
                    }
                }
            }
        }
        private ICommand _previousPageCommand;
        public ICommand PreviousPageCommand
        {
            get
            {
                if (_previousPageCommand == null)
                {
                    _previousPageCommand = new Command(
                        execute: () => {
                            Debug.WriteLine($"Previous Page: Current Page = {CurrentPage}, Total Pages = {TotalPages}");
                            if (CurrentPage > 1)
                            {
                                CurrentPage--;
                                (_previousPageCommand as Command)?.ChangeCanExecute();
                                (_nextPageCommand as Command)?.ChangeCanExecute();
                            }
                        },
                        canExecute: () => CurrentPage > 1
                    );
                }
                return _previousPageCommand;
            }
        }

        private ICommand _nextPageCommand;
        public ICommand NextPageCommand
        {
            get
            {
                if (_nextPageCommand == null)
                {
                    _nextPageCommand = new Command(
                        execute: () => {
                            Debug.WriteLine($"Next Page: Current Page = {CurrentPage}, Total Pages = {TotalPages}");
                            if (CurrentPage < TotalPages)
                            {
                                CurrentPage++;
                                (_previousPageCommand as Command)?.ChangeCanExecute();
                                (_nextPageCommand as Command)?.ChangeCanExecute();
                            }
                        },
                        canExecute: () => CurrentPage < TotalPages
                    );
                }
                return _nextPageCommand;
            }
        }


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

               
                NotifyItemQuantityChanged(item);
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

                    NotifyItemQuantityChanged(item);
                }
            }
        });
        //private void NotifyDisplayedItemsChanged()
        //{

        //    var updatedItems = new ObservableCollection<ItemFile>(DisplayedItems);
        //    DisplayedItems = updatedItems;
        //}
        public int GetQuantityForItem(ItemFile item)
        {
            if (item != null && _itemQuantities.TryGetValue(item.ItemNum, out int quantity))
            {
                return quantity;
            }

            return 0; 

        }


        public async Task AddToShoppingCart(string username, string itemNum, string quantity, string unitPrice)
        {
            int userId = await _userEntity.FindUser(username) ?? 0;
            int? itemIDNullable = await _itemFileEntity.GetItemIdByItemNum(itemNum);
         
            if (!itemIDNullable.HasValue)
            {
                Debug.WriteLine($"Item with ItemNum '{itemNum}' not found.");
                return;
            }

            int itemID = itemIDNullable.Value;
            Debug.WriteLine($"Checking for existing cart item - UserID: {userId}, ItemID: {itemID}");
            var existingCartItem = await _shoppingCardEntity.GetShoppingCartItemByUser(userId, itemID);
            Debug.WriteLine($"Existing cart item found: {existingCartItem != null}");
            int countToShow = int.Parse(quantity);

            if (existingCartItem != null)
            {
                int newQuantity = int.Parse(existingCartItem.Quantity) + int.Parse(quantity);
                existingCartItem.Quantity = newQuantity.ToString();
                countToShow = newQuantity;
                decimal existingPrice = decimal.Parse(existingCartItem.Price);
                decimal newPrice = decimal.Parse(unitPrice);
                existingCartItem.Price = (existingPrice + newPrice).ToString("F2");

                await _shoppingCardEntity.UpdateData(existingCartItem);
                Debug.WriteLine($"Updated existing item in cart: ItemID: {existingCartItem.ItemID}, New Quantity: {existingCartItem.Quantity}, New Price: {existingCartItem.Price}, UserID: {existingCartItem.UserID}");
                Toast.Make($"Item has been updated to {countToShow}", ToastDuration.Long).Show();
            }
            else
            {
                var shoppingCartItem = new Models.ShoppingCard
                {
                    UserID = userId,
                    ItemID = itemID,
                    Quantity = quantity,
                    Price = unitPrice
                };
                countToShow = int.Parse(shoppingCartItem.Quantity);
                await _shoppingCardEntity.AddData(shoppingCartItem);

                Debug.WriteLine($"Inserted to cart: ItemID: {shoppingCartItem.ItemID}, Quantity: {shoppingCartItem.Quantity}, Total Price: {shoppingCartItem.Price}, UserID: {shoppingCartItem.UserID}");
                Toast.Make($"{countToShow} Item has been added", ToastDuration.Long).Show();
            }
            _itemQuantities[itemNum.Trim()] = 0;

            var affectItem = AllItems.FirstOrDefault(item => item.ItemNum == itemNum);
            if (affectItem != null) 
            {
                NotifyItemQuantityChanged(affectItem);
            }
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

        public async Task AddItemToInvoice(int invoiceNum, string itemNum, string quantity, string totalPrice)
        {
            Debug.WriteLine($"Received invoiceNum: {invoiceNum}");
          


            int? itemIDNullable = await _itemFileEntity.GetItemIdByItemNum(itemNum);
            if (!itemIDNullable.HasValue)
            {
                Debug.WriteLine($"Item with ItemNum '{itemNum}' not found.");
                return;
            }

            int itemID = itemIDNullable.Value;

            
            int? invoiceIDNullable = await _invoiceEntity.GetIdByInvoiceNum(invoiceNum);
            if (!invoiceIDNullable.HasValue)
            {
                Debug.WriteLine($"Invoice with InvoiceNum '{invoiceNum}' not found.");
                return;
            }

            int invoiceID = invoiceIDNullable.Value;

           
            var existingInvoiceDetail = await _invoiceDetailsEntity.GetInvoiceDetailsByItemIdAndInvoiceId(itemID, invoiceID);

            if (existingInvoiceDetail != null)
            {
               
                existingInvoiceDetail.Quantity = (int.Parse(existingInvoiceDetail.Quantity) + int.Parse(quantity)).ToString();
                existingInvoiceDetail.TotalNet = (decimal.Parse(existingInvoiceDetail.TotalNet) + decimal.Parse(totalPrice)).ToString();

                await _invoiceDetailsEntity.UpdateData(existingInvoiceDetail);
                Debug.WriteLine($"Updated existing item in Invoice ID: {invoiceID}, Item ID: {itemID}, New Quantity: {existingInvoiceDetail.Quantity}, New TotalNet: {existingInvoiceDetail.TotalNet}");
                Toast.Make("Item quantity updated in invoice", ToastDuration.Short).Show();
            }
            else
            {
                
                var price = await _itemFileEntity.GetPriceByItemId(itemID);

                var invoiceDetail = new InvoiceDetails
                {
                    InvoiceID = invoiceID,
                    ItemID = itemID,
                    Quantity = quantity,
                    Price = price,
                    TotalNet = totalPrice,
                };

                await _invoiceDetailsEntity.AddData(invoiceDetail);
                Debug.WriteLine($"Data successfully inserted for Invoice ID: {invoiceID}");
                Toast.Make("Item added to invoice", ToastDuration.Short).Show();
            }

           
            var total = await _invoiceDetailsEntity.GetTotalNetSumByInvoiceId(invoiceID);
            Debug.WriteLine($"The updated Total is {total}");

            var existingInvoice = await _invoiceEntity.GetById(invoiceID);
            if (existingInvoice != null)
            {
                existingInvoice.Total = total.ToString();
                await _invoiceEntity.UpdateData(existingInvoice);
                Debug.WriteLine($"Invoice updated: ID = {existingInvoice.ID}, Total = {existingInvoice.Total}");
            }
            else
            {
                Debug.WriteLine($"Invoice with ID {invoiceID} not found.");
            }

           // _cacheService.InvalidateCache();
        }


        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
