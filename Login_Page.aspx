<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Page.aspx.cs" Inherits="WEB_Ecom_ASP_DOT_NET.Login_Page" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Commerce Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-card {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.1);
            background-color: #ffffff;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            width: 100%;
        }

        .text-muted a {
            text-decoration: none;
        }

            .text-muted a:hover {
                text-decoration: underline;
            }
    </style>
</head>
<body>
    <div class="login-card">
        <h3 class="text-center mb-4">Welcome Back</h3>
        <form runat="server">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Invalid email format." CssClass="text-danger" Display="Dynamic"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="rememberMe" />
                    <label class="form-check-label" for="rememberMe">Remember me</label>
                </div>
                <a href="#" class="text-muted">Forgot password?</a>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
        </form>

        <div class="text-center mt-3">
            <span class="text-muted">Don’t have an account? <a href="Signup.aspx">Sign up</a></span>
        </div>
    </div>
</body>
</html>

