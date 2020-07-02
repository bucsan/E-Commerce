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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {

        string username = CreateUserWizard1.UserName;
        FormsAuthentication.SetAuthCookie(username,false);

        string returnUrl = Request.QueryString["returnUrl"];
        if (String.IsNullOrEmpty(returnUrl))
            returnUrl = "~/Default.aspx";
        Response.Redirect(returnUrl);
    }
}
