<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WEB_Ecom_ASP_DOT_NET.SignUp" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Customer Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
    body {
        background-color: #f0f4f8;
    }

    .form-container {
        background-color: #ffffff;
        border: 2px solid #0d6efd;
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #0d6efd;
    }

    .form-label {
        color: #333333;
        font-weight: 500;
    }

    .btn-primary {
        background-color: #0d6efd;
        border-color: #0d6efd;
    }

    .btn-primary:hover {
        background-color: #0b5ed7;
        border-color: #0a58ca;
    }
</style>

</head>

<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
    <h2 class="text-center mb-4">Create Your Account</h2>
    <div class="row justify-content-center">
        <div class="col-md-8 form-container">
            <div class="row g-3">


                <!-- Full Name -->
                        <div class="col-md-6">
                            <label class="form-label">Full Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                                ErrorMessage="Name is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Email -->
                        <div class="col-md-6">
                            <label class="form-label">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                ValidationExpression="^\S+@\S+\.\S+$" ErrorMessage="Invalid email format"
                                CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Password -->
                        <div class="col-md-6">
                            <label class="form-label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
                                ErrorMessage="Minimum 8 characters with letters and numbers"
                                CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Confirm Password -->
                        <div class="col-md-6">
                            <label class="form-label">Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
                            <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword"
                                ControlToCompare="txtPassword" ErrorMessage="Passwords do not match"
                                CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Phone -->
                        <div class="col-md-6">
                            <label class="form-label">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                                ErrorMessage="Phone is required" CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
                                ValidationExpression="^\d{10}$" ErrorMessage="Enter a valid 10-digit number"
                                CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <!-- Alternate Phone -->
                        <div class="col-md-6">
                            <label class="form-label">Alternate Phone (optional)</label>
                            <asp:TextBox ID="txtAltPhone" runat="server" CssClass="form-control" />
                        </div>

                        <!-- Address -->
                        <div class="col-md-12">
                            <label class="form-label">Street Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                                ErrorMessage="Address is required" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">State/Province</label>
                            <asp:TextBox ID="txtState" runat="server" CssClass="form-control" />
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Postal Code</label>
                            <asp:TextBox ID="txtPostal" runat="server" CssClass="form-control" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Country</label>
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Select Country" Value="" />
                                <asp:ListItem Text="India" Value="India" />
                                <asp:ListItem Text="United States" Value="USA" />
                                <asp:ListItem Text="United Kingdom" Value="UK" />
                                <asp:ListItem Text="Canada" Value="Canada" />
                            </asp:DropDownList>
                        </div>

                        <!-- Gender -->
                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Select Gender" Value="" />
                                <asp:ListItem Text="Male" Value="Male" />
                                <asp:ListItem Text="Female" Value="Female" />
                                <asp:ListItem Text="Other" Value="Other" />
                            </asp:DropDownList>
                        </div>

                        <!-- DOB -->
                        <div class="col-md-6">
                            <label class="form-label">Date of Birth</label>
                            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control" />
                        </div>

                        <!-- Submit -->
                        <div class="col-md-12 text-center mt-4">
                            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary w-50" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
