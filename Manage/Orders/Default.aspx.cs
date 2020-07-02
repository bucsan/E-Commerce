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

public partial class Manage_Orders_Default : System.Web.UI.Page
{


    private decimal _total = 0;
    
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grdOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        winDetails.Hide = false;
    }
   


    /// <summary>
    /// Keep a running total
    /// </summary>
    protected void grdOrderItems_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            decimal price = (decimal)DataBinder.Eval(e.Row.DataItem, "Price");
            int quantity = (int)DataBinder.Eval(e.Row.DataItem, "Quantity");
            _total += (price * quantity);
        }
    }

    /// <summary>
    /// After binding Grid, show the total 
    /// </summary>
    protected void grdOrderItems_DataBound(object sender, EventArgs e)
    {
        GridView grdOrderItems = (GridView)sender;
        Label lblTotal = (Label)grdOrderItems.FooterRow.FindControl("lblTt");
        lblTotal.Text = _total.ToString("c");
    }

    /// <summary>
    /// When you click Close on the WebWindow, hide the window
    /// </summary>
    protected void winDetails_Closed(object sender, EventArgs e)
    {
       winDetails.Hide = true;
    }
}
