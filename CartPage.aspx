<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Home_Page.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="WEB_Ecom_ASP_DOT_NET.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cart-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
        }
        .cart-header {
            font-size: 32px;
            margin-bottom: 30px;
            color: #333;
            text-align: center;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 15px;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .cart-item-info {
            flex: 2;
        }
        .cart-item-name {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }
        .cart-item-price {
            font-size: 16px;
            color: #666;
        }
        .cart-item-quantity {
            flex: 1;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        .quantity-btn {
            background: #007bff;
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }
        .quantity-btn:hover {
            background: #0056b3;
        }
        .quantity-display {
            font-size: 18px;
            font-weight: 600;
            min-width: 40px;
            text-align: center;
        }
        .cart-item-total {
            flex: 1;
            text-align: right;
        }
        .item-total-price {
            font-size: 20px;
            font-weight: bold;
            color: #2c5f2d;
        }
        .remove-btn {
            background: #dc3545;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
        }
        .remove-btn:hover {
            background: #c82333;
        }
        .cart-summary {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-top: 30px;
        }
        .cart-total {
            display: flex;
            justify-content: space-between;
            font-size: 24px;
            font-weight: bold;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 2px solid #333;
        }
        .empty-cart {
            text-align: center;
            padding: 80px 20px;
            background: #f8f9fa;
            border-radius: 8px;
        }
        .empty-cart-icon {
            font-size: 64px;
            margin-bottom: 20px;
        }
        .empty-cart-text {
            font-size: 20px;
            color: #666;
            margin-bottom: 30px;
        }
        .continue-shopping {
            display: inline-block;
            padding: 12px 30px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 600;
            transition: background 0.3s ease;
        }
        .continue-shopping:hover {
            background: #0056b3;
        }
        .checkout-btn {
            display: inline-block;
            padding: 15px 40px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease;
        }
        .checkout-btn:hover {
            background: #218838;
        }
        .cart-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }
        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 12px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-container">
        <h1 class="cart-header">🛒 Your Shopping Cart</h1>
        
        <asp:Panel ID="SuccessMessage" runat="server" CssClass="success-message" Visible="false">
            <asp:Label ID="SuccessLabel" runat="server" />
        </asp:Panel>
        
        <asp:Panel ID="EmptyCartPanel" runat="server" Visible="false" CssClass="empty-cart">
            <div class="empty-cart-icon">🛒</div>
            <p class="empty-cart-text">Your cart is empty</p>
            <a href="CardsProducts.aspx" class="continue-shopping">Start Shopping</a>
        </asp:Panel>
        
        <asp:Panel ID="CartItemsPanel" runat="server">
            <asp:Repeater ID="CartRepeater" runat="server" OnItemCommand="CartRepeater_ItemCommand">
                <ItemTemplate>
                    <div class="cart-item">
                        <div class="cart-item-info">
                            <div class="cart-item-name"><%# System.Web.HttpUtility.HtmlEncode(Eval("Name").ToString()) %></div>
                            <div class="cart-item-price">$<%# Eval("Price", "{0:F2}") %> each</div>
                            <asp:Button ID="RemoveBtn" runat="server" 
                                Text="Remove" 
                                CssClass="remove-btn"
                                CommandName="Remove"
                                CommandArgument='<%# Eval("ProductId") %>'
                                OnClientClick="return confirm('Remove this item from cart?');" />
                        </div>
                        <div class="cart-item-quantity">
                            <asp:Button ID="DecreaseBtn" runat="server" 
                                Text="-" 
                                CssClass="quantity-btn"
                                CommandName="Decrease"
                                CommandArgument='<%# Eval("ProductId") %>' />
                            <span class="quantity-display"><%# Eval("Quantity") %></span>
                            <asp:Button ID="IncreaseBtn" runat="server" 
                                Text="+" 
                                CssClass="quantity-btn"
                                CommandName="Increase"
                                CommandArgument='<%# Eval("ProductId") %>' />
                        </div>
                        <div class="cart-item-total">
                            <div class="item-total-price">$<%# Eval("TotalPrice", "{0:F2}") %></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <div class="cart-summary">
                <div class="cart-total">
                    <span>Total:</span>
                    <span>$<asp:Label ID="TotalLabel" runat="server" /></span>
                </div>
                <div class="cart-actions">
                    <a href="CardsProducts.aspx" class="continue-shopping">← Continue Shopping</a>
                    <a href="PaymentCheckout.aspx" class="checkout-btn">Proceed to Checkout →</a>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>