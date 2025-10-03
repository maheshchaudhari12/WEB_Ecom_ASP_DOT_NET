using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB_Ecom_ASP_DOT_NET
{
    public partial class ProductTable : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["SQL_SERVER"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region Grid Binding and Data Retrieval

        /// <summary>
        /// Binds the GridView with all products from database
        /// </summary>
        private void BindGrid()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_GetAllProducts", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            gvProducts.DataSource = dt;
                            gvProducts.DataBind();

                            // Update stats if data exists
                            if (dt.Rows.Count > 0)
                            {
                                UpdateStatistics(dt);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error loading products: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Gets a single product by ID
        /// </summary>
        private DataTable GetProductById(int productId)
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_GetProductById", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductID", productId);

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error retrieving product: " + ex.Message, "danger");
            }

            return dt;
        }

        #endregion

        #region GridView Events

        /// <summary>
        /// Handles row editing - Opens modal with product data
        /// </summary>
        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                // Cancel the default edit mode
                e.Cancel = true;

                int productId = Convert.ToInt32(gvProducts.DataKeys[e.NewEditIndex].Value);
                DataTable dt = GetProductById(productId);

                if (dt.Rows.Count > 0)
                {
                    // Populate modal fields
                    hfProductID.Value = dt.Rows[0]["ProductID"].ToString();
                    txtEditName.Text = dt.Rows[0]["Name"].ToString();
                    txtEditImageUrl.Text = dt.Rows[0]["ImageUrl"].ToString();
                    txtEditDescription.Text = dt.Rows[0]["Description"].ToString();
                    txtEditPrice.Text = dt.Rows[0]["Price"].ToString();
                    txtEditCategory.Text = dt.Rows[0]["Category"].ToString();

                    // Show modal using Bootstrap 5
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal",
                        "var myModal = new bootstrap.Modal(document.getElementById('editModal')); myModal.show();",
                        true);
                }
                else
                {
                    ShowAlert("Product not found.", "warning");
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error opening edit form: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Handles row update (not used with modal approach)
        /// </summary>
        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // This event is not used since we're using modal for editing
            e.Cancel = true;
        }

        /// <summary>
        /// Handles cancel edit
        /// </summary>
        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            BindGrid();
        }

        /// <summary>
        /// Handles row deletion with confirmation
        /// </summary>
        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int productId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_DeleteProduct", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductID", productId);

                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowAlert("Product deleted successfully!", "success");
                        }
                        else
                        {
                            ShowAlert("Product could not be deleted.", "warning");
                        }
                    }
                }

                BindGrid();
            }
            catch (SqlException sqlEx)
            {
                // Check if it's a foreign key constraint error
                if (sqlEx.Number == 547)
                {
                    ShowAlert("Cannot delete this product because it's referenced in orders.", "danger");
                }
                else
                {
                    ShowAlert("Database error: " + sqlEx.Message, "danger");
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error deleting product: " + ex.Message, "danger");
            }
        }

        #endregion

        #region Update Product

        /// <summary>
        /// Handles the Update button click from modal
        /// </summary>
        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate inputs
                if (string.IsNullOrWhiteSpace(txtEditName.Text))
                {
                    ShowAlert("Product name is required.", "warning");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtEditPrice.Text) || !decimal.TryParse(txtEditPrice.Text, out decimal price))
                {
                    ShowAlert("Please enter a valid price.", "warning");
                    return;
                }

                if (price < 0)
                {
                    ShowAlert("Price cannot be negative.", "warning");
                    return;
                }

                int productId = Convert.ToInt32(hfProductID.Value);
                string name = txtEditName.Text.Trim();
                string imageUrl = txtEditImageUrl.Text.Trim();
                string description = txtEditDescription.Text.Trim();
                string category = txtEditCategory.Text.Trim();

                bool success = UpdateProductInDB(productId, name, imageUrl, description, price, category);

                if (success)
                {
                    ShowAlert("Product updated successfully!", "success");
                    BindGrid();

                    // Close modal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "closeModal",
                        "var myModal = bootstrap.Modal.getInstance(document.getElementById('editModal')); myModal.hide();",
                        true);
                }
                else
                {
                    ShowAlert("Failed to update product.", "danger");
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error updating product: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Updates product in database
        /// </summary>
        private bool UpdateProductInDB(int productId, string name, string imageUrl, string description, decimal price, string category)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_UpdateProduct", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@ProductID", productId);
                        cmd.Parameters.AddWithValue("@ProductName", name);
                        cmd.Parameters.AddWithValue("@ImageUrl", string.IsNullOrEmpty(imageUrl) ? DBNull.Value : (object)imageUrl);
                        cmd.Parameters.AddWithValue("@Description", string.IsNullOrEmpty(description) ? DBNull.Value : (object)description);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Category", string.IsNullOrEmpty(category) ? DBNull.Value : (object)category);

                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Database error: " + ex.Message, "danger");
                return false;
            }
        }

        #endregion

        #region Helper Methods

        /// <summary>
        /// Updates statistics cards on the page
        /// </summary>
        private void UpdateStatistics(DataTable dt)
        {
            try
            {
                int totalProducts = dt.Rows.Count;

                // Count unique categories
                DataView dv = new DataView(dt);
                DataTable distinctCategories = dv.ToTable(true, "Category");
                int totalCategories = distinctCategories.Rows.Count;

                // Calculate average price
                decimal totalPrice = 0;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["Price"] != DBNull.Value)
                    {
                        totalPrice += Convert.ToDecimal(row["Price"]);
                    }
                }
                decimal avgPrice = totalProducts > 0 ? totalPrice / totalProducts : 0;

                // Update UI with JavaScript
                string script = $@"
                    document.getElementById('totalProducts').textContent = '{totalProducts}';
                    document.getElementById('totalCategories').textContent = '{totalCategories}';
                    document.getElementById('avgPrice').textContent = '${avgPrice:F2}';
                ";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "updateStats", script, true);
            }
            catch (Exception ex)
            {
                // Silently fail for statistics - not critical
                System.Diagnostics.Debug.WriteLine("Statistics update failed: " + ex.Message);
            }
        }

        /// <summary>
        /// Displays Bootstrap alert message
        /// </summary>
        private void ShowAlert(string message, string type)
        {
            string alertHtml = $@"
                <div class='alert alert-{type} alert-dismissible fade show' role='alert'>
                    <strong>{(type == "success" ? "✓" : type == "danger" ? "✗" : "⚠")}</strong> {message}
                    <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                </div>";

            litAlert.Text = alertHtml;

            // Auto-hide success messages after 3 seconds
            if (type == "success")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideAlert",
                    "setTimeout(function(){ $('.alert').fadeOut(); }, 3000);",
                    true);
            }
        }

        #endregion
    }
}