using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevMedia;
using DevMedia.ECommerce;

public partial class CheckOut_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Set focus to first field
            txtCCName.Focus();

            // Bind credit card types
            dropCCType.DataSource = Enum.GetNames(typeof(CreditCardType));
            dropCCType.DataBind();

            // Bind credit card expiration months
            DateTimeFormatInfo dates = CultureInfo.CurrentCulture.DateTimeFormat;
            for (int i = 1; i < 13; i++)
            {
                ListItem month = new ListItem(dates.GetMonthName(i), i.ToString());
                dropCCExpiryMonth.Items.Add(month);
            }

            // Bind credit card expiration years
            int startYear = DateTime.Now.Year;
            for (int i = startYear; i < startYear + 10; i++)
            {
                ListItem year = new ListItem(i.ToString(), i.ToString());
                dropCCExpiryYear.Items.Add(year);
            }

            bindProfile();
            BindGrid();

            if (Profile.Cart.Items.Count == 0)
            {
                btnSubmit.Enabled = false;
            }
        }
    }

    private void BindGrid()
    {

        dgCart.DataSource = Profile.Cart.Items;
        DataBind();
       
        lblTotal.Text = String.Format("Total:{0,19:C}", Profile.Cart.Total);
    }
    
    private void bindProfile()
    {
        txtCCName.Text = Profile.Name;
        txtStreet.Text = Profile.Address;
        txtCity.Text = Profile.City;
        txtState.Text = Profile.State;
        txtPostalCode.Text = Profile.PostCode;
        txtMail.Text = Profile.Email;
        txtCountry.Text = Profile.Country;
        
    }
    
    private void saveProfile()
    {
        Profile.Name = txtCCName.Text;
        Profile.Address  = txtStreet.Text;
        Profile.City = txtCity.Text;
        Profile.State = txtState.Text;
        Profile.PostCode = txtPostalCode.Text;
        Profile.Email = txtMail.Text;
        Profile.Country = txtCountry.Text;
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        saveProfile();
        saveOrder();
    }

   
    
    
    
    private void saveOrder()
    {
        

        if (Page.IsValid)
        {
            Order newOrder = new Order();

            // Credit card
            newOrder.UserName = User.Identity.Name;
            newOrder.CCName = txtCCName.Text;
            newOrder.CCNumber = txtCCNumber.Text;
            newOrder.CCType = (CreditCardType)Enum.Parse(typeof(CreditCardType), dropCCType.SelectedValue);
            newOrder.CCExpiryMonth = Int32.Parse(dropCCExpiryMonth.SelectedValue);
            newOrder.CCExpiryYear = Int32.Parse(dropCCExpiryYear.SelectedValue);

            // Billing address
            newOrder.BillingStreet = txtStreet.Text;
            newOrder.BillingCity = txtCity.Text;
            newOrder.BillingState = txtState.Text;
            newOrder.BillingPostalCode = txtPostalCode.Text;
            newOrder.BillingCountry = txtCountry.Text;
            newOrder.Email = txtMail.Text;

            // Shipping address
            newOrder.ShippingStreet = txtShipAdress.Text;
            newOrder.ShippingCity = txtShipCity.Text;
            newOrder.ShippingState = txtState.Text;
            newOrder.ShippingPostalCode = txtShipPostalCode.Text;
            newOrder.ShippingCountry = txtShipCountry.Text;

            // Submit order
            int confirmNumber = newOrder.Submit();
            
            saveOrderItem(confirmNumber);
            
            
            Context.Items.Add("cn", confirmNumber);

            // Redirect to Confirmation page
            Server.Transfer("Confirmation.aspx");} 
        }
       
    

    private void saveOrderItem(int id)
    {
       foreach (CartItem item in Profile.Cart.Items)
       {
           int productId = item.ProductID;
           double price = item.Price;
           int quantity = item.Quantity;
           Order.submitOrderItem(id,productId,price,quantity);
       }
        Profile.Cart.Items.Clear();
    }
    protected void chkCopy_CheckedChanged(object sender, EventArgs e)
    {
       
       txtShipAdress.Text = txtStreet.Text;
       txtShipCity.Text = txtCity.Text; 
       txtShipState.Text = txtState.Text;
       txtShipPostalCode.Text =  txtPostalCode.Text;
       txtShipCountry.Text = txtCountry.Text;

    }
}
