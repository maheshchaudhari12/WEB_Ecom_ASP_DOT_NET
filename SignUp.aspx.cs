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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text;
                string confirmPassword = txtConfirmPassword.Text;
                string phone = txtPhone.Text.Trim();
                string altPhone = txtAltPhone.Text.Trim();
                string address = txtAddress.Text.Trim();
                string city = txtCity.Text.Trim();
                string state = txtState.Text.Trim();
                string postal = txtPostal.Text.Trim();
                string country = ddlCountry.SelectedValue;
                string gender = ddlGender.SelectedValue;
                string dob = txtDOB.Text;

                string connectionString = ConfigurationManager.ConnectionStrings["SQL_SERVER"].ConnectionString;

                string query = @"INSERT INTO Users 
                         (Name, Email, Password, Phone, AltPhone, Address, City, State, PostalCode, Country, Gender, DOB) 
                         VALUES 
                         (@Name, @Email, @Password, @Phone, @AltPhone, @Address, @City, @State, @PostalCode, @Country, @Gender, @DOB)";

                try
                {
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Password", password);
                            cmd.Parameters.AddWithValue("@Phone", phone);
                            cmd.Parameters.AddWithValue("@AltPhone", altPhone);
                            cmd.Parameters.AddWithValue("@Address", address);
                            cmd.Parameters.AddWithValue("@City", city);
                            cmd.Parameters.AddWithValue("@State", state);
                            cmd.Parameters.AddWithValue("@PostalCode", postal);
                            cmd.Parameters.AddWithValue("@Country", country);
                            cmd.Parameters.AddWithValue("@Gender", gender);
                            cmd.Parameters.AddWithValue("@DOB", dob);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    Response.Write("<script>alert('Registration successful!');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}