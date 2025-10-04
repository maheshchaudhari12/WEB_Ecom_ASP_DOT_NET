<%@ Page Title="Products" Language="C#" MasterPageFile="~/Home_Page.Master" AutoEventWireup="true" CodeBehind="CardsProducts.aspx.cs" Inherits="WEB_Ecom_ASP_DOT_NET.CardsProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .products-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1400px;
            margin: 0 auto;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            background: white;
        }
            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            }
        .product-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
            background: #f5f5f5;
        }
        .product-content {
            padding: 15px;
        }
        .product-name {
            font-size: 18px;
            font-weight: 600;
            margin: 0 0 10px 0;
            color: #333;
        }
        .product-description {
            font-size: 14px;
            color: #666;
            margin: 0 0 15px 0;
            min-height: 40px;
        }
        .product-price {
            font-size: 22px;
            font-weight: bold;
            color: #2c5f2d;
            margin: 0 0 15px 0;
        }
        .add-to-cart-btn {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }
            .add-to-cart-btn:hover {
                background: #0056b3;
            }
        .page-title {
            text-align: center;
            padding: 30px 20px;
            font-size: 32px;
            color: #333;
        }
        .success-message {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #28a745;
            color: white;
            padding: 15px 25px;
            border-radius: 5px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            z-index: 1000;
            animation: slideIn 0.3s ease;
        }
        @keyframes slideIn {
            from {
                transform: translateX(400px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        .cart-link {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #333;
            color: white;
            padding: 12px 20px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            z-index: 999;
        }
        .cart-link:hover {
            background: #555;
        }
        .cart-count {
            background: #dc3545;
            padding: 2px 8px;
            border-radius: 10px;
            margin-left: 5px;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Panel ID="SuccessMessage" runat="server" CssClass="success-message" Visible="false">
        ✓ Item added to cart!
    </asp:Panel>

    <a href="CartPage.aspx" class="cart-link">
        🛒 Cart 
        <asp:Label ID="CartCountLabel" runat="server" CssClass="cart-count" Text="0" />
    </a>

    <h1 class="page-title">Our Products</h1>
    
    <div class="products-container">
        <asp:Repeater ID="ProductRepeater" runat="server" OnItemCommand="ProductRepeater_ItemCommand">
            <ItemTemplate>
                <div class="product-card">
                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="product-image" onerror="this.src='images/placeholder.jpg'" />
                    <div class="product-content">
                        <h3 class="product-name"><%# Eval("Name") %></h3>
                        <p class="product-description"><%# Eval("Description") %></p>
                        <div class="product-price">$<%# Eval("Price", "{0:F2}") %></div>
                        <asp:Button ID="AddToCartBtn" runat="server" 
                            Text="Add to Cart" 
                            CssClass="add-to-cart-btn"
                            CommandName="AddToCart"
                            CommandArgument='<%# Eval("ProductId") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <script type="text/javascript">
        // Auto-hide success message after 2 seconds
        window.onload = function () {
            var successMsg = document.querySelector('.success-message');
            if (successMsg && successMsg.style.display !== 'none') {
                setTimeout(function () {
                    successMsg.style.display = 'none';
                }, 2000);
            }
        };
    </script>
    
</asp:Content>