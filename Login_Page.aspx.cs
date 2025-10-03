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
    public partial class Login_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            string adminEmail = "admin@ecom.com";
            string adminPassword = "Admin@123";

            if (email == adminEmail && password == adminPassword)
            {
                // Redirect to admin page
                Response.Redirect("AdminPanel.aspx");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["SQL_SERVER"].ConnectionString;


            // Example using ADO.NET
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // Consider hashing in production

                conn.Open();
                int count = (int)cmd.ExecuteScalar();

                if (count == 1)
                {
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials.');</script>");
                }
            }

        }
    }
}