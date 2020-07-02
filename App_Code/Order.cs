using System;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;

namespace DevMedia.ECommerce
{
    /// <summary>
    /// Represents a custom order and methods for 
    /// working with orders
    /// </summary>
    public class Order
    {
        private static readonly string _connectionString;

        private int _orderid;
        private string _userName;
        private string _ccName;
        private CreditCardType _ccType;
        private string _ccNumber;
        private int _ccExpiryMonth;
        private int _ccExpiryYear;
        private string _billingStreet;
        private string _billingCity;
        private string _billingState;
        private string _billingPostalCode;
        private string _billingCountry;
        private string _email;
        private string _shippingStreet;
        private string _shippingCity;
        private string _shippingState;
        private string _shippingPostalCode;
        private string _shippingCountry;
        private DateTime _entryDate;


        public int OrderId
        {
            get { return _orderid; }
        }

        public string UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }


        public string CCName
        {
            get { return _ccName; }
            set { _ccName = value; }
        }


        public CreditCardType CCType
        {
            get { return _ccType; }
            set { _ccType = value; }
        }


        public string CCNumber
        {
            get { return _ccNumber; }
            set { _ccNumber = value; }
        }


        public int CCExpiryMonth
        {
            get { return _ccExpiryMonth; }
            set { _ccExpiryMonth = value; }
        }


        public int CCExpiryYear
        {
            get { return _ccExpiryYear; }
            set { _ccExpiryYear = value; }
        }


        public string BillingStreet
        {
            get { return _billingStreet; }
            set { _billingStreet = value; }
        }


        public string BillingCity
        {
            get { return _billingCity; }
            set { _billingCity = value; }
        }


        public string BillingState
        {
            get { return _billingState; }
            set { _billingState = value; }
        }


        public string BillingPostalCode
        {
            get { return _billingPostalCode; }
            set { _billingPostalCode = value; }
        }


        public string BillingCountry
        {
            get { return _billingCountry; }
            set { _billingCountry = value; }
        }

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }


        public string ShippingStreet
        {
            get { return _shippingStreet; }
            set { _shippingStreet = value; }
        }


        public string ShippingCity
        {
            get { return _shippingCity; }
            set { _shippingCity = value; }
        }


        public string ShippingState
        {
            get { return _shippingState; }
            set { _shippingState = value; }
        }


        public string ShippingPostalCode
        {
            get { return _shippingPostalCode; }
            set { _shippingPostalCode = value; }
        }


        public string ShippingCountry
        {
            get { return _shippingCountry; }
            set { _shippingCountry = value; }
        }


        public DateTime EntryDate
        {
            get { return _entryDate; }
        }

        /// <summary>
        /// Retrieve all customer orders from database
        /// </summary>
        public static List<Order> SelectAll()
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_OrderSelectAll", con);
            cmd.CommandType = CommandType.StoredProcedure;

            List<Order> results = new List<Order>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    results.Add(new Order(reader));
            }
            return results;
        }

        /// <summary>
        /// Select an order by order Id from
        /// the database
        /// </summary>
        public static Order Select(int orderid)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_OrderSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@OrderId", orderid);

            Order result = null;
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                    result = new Order(reader);
            }
            return result;
        }

        /// <summary>
        /// Select all order items associated with an order
        /// </summary>
        public static List<OrderItem> SelectOrderItems(int orderId)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_OrderSelectOrderItems", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@OrderId", orderId);

            List<OrderItem> results = new List<OrderItem>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    results.Add(new OrderItem(reader));
            }
            return results;
        }

        /// <summary>
        /// Submits a shopping cart and converts
        /// the cart items into order items.
        /// </summary>
        public int Submit()
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_OrderSubmit", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@UserName", _userName);
            cmd.Parameters.AddWithValue("@CCName", _ccName);
            cmd.Parameters.AddWithValue("@CCType", _ccType);
            cmd.Parameters.AddWithValue("@CCNumber_Encrypted", Secret.Encrypt(_ccNumber));
            cmd.Parameters.AddWithValue("@CCExpiryMonth", _ccExpiryMonth);
            cmd.Parameters.AddWithValue("@CCExpiryYear", _ccExpiryYear);

            cmd.Parameters.AddWithValue("@BillingStreet", _billingStreet);
            cmd.Parameters.AddWithValue("@BillingCity", _billingCity);
            cmd.Parameters.AddWithValue("@BillingState", _billingState);
            cmd.Parameters.AddWithValue("@BillingPostalCode", _billingPostalCode);
            cmd.Parameters.AddWithValue("@BillingCountry", _billingCountry);
            cmd.Parameters.AddWithValue("@Email", _email);

            cmd.Parameters.AddWithValue("@ShippingStreet", _shippingStreet);
            cmd.Parameters.AddWithValue("@ShippingCity", _shippingCity);
            cmd.Parameters.AddWithValue("@ShippingState", _shippingState);
            cmd.Parameters.AddWithValue("@ShippingPostalCode", _shippingPostalCode);
            cmd.Parameters.AddWithValue("@ShippingCountry", _shippingCountry);

            // Execute command
            int result;
            using (con)
            {
                con.Open();
                result = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            return result;
        }



        public static void submitOrderItem(int orderId, int productId, double price, int quantity)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_OrderItemSubmit", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@OrderID", orderId);
            cmd.Parameters.AddWithValue("@ProductID", productId);
            cmd.Parameters.AddWithValue("@Price", price);
            cmd.Parameters.AddWithValue("@Quantity", quantity);

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }


        /// <summary>
        /// Initialize an order from a DataReader
        /// </summary>
        public Order(SqlDataReader reader)
        {
            _orderid = (int) reader["OrderId"];
            _userName = (string) reader["UserName"];
            _ccName = (string) reader["CCName"];
            _ccType = (CreditCardType) reader["CCType"];
            _ccNumber = Secret.Decrypt((byte[]) reader["CCNumber_Encrypted"]);
            _ccExpiryMonth = (int) reader["CCExpiryMonth"];
            _ccExpiryYear = (int) reader["CCExpiryYear"];
            _billingStreet = (string) reader["BillingStreet"];
            _billingCity = (string) reader["BillingCity"];
            _billingState = (string) reader["BillingState"];
            _billingPostalCode = (string) reader["BillingPostalCode"];
            _billingCountry = (string) reader["BillingCountry"];
            _email = (string) reader["Email"];
            _shippingStreet = (string) reader["ShippingStreet"];
            _shippingCity = (string) reader["ShippingCity"];
            _shippingState = (string) reader["ShippingState"];
            _shippingPostalCode = (string) reader["ShippingPostalCode"];
            _shippingCountry = (string) reader["ShippingCountry"];
            _entryDate = (DateTime) reader["EntryDate"];
        }


        public Order()
        {
        }

        /// <summary>
        /// Retrieve database connection string from Web configuration
        /// </summary>
        static Order()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["StoreString"].ConnectionString;
        }
    }


    /// <summary>
    /// Represents an individual order item. There is
    /// a one-to-one correspondence between shopping
    /// cart items and order items
    /// </summary>
    public class OrderItem
    {
        

        private int _id;
        private string _name;
        private decimal _price;
        private int _quantity;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }


        public decimal Price
        {
            get { return _price; }
            set { _price = value; }
        }

        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; }
        }

        public OrderItem(SqlDataReader reader)
        {
            _id = (int)reader["OrderItemsID"];
            _name = (string) reader["Title"];
            _price = (decimal) reader["Price"];
            _quantity = (int) reader["Quantity"];
        }
      
    }



}