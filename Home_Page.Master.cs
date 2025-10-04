using System;
using System.Collections.Generic;
using System.Web.UI;

namespace WEB_Ecom_ASP_DOT_NET
{
    public partial class Home_Page : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Master page load logic if needed
        }

        // Get cart item count for navbar display
        public int GetCartItemCount()
        {
            int totalItems = 0;

            if (Session["Cart"] != null)
            {
                Dictionary<int, int> cart = (Dictionary<int, int>)Session["Cart"];
                foreach (var item in cart)
                {
                    totalItems += item.Value;
                }
            }

            return totalItems;
        }
    }
}