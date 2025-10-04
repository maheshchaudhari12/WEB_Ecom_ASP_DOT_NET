using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB_Ecom_ASP_DOT_NET
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
            }
        }

        private void LoadCartItems()
        {
            var cart = Session["Cart"] as Dictionary<int, int>;

            if (cart == null || cart.Count == 0)
            {
                // Show empty cart message
                EmptyCartPanel.Visible = true;
                CartItemsPanel.Visible = false;
                return;
            }

            // Hide empty cart message and show cart items
            EmptyCartPanel.Visible = false;
            CartItemsPanel.Visible = true;

            string connString = ConfigurationManager.ConnectionStrings["SQL_SERVER"].ConnectionString;
            List<CartItem> items = new List<CartItem>();
            decimal total = 0;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();

                    foreach (var entry in cart)
                    {
                        int productId = entry.Key;
                        int quantity = entry.Value;

                        string query = "SELECT Name, Price FROM ProductCards WHERE ProductId = @ProductId";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@ProductId", productId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string name = reader["Name"].ToString();
                                decimal price = Convert.ToDecimal(reader["Price"]);
                                decimal totalPrice = price * quantity;

                                items.Add(new CartItem
                                {
                                    ProductId = productId,
                                    Name = name,
                                    Price = price,
                                    Quantity = quantity,
                                    TotalPrice = totalPrice
                                });

                                total += totalPrice;
                            }
                        }
                    }

                    CartRepeater.DataSource = items;
                    CartRepeater.DataBind();
                    TotalLabel.Text = total.ToString("F2");
                }
                catch (Exception ex)
                {
                    // Log error
                    System.Diagnostics.Debug.WriteLine("LoadCartItems Error: " + ex.Message);
                    ShowMessage("Error loading cart items. Please try again.", false);
                }
            }
        }

        // Handle cart item commands (Increase, Decrease, Remove)
        protected void CartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            var cart = Session["Cart"] as Dictionary<int, int>;

            if (cart == null)
            {
                return;
            }

            switch (e.CommandName)
            {
                case "Increase":
                    if (cart.ContainsKey(productId))
                    {
                        cart[productId]++;
                        Session["Cart"] = cart;
                        ShowMessage("Quantity increased", true);
                    }
                    break;

                case "Decrease":
                    if (cart.ContainsKey(productId))
                    {
                        if (cart[productId] > 1)
                        {
                            cart[productId]--;
                            Session["Cart"] = cart;
                            ShowMessage("Quantity decreased", true);
                        }
                        else
                        {
                            // If quantity is 1, remove the item
                            cart.Remove(productId);
                            Session["Cart"] = cart;
                            ShowMessage("Item removed from cart", true);
                        }
                    }
                    break;

                case "Remove":
                    if (cart.ContainsKey(productId))
                    {
                        cart.Remove(productId);
                        Session["Cart"] = cart;
                        ShowMessage("Item removed from cart", true);
                    }
                    break;
            }

            // Reload cart
            LoadCartItems();
        }

        // Show success/error message
        private void ShowMessage(string message, bool isSuccess)
        {
            SuccessLabel.Text = isSuccess ? "✓ " + message : "✗ " + message;
            SuccessMessage.Visible = true;
            SuccessMessage.CssClass = isSuccess ? "success-message" : "error-message";
        }

        // Cart item class
        public class CartItem
        {
            public int ProductId { get; set; }
            public string Name { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
            public decimal TotalPrice { get; set; }
        }
    }
}