using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.VisualBasic;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace DevMedia.ECommerce
{
    /// <summary>
    /// Class CartItem
    /// </summary>
    [Serializable]
    public class CartItem
    {
        //represent each of the items in your CartItem object. 
        private int _productID;
        private string _productName;
        private string _productImageUrl;
        private int _quantity;
        private double _price;
        

        public CartItem()
        {
        }

        public CartItem(int ProductID, string ProductName, string ProductImageUrl, int Quantity, double Price)
        {
            _productID = ProductID;
            _productName = ProductName;
            _productImageUrl = ProductImageUrl;
            _quantity = Quantity;
            _price = Price;
            
        }

        public int ProductID
        {
            get { return _productID; }
            set { _productID = value; }
        }

        public string ProductName
        {
            get { return _productName; }
            set { _productName = value; }
        }

        public string ProductImageUrl
        {
            get { return _productImageUrl; }
            set { _productImageUrl = value; }
        }

        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; }
        }

        public double Price
        {
            get { return _price; }
            set { _price = value; }
        }

        public double LineTotal
        {
            get { return _quantity*_price; }
        }
    }


    /// <summary>
    /// Class Cart
    /// </summary>
    [Serializable]
    public class Cart
    {
        private DateTime _dateCreated;
        private DateTime _lastUpdate;
        private List<CartItem> _items;

        public Cart()
        {
            if (_items == null)
            {
                _items = new List<CartItem>();
                _dateCreated = DateTime.Now;
            }
        }

        public List<CartItem> Items
        {
            get { return _items; }
            set { _items = value; }
        }


        public void Insert(int ProductID, double Price,
                           int Quantity, string ProductName,
                           string ProductImageUrl)
        {
            int ItemIndex = ItemIndexOfID(ProductID);
            if (ItemIndex == -1)
            {
                CartItem NewItem = new CartItem();
                NewItem.ProductID = ProductID;
                NewItem.Quantity = Quantity;
                NewItem.Price = Price;
                NewItem.ProductName = ProductName;
                NewItem.ProductImageUrl = ProductImageUrl;
                _items.Add(NewItem);
            }
            else
            {
                _items[ItemIndex].Quantity += 1;
            }
            _lastUpdate = DateTime.Now;
        }

        public void Update(int RowID, int ProductID, int Quantity, double Price)
        {
            CartItem Item = _items[RowID];
            Item.ProductID = ProductID;
            Item.Quantity = Quantity;
            Item.Price = Price;
            _lastUpdate = DateTime.Now;
        }

        public void DeleteItem(int rowID)
        {
            _items.RemoveAt(rowID);
            _lastUpdate = DateTime.Now;
        }

        private int ItemIndexOfID(int ProductID)
        {
            int index = 0;
            foreach (CartItem item in _items)
            {
                if (item.ProductID == ProductID)
                {
                    return index;
                }
                index += 1;
            }
            return -1;
        }

        public double Total
        {
            get
            {
                double t = 0;

                if (_items == null)
                {
                    return 0;
                }

                foreach (CartItem Item in _items)
                {
                    t += Item.LineTotal;
                }

                return t;
            }
        }
    }
}


