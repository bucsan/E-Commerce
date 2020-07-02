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

public partial class ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Profile.Cart == null)
        {
            Profile.Cart = new Cart();
        }

        if (Profile.Cart.Items.Count == 0)
        {
            TotalLabel.Visible = false;
            lnkCheckOut.Visible = false;
            btnUpdateTotals.Visible = false;
        }

        if (!Page.IsPostBack)
        {
            BindGrid();
            UpdateTotals();
        }
    }

   
    protected void CartGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
            Profile.Cart.Items.RemoveAt(e.RowIndex);
            BindGrid();
            
       
    }


    protected void BindGrid()
    {
        CartGrid.DataSource = Profile.Cart.Items;
        DataBind();
        TotalLabel.Text = String.Format("Total:{0,19:C}", Profile.Cart.Total);
    }
    protected void btnUpdateTotals_Click(object sender, EventArgs e)
    {

        UpdateTotals();

    }


    protected void UpdateTotals()
    {
         // update the quantities
        foreach (GridViewRow row in CartGrid.Rows)
        {
           int Quantity = Convert.ToInt32((row.FindControl("txtQuantity") as TextBox).Text);
            if (Quantity == 0)
            {
                Profile.Cart.Items.RemoveAt(row.RowIndex);
            }
            else
            {
                Profile.Cart.Items[row.RowIndex].Quantity = Quantity;
            }
            CartGrid.EditIndex = -1;
            BindGrid();
        }
    }
    protected void CartGrid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    ImageButton btn = e.Row.Cells[5].Controls[0] as ImageButton;
        //    btn.OnClientClick = "if (confirm('Are you sure you want to remove this product from the shopping cart?') == false) return false;";
        //}
    }
}
