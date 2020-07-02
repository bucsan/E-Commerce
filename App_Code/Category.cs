using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;


namespace DevMedia.ECommerce
{

    /// <summary>
    /// Represents a product category and 
    /// contains methods for working with categories
    /// </summary>
    [System.ComponentModel.DataObject]
    public class Category
    {
        private static readonly string _connectionString;

        private int _id;
        private string _title;

        public int CategoryId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }


        /// <summary>
        /// Initialize a category from a DataReader
        /// </summary>
        public Category(SqlDataReader reader)
        {
            _id = (int)reader["CategoryID"];
            _title = (string)reader["Title"];
        }

      
        
        /// <summary>
        /// Select all category from database
        /// </summary>

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static List<Category> SelectCategory()
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_SelectAllCategory", con);
            cmd.CommandType = CommandType.StoredProcedure;
            List<Category> results = new List<Category>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    results.Add(new Category(reader));
            }
            
            return results;
            
        }


         //<summary>
         //Create a new category
         //</summary>
         //<param name="parentId"></param>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public static void Insert(string title)
        {
             //Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_CategoryInsert ", con);
            cmd.CommandType = CommandType.StoredProcedure;

             //Initialize parameters
            cmd.Parameters.AddWithValue("@Title", title);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }


        /// <summary>
        /// Update an existing category
        /// </summary>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public static void Update(int CategoryId, string title)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_CategoryUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@Id", CategoryId);
            cmd.Parameters.AddWithValue("@Title", title);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }


        /// <summary>
        /// Select a Category by Category Id
        /// </summary>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public static Category SelectById(int CategoryId)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_CategorySelect", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@Id", CategoryId);

            Category result = null;
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                    result = new Category(reader);
            }
            return result;
        }
        
        
        
        
        
       

       

        
        /// <summary>
        /// Delete a category
        /// </summary>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public static void DeleteCat(int CategoryId)
        {
            // Initialize command
            SqlConnection con = new SqlConnection(_connectionString);
            SqlCommand cmd = new SqlCommand("dev_CategoryDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Initialize parameters
            cmd.Parameters.AddWithValue("@CategoryId", CategoryId);
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

       

        /// <summary>
        /// Load the database connection string from Web configuration
        /// </summary>
        static Category()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["StoreString"].ConnectionString;
        }
    }
}