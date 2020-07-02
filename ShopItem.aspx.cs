using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevMedia.ECommerce;

public partial class ShopItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddToCart_Click(object sender, ImageClickEventArgs e)
    {
        double Price = double.Parse(((Label)DataList1.Controls[0].FindControl("Price")).Text);
        string ProductName = ((Label)DataList1.Controls[0].FindControl("Title")).Text;
        string PictureURL =((Label)DataList1.Controls[0].FindControl("lblImage")).Text;
        string CategoryId = ((Label)DataList1.Controls[0].FindControl("lblCategoryId")).Text;
        int ProductID = int.Parse(Request.QueryString["ProductID"]);
        if (Profile.Cart == null) 
        {
            Profile.Cart = new Cart(); 
        }
        Profile.Cart.Insert(ProductID, Price, 1, ProductName, PictureURL);
        Server.Transfer("Products.aspx?id= " + CategoryId);
    }
}
