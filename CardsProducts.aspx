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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-title">Our Products</h1>
    <div class="products-container">
        <% 
            foreach (var product in GetProducts())
            {
        %>
        <div class="product-card">
            <img src="<%= product.ImageUrl %>" alt="<%= product.Name %>" class="product-image" />
            <div class="product-content">
                <h3 class="product-name"><%= product.Name %></h3>
                <p class="product-description"><%= product.Description %></p>
                <div class="product-price">$<%= product.Price.ToString("F2") %></div>
                <button type="button" class="add-to-cart-btn" onclick="addToCart(<%= product.ProductId %>, '<%= product.Name %>', <%= product.Price %>)">
                    Add to Cart
               
                </button>
            </div>
        </div>
        <% 
            }
        %>
    </div>

    <script>
        function addToCart(productId, productName, price) {
            // Call server-side method to add to cart
            PageMethods.AddToCart(productId, onSuccess, onError);

            function onSuccess(result) {
                if (result) {
                    alert(productName + ' added to cart successfully!');
                    // You can update cart count or show notification here
                } else {
                    alert('Failed to add item to cart');
                }
            }

            function onError(error) {
                alert('Error: ' + error.get_message());
            }
        }
    </script>
</asp:Content>
