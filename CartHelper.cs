using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

namespace WEB_Ecom_ASP_DOT_NET
{
    /// <summary>
    /// Helper class for cart-related operations
    /// </summary>
    public static class CartHelper
    {
        // Get total number of items in cart
        public static int GetCartItemCount(HttpSessionState session)
        {
            int totalItems = 0;

            if (session["Cart"] != null)
            {
                Dictionary<int, int> cart = (Dictionary<int, int>)session["Cart"];
                foreach (var item in cart)
                {
                    totalItems += item.Value;
                }
            }

            return totalItems;
        }

        // Get cart dictionary
        public static Dictionary<int, int> GetCart(HttpSessionState session)
        {
            if (session["Cart"] == null)
            {
                session["Cart"] = new Dictionary<int, int>();
            }

            return (Dictionary<int, int>)session["Cart"];
        }

        // Add item to cart
        public static void AddToCart(HttpSessionState session, int productId, int quantity = 1)
        {
            Dictionary<int, int> cart = GetCart(session);

            if (cart.ContainsKey(productId))
            {
                cart[productId] += quantity;
            }
            else
            {
                cart[productId] = quantity;
            }

            session["Cart"] = cart;
        }

        // Remove item from cart
        public static void RemoveFromCart(HttpSessionState session, int productId)
        {
            Dictionary<int, int> cart = GetCart(session);

            if (cart.ContainsKey(productId))
            {
                cart.Remove(productId);
                session["Cart"] = cart;
            }
        }

        // Update item quantity in cart
        public static void UpdateQuantity(HttpSessionState session, int productId, int quantity)
        {
            Dictionary<int, int> cart = GetCart(session);

            if (cart.ContainsKey(productId))
            {
                if (quantity > 0)
                {
                    cart[productId] = quantity;
                }
                else
                {
                    cart.Remove(productId);
                }

                session["Cart"] = cart;
            }
        }

        // Clear cart
        public static void ClearCart(HttpSessionState session)
        {
            session["Cart"] = new Dictionary<int, int>();
        }
    }
}