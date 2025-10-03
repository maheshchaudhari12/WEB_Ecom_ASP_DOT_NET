using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB_Ecom_ASP_DOT_NET
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string imageUrl = txtImageUrl.Text;
            string description = txtDescription.Text;
            decimal price = decimal.Parse(txtPrice.Text);
            string category = ddlCategory.SelectedValue;

            string connectionString = ConfigurationManager.ConnectionStrings["SQL_SERVER"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO ProductCards (Name, ImageUrl, Description, Price, Category) VALUES (@Name, @ImageUrl, @Description, @Price, @Category)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Category", category);

                con.Open();
                int inserted = cmd.ExecuteNonQuery();

                if (inserted > 0)
                {
                    litAlert.Text = @"<div class='alert alert-success alert-dismissible fade show' role='alert'>
                            <strong>Success!</strong> Data saved successfully
                            <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                          </div>";
                }


                // Optional: Clear form or show success message
                txtName.Text = "";
                txtImageUrl.Text = "";
                txtDescription.Text = "";
                txtPrice.Text = "";
                ddlCategory.SelectedIndex = 0;
            }
        }
    }
}