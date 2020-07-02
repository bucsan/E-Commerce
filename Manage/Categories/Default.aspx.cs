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

public partial class Manage_Categories_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }


    protected void frmAdd_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        grdCategories.DataBind();
    }
    protected void frmAdd_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

    }
    protected void frmEdit_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        winEdit.Hide = true;
    }
    protected void frmEdit_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        grdCategories.DataBind();
    }
    protected void grdCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        winEdit.Hide = false;
    }
    protected void grdCategories_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        grdCategories.DataBind();
    }
}
