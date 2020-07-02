using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;

namespace DevMedia.ECommerce
{

     ///<summary>
     ///Represents a product and methods for
     ///working with products
     ///</summary>
    [System.ComponentModel.DataObject]
     public class Product
    {
        private static readonly string _connectionString;

        private int _productId;
        private int _categoryId;
        private string _title;
        private string _description;
        private decimal _price;
        private string _imageurl;
        private string _categoryTitle;



        public int ProductID
        {
            get { return _productId; }
            set { _productId = value; }
        }

        public int CategoryID
        {
            get { return _categoryId; }
            set { _categoryId = value; }
        }

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public decimal Price
        {
            get { return _price; }
            set { _price = value; }
        }

        public string ImageURL
        {
            get { return _imageurl; }
            set { _imageurl = value; }
        }

         public string CategoryTitle
         {
             get { return _categoryTitle; }
             set { _categoryTitle = value; }
         }


         #region Methods
         /// <summary>
         /// Create a new product
         /// </summary>
         [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
         public static void Insert(int categoryId, string title,string description, decimal price , string imageURL)
         {
             // Initialize command
             SqlConnection con = new SqlConnection(_connectionString);
             SqlCommand cmd = new SqlCommand("dev_ProductInsert", con);
             cmd.CommandType = CommandType.StoredProcedure;

             // Initialize parameters
             cmd.Parameters.AddWithValue("@CategoryId", categoryId);
             cmd.Parameters.AddWithValue("@Title", title);
             cmd.Parameters.AddWithValue("@Description", description);
             cmd.Parameters.AddWithValue("@Price", price);
             cmd.Parameters.AddWithValue("@ImageURL", imageURL);

           
             using (con)
             {
                 con.Open();
                 cmd.ExecuteNonQuery();
             }
           
         }



         /// <summary>
         /// Delete an existing product
         /// </summary>
         [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
         public static void Delete(int ProductId)
         {
             // Initialize command
             SqlConnection con = new SqlConnection(_connectionString);
             SqlCommand cmd = new SqlCommand("dev_ProductDelete", con);
             cmd.CommandType = CommandType.StoredProcedure;

             // Initialize parameters
             cmd.Parameters.AddWithValue("@ProductId", ProductId);

             // Execute command
             using (con)
             {
                 con.Open();
                 cmd.ExecuteNonQuery();
             }
         }

         /// <summary>
         /// Update an existing product
         /// </summary>
         [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
         public static void Update(int productid, int categoryId, string title, decimal price, string description, string imageUrl)
         {
             Convert.ToDecimal(price);
             
             
             
             // Initialize command
             SqlConnection con = new SqlConnection(_connectionString);
             SqlCommand cmd = new SqlCommand("dev_ProductUpdate", con);
             cmd.CommandType = CommandType.StoredProcedure;

             // Initialize parameters
             cmd.Parameters.AddWithValue("@ProductID", productid);
             cmd.Parameters.AddWithValue("@CategoryID", categoryId);
             cmd.Parameters.AddWithValue("@Title", title);
             cmd.Parameters.AddWithValue("@Price", price);
             cmd.Parameters.AddWithValue("@Description", description);
             cmd.Parameters.AddWithValue("@ImageURL", imageUrl);

             // Execute command
             using (con)
             {
                 con.Open();
                 cmd.ExecuteNonQuery();
             }
         }


         /// <summary>
         /// Select all products from database
         /// </summary>
         [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
         public static List<Product> Select()
         {
             // Initialize command
             SqlConnection con = new SqlConnection(_connectionString);
             SqlCommand cmd = new SqlCommand("dev_SelectAllProduct", con);
             cmd.CommandType = CommandType.StoredProcedure;

             List<Product> results = new List<Product>();
             using (con)
             {
                 con.Open();
                 SqlDataReader reader = cmd.ExecuteReader();
                 while (reader.Read())
                     results.Add(new Product(reader));
             }
             return results;
         }

       

         /// <summary>
         ///  Select all products in a particular category
         /// </summary>
         [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
         public static List<Product> SelectByCategoryId(int categoryId)
         {
             //Initialize command
             SqlConnection con = new SqlConnection(_connectionString);
             SqlCommand cmd = new SqlCommand("dev_ProductSelectByCategoryId", con);
             cmd.CommandType = CommandType.StoredProcedure;

             // Add parameters
             cmd.Parameters.AddWithValue("@CategoryId", categoryId);

             List<Product> results = new List<Product>();
             using (con)
             {
                 con.Open();
                 SqlDataReader reader = cmd.ExecuteReader();
                 while (reader.Read())
                     results.Add(new Product(reader));
             }
             return results;
         }

         /// <summary>
         /// Select a single product by Id
         /// </summary>
         [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
         public static Product Select(int productId)
         {
             //Initialize command
             SqlConnection con = new SqlConnection(_connectionString);
             SqlCommand cmd = new SqlCommand("dev_ProductSelectById", con);
             cmd.CommandType = CommandType.StoredProcedure;

             // Add parameters
             cmd.Parameters.AddWithValue("@ProductId", productId);

             Product result = null;
             using (con)
             {
                 con.Open();
                 SqlDataReader reader = cmd.ExecuteReader();
                 if (reader.Read())
                     result = new Product(reader);
             }
             return result;
         }


         /// <summary>
         ///  Select all products random
         /// </summary>
         [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
         public static List<Product> SelectProductRandom()
         {
             //Initialize command
             SqlConnection con = new SqlConnection(_connectionString);
             SqlCommand cmd = new SqlCommand("dev_ProductRandom", con);
             cmd.CommandType = CommandType.StoredProcedure;

             List<Product> results = new List<Product>();
             using (con)
             {
                 con.Open();
                 SqlDataReader reader = cmd.ExecuteReader();
                 while (reader.Read())
                     results.Add(new Product(reader));
             }
             return results;
             
             
         }


       
#endregion


         /// <summary>
         /// Initializes a product from a DataReader
         /// </summary>
         /// <param name="reader"></param>
         public Product(SqlDataReader reader)
         {

             _productId = (int)reader["ProductID"];
             if (reader["CategoryId"] != DBNull.Value)
             _categoryId = (int)reader["CategoryID"];
             if (reader["CategoryTitle"] != DBNull.Value)
             _categoryTitle = (string)reader["CategoryTitle"];
             _title = (string)reader["Title"];
             _description = (string)reader["Description"];
             _price = (decimal)reader["Price"];
             _imageurl = (string)reader["ImageURL"];
         }

         /// <summary>
         /// Retrieve database connection string from Web configuration
         /// </summary>
         static Product()
         {
             _connectionString = WebConfigurationManager.ConnectionStrings["StoreString"].ConnectionString;
         }



     }
}