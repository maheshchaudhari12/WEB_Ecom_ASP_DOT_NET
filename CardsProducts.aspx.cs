using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB_Ecom_ASP_DOT_NET
{
    public partial class CardsProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
                UpdateCartCount();
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

        // Load products into repeater
        private void LoadProducts()
        {
            List<Product> products = GetProducts();
            ProductRepeater.DataSource = products;
            ProductRepeater.DataBind();
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
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
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
                    }
                }
                catch (Exception ex)
                {
                    // Log error
                    System.Diagnostics.Debug.WriteLine("Error loading products: " + ex.Message);
                }
            }

            return products;
        }

        // Handle Add to Cart button click
        protected void ProductRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                AddToCart(productId);

                // Show success message
                SuccessMessage.Visible = true;

                // Update cart count
                UpdateCartCount();

                // Reload products to maintain state
                LoadProducts();
            }
        }

        // Add product to cart
        private void AddToCart(int productId)
        {
            try
            {
                // Get or create shopping cart from session
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new Dictionary<int, int>();
                }

                Dictionary<int, int> cart = (Dictionary<int, int>)Session["Cart"];

                // Add or update quantity
                if (cart.ContainsKey(productId))
                {
                    cart[productId]++;
                }
                else
                {
                    cart[productId] = 1;
                }

                Session["Cart"] = cart;
            }
            catch (Exception ex)
            {
                // Log the error
                System.Diagnostics.Debug.WriteLine("AddToCart Error: " + ex.Message);
            }
        }

        // Update cart item count display
        private void UpdateCartCount()
        {
            int totalItems = 0;

            if (Session["Cart"] != null)
            {
                Dictionary<int, int> cart = (Dictionary<int, int>)Session["Cart"];
                foreach (var item in cart)
                {
                    totalItems += item.Value;
                }
            }

            CartCountLabel.Text = totalItems.ToString();
        }
    }
}