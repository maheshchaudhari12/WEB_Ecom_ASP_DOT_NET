<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WEB_Ecom_ASP_DOT_NET.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Literal ID="litAlert" runat="server" />

    <form id="form1" runat="server">
        <div class="container mt-2">
            <h2 class="mb-4 text-center">Add Product Card</h2>
            <div class="mb-3">
                <label for="txtName" class="form-label">Product Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtImageUrl" class="form-label">Image URL</label>
                <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtDescription" class="form-label">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtPrice" class="form-label">Price</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="ddlCategory" class="form-label">Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Select Category" Value="" />
                    <asp:ListItem Text="Computers" Value="Electronics" />
                    <asp:ListItem Text="Smartphones" Value="Clothing" />
                    <asp:ListItem Text="HardWare" Value="Books" />
                    <asp:ListItem Text="Home & Kitchen" Value="Home & Kitchen" />
                    <asp:ListItem Text="Beauty" Value="Beauty" />
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Save Product" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
    </form>
    
    

</asp:Content>

