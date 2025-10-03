<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RegisteredUser.aspx.cs" Inherits="WEB_Ecom_ASP_DOT_NET.RegisteredUser" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container mt-5">
        <h2 class="mb-4 text-center">Registered Users</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover align-middle" style="table-layout: auto;">

                <thead class="table-dark">
                    <tr>
                        <th style="min-width: 80px;">UserId</th>
                        <th style="min-width: 150px;">Name</th>
                        <th style="min-width: 200px;">Email</th>
                        <th style="min-width: 150px;">Password</th>
                        <th style="min-width: 120px;">Phone</th>
                        <th style="min-width: 120px;">Address</th>
                        <th style="min-width: 120px;">City</th>
                        <th style="min-width: 120px;">State</th>
                        <th style="min-width: 120px;">PostalCode</th>
                        <th style="min-width: 120px;">Country</th>
                        <th style="min-width: 100px;">Gender</th>
                        <th style="min-width: 120px;">DOB</th>
                    </tr>
                </thead>


                <tbody>
                    <%
                        string connectionString = ConfigurationManager.ConnectionStrings["SQL_SERVER"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("SELECT UserId,Name,Email,Password,Phone,Address,City,State,PostalCode,Country,Gender,DOB FROM Users", con);
                            SqlDataReader br = cmd.ExecuteReader();
                            while (br.Read())
                            {
                    %>
                    <tr>
                        <td><%= br["UserId"] %></td>
                        <td><%= br["Name"] %></td>
                        <td><%= br["Email"] %></td>
                        <td><%= br["Password"] %></td>
                        <td><%= br["Phone"] %></td>
                        <td class="text-wrap"><%= br["Address"] %></td>
                        <td><%= br["City"] %></td>
                        <td><%= br["State"] %></td>
                        <td><%= br["PostalCode"] %></td>
                        <td><%= br["Country"] %></td>
                        <td><%= br["Gender"] %></td>
                        <td><%= Convert.ToDateTime(br["DOB"]).ToString("dd-MM-yyyy") %></td>
                    </tr>

                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>



