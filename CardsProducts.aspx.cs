using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;

namespace WEB_Ecom_ASP_DOT_NET
{
    public partial class CardsProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Enable PageMethods
                ScriptManager sm = ScriptManager.GetCurrent(this.Page);
                if (sm != null)
                {
                    sm.EnablePageMethods = true;
                }
            }
        }

        // Product class to hold data
        public class Product
        {
            public int ProductId { get; set; }
            public string Name { get; set; }
            public string ImageUrl { get; set; }
            public string Description { get; set; }
            public decimal Price { get; set; }
        }

        // Method to fetch products from database
        protected List<Product> GetProducts()
        {
            List<Product> products = new List<Product>();
            string connString = ConfigurationManager.ConnectionStrings["SQL_SERVER"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT ProductId, Name, ImageUrl, Description, Price FROM ProductCards";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        products.Add(new Product
                        {
                            ProductId = Convert.ToInt32(reader["ProductId"]),
                            Name = reader["Name"].ToString(),
                            ImageUrl = reader["ImageUrl"].ToString(),
                            Description = reader["Description"].ToString(),
                            Price = Convert.ToDecimal(reader["Price"])
                        });
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Log error
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                }
            }

            return products;
        }

        // WebMethod to add product to cart
        [WebMethod]
        public static bool AddToCart(int productId)
        {
            try
            {
                // Get or create shopping cart from session
                if (System.Web.HttpContext.Current.Session["Cart"] == null)
                {
                    System.Web.HttpContext.Current.Session["Cart"] = new Dictionary<int, int>();
                }

                Dictionary<int, int> cart = (Dictionary<int, int>)System.Web.HttpContext.Current.Session["Cart"];

                // Add or update quantity
                if (cart.ContainsKey(productId))
                {
                    cart[productId]++;
                }
                else
                {
                    cart[productId] = 1;
                }

                System.Web.HttpContext.Current.Session["Cart"] = cart;
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}