<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CheckOut_Default" Title="Untitled Page" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCenter" Runat="Server">

<fieldset>
<legend>Shopping Cart</legend>

    <br />
    <asp:GridView ID="dgCart" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" HtmlEncode="False"
                ReadOnly="True" />
            <asp:BoundField DataField="LineTotal" DataFormatString="{0:c}" HeaderText="Total"
                HtmlEncode="False" ReadOnly="True" />
        </Columns>
        <EmptyDataTemplate>
            There is nothing in your shopping cart. You can buy items from the Shop.<br />
            <a href="Products.aspx">Buy products</a>.
        </EmptyDataTemplate>
        
    </asp:GridView>
    <asp:Label ID="lblTotal" runat="server"></asp:Label><br />
   

</fieldset>

<br />




<fieldset>
<legend>Payment Information</legend>
<div class="instructions">
Enter your credit card information.
</div>

<asp:Label
    id="lblName"
    Text="Name on Credit Card:"
    AssociatedControlID="txtCCName"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqName"
    ControlToValidate="txtCCName"
    Text="(Required)"
    Runat="server" />
    
<br />
<asp:TextBox
    id="txtCCName"
    Runat="server" />
<br /><br />
<asp:Label
    id="lblCCType"
    Text="Credit Card Type:"
    AssociatedControlID="dropCCType"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCCType"
    ControlToValidate="dropCCType"
    InitialValue="-1"
    Text="(Required)"
    Runat="server" />

<br />
<asp:DropDownList
    id="dropCCType"
    Runat="server">
    <asp:ListItem Text="Select Type" Value="-1" />
</asp:DropDownList>
<br /><br />
<asp:Label
    id="lblCCNumber"
    Text="Credit Card Number:"
    AssociatedControlID="txtCCNumber"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCCNumber"
    ControlToValidate="txtCCNumber"
    Text="(Required)"
    Runat="server" />
    
<br />
<asp:TextBox
    id="txtCCNumber"
    Runat="server" />
<br /><br />
<asp:Label
    id="lblCCExpiryDate"
    Text="Credit Card Expiration Date:"
    AssociatedControlID="dropCCExpiryMonth"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCCExpiryMonth"
    ControlToValidate="dropCCExpiryMonth"
    InitialValue="-1"
    Display="Dynamic"
    Text="(Required)"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCCExpiryYear"
    ControlToValidate="dropCCExpiryYear"
    InitialValue="-1"
    Display="Dynamic"
    Text="(Required)"
    Runat="server" />
<br />
<asp:DropDownList
    id="dropCCExpiryMonth"
    ToolTip="Credit Card Expration Month"
    AppendDataBoundItems="true"
    Runat="server">
    <asp:ListItem Text="Select Month" Value="-1" />
</asp:DropDownList>    
<asp:DropDownList
    id="dropCCExpiryYear"
    ToolTip="Credit Card Expration Year"
    AppendDataBoundItems="true"
    Runat="server">
    <asp:ListItem Text="Select Year" Value="-1" />
</asp:DropDownList>    

</fieldset>

<br />



<fieldset>
<legend>Billing Address</legend>
<div class="instructions">
Enter the address associated with your credit card.
</div>

<asp:Label
    id="lblStreet"
    Text="Street Address:"
    AssociatedControlId="txtStreet"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqStreet"
    ControlToValidate="txtStreet"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtStreet"
    AutoCompleteType="HomeStreetAddress"
    TextMode="MultiLine"
    Columns="40"
    Rows="2"
    Runat="server" />
<br /><br />
<div style="float:left;width:200px">
<asp:Label
    id="lblCity"
    Text="City:"
    AssociatedControlId="txtCity"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCity"
    ControlToValidate="txtCity"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtCity"
    AutoCompleteType="homecity"
    Columns="20"
    Runat="server" />
</div>
<div style="float:left;width">
<asp:Label
    id="lblState"
    Text="State/Region:"
    AssociatedControlId="txtState"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqState"
    ControlToValidate="txtState"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtState"
    AutoCompleteType="HomeState"
    Columns="4"
    Runat="server" />
</div>
<br style="clear:both" /><br />


<div style="float:left;width:200px">
<asp:Label
    id="lblPostalCode"
    Text="Postal Code:"
    AssociatedControlId="txtPostalCode"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqPostalCode"
    ControlToValidate="txtPostalCode"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtPostalCode"
    AutoCompleteType="homezipcode"
    Columns="10"
    Runat="server" />
</div>

<div style="float:left">
<asp:Label
    id="lblCountry"
    Text="Country:"
    AssociatedControlId="txtCountry"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCountry"
    ControlToValidate="txtCountry"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtCountry"    
    Text="Brasil"
    Columns="20"
    Runat="server" />
</div>
    <br />
    <br />

<br />
<div style="float:left;width:200px">
<asp:Label
    id="lblMail"
    Text="E-mail:"
    AssociatedControlId="txtMail"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqMail"
    ControlToValidate="txtMail"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtMail"
    AutoCompleteType="email"
    Columns="20"
    Runat="server" />
</div>


</fieldset>

<br />

<fieldset>


<legend>Shipping Address</legend>
<div class="instructions">
Enter the address where you want your order shipped.
</div>

<asp:CheckBox
    id="chkCopy"
    AutoPostBack="true"
    CausesValidation="false"
    OnCheckedChanged="chkCopy_CheckedChanged" 
    Runat="server" Text="Same as Billing Address?" />
    <br /><br />


<asp:Label
    id="lblShpAdress"
    Text="Street Address:"
    AssociatedControlId="txtShipAdress"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqShipAdress"
    ControlToValidate="txtStreet"
    Text="(Required)"
    Runat="server" />
    <asp:RegularExpressionValidator ID="regMail" runat="server" ControlToValidate="txtMail"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">E-mail invalid</asp:RegularExpressionValidator><br />
<asp:TextBox
    id="txtShipAdress"
    AutoCompleteType="HomeStreetAddress"
    TextMode="MultiLine"
    Columns="40"
    Rows="2"
    Runat="server" />
<br /><br />
<div style="float:left;width:200px">
<asp:Label
    id="lblShipCity"
    Text="City:"
    AssociatedControlId="txtShipCity"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqShipCity"
    ControlToValidate="txtCity"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtShipCity"
    AutoCompleteType="homecity"
    Columns="20"
    Runat="server" />
</div>
<div style="float:left;width">
<asp:Label
    id="lblShipState"
    Text="State/Region:"
    AssociatedControlId="txtShipState"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqShipState"
    ControlToValidate="txtState"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtShipState"
    AutoCompleteType="HomeState"
    Columns="4"
    Runat="server" />
</div>
<br style="clear:both" /><br />


<div style="float:left;width:200px">
<asp:Label
    id="lblShipPostalCode"
    Text="Postal Code:"
    AssociatedControlId="txtShipPostalCode"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqShipPostalCode"
    ControlToValidate="txtPostalCode"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtShipPostalCode"
    AutoCompleteType="homezipcode"
    Columns="10"
    Runat="server" />
</div>

<div style="float:left">
<asp:Label
    id="lblShipCountry"
    Text="Country:"
    AssociatedControlId="txtShipCountry"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqShipCountry"
    ControlToValidate="txtCountry"
    Text="(Required)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtShipCountry"
    AutoCompleteType="homecountryregion"
    Text="Brasil"
    Columns="20"
    Runat="server" />
</div>
    <br />

<br />




</fieldset>

<br />

<asp:Button
    id="btnSubmit"
    Text="Submit Order"
    Runat="server" OnClick="btnSubmit_Click" />
    







</asp:Content>

