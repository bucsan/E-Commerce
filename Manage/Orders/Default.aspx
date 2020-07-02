<%@ Page Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Manage_Orders_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style="padding:15px">
Use this page to manage product orders. When a customer submits a shopping cart, the
order appears here.
You can view order details by clicking the 
Select link next to any order.
</div>

<asp:GridView
    id="grdOrders"
    DataSourceID="srcOrders"
    DataKeyNames="OrderId"
    AutoGenerateColumns="False"
    AutoGenerateSelectButton="True"
    GridLines="None"
    CssClass="grid"
    OnSelectedIndexChanged="grdOrders_SelectedIndexChanged"
    Runat="server">
    <Columns>
    <asp:BoundField DataField="OrderId" HeaderText="Order Id" />
    <asp:BoundField DataField="CCName" HeaderText="Customer Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
    <asp:BoundField DataField="EntryDate" HeaderText="Order Date" />
    </Columns>
</asp:GridView>


<asp:ObjectDataSource
    id="srcOrders"
    TypeName="DevMedia.ECommerce.Order"
    SelectMethod="SelectAll"
    Runat="server" />
 
 
 
 
 
 
 <custom:WebWindow
    id="winDetails"
    WindowTitleText="Order Details"
    ShowCloseButton="true"
    Runat="server" OnClosed="winDetails_Closed">

 
 
 <asp:FormView
        id="frmOrder"
        DataSourceID="srcOrderDetails"
        Runat="server">
        <ItemTemplate>
        <div class="scrollBox" style="height:300px">    
      
        <fieldset>
        <legend>Payment Information</legend>
        
        <div class="leftForm">
        Order Id:
        <br />
        Customer Name:
        <br />
        E-mail:
        <br />
        Credit Card Number:
        <br />
        Credit Card Type:
        </div>
        
        <div class="rightForm">
        <%# Eval("OrderId") %>
        <br />
        <%# Eval("CCName") %>
        <br />
         <%# Eval("Email") %>
        <br />
        <%# Eval("CCNumber") %>
        <br />
        <%# Eval("CCType") %>
        </div>
        <br style="clear:both" />
        </fieldset>
        <br />
        
        <fieldset>
        <legend>Billing Information</legend>
        
        <div class="leftForm">
        Street:
        <br />
        City:
        <br />
        State:
        <br />
        Postal:
        <br />
        Country:
        </div>
        
        <div class="rightForm">
        <%# Eval("BillingStreet") %>
        <br />
        <%# Eval("BillingCity") %>
        <br />
        <%# Eval("BillingState") %>
        <br />
        <%# Eval("BillingPostalCode") %>
        <br />
        <%# Eval("BillingCountry") %>

        </div>
        <br style="clear:both" />
        </fieldset>
        
        <br />
        
        <fieldset>
        <legend>Shipping Information</legend>
        
        <div class="leftForm">
        Street:
        <br />
        City:
        <br />
        State:
        <br />
        Postal:
        <br />
        Country:
        </div>
        
        <div class="rightForm">
        <%# Eval("ShippingStreet") %>
        <br />
        <%# Eval("ShippingCity") %>
        <br />
        <%# Eval("ShippingState") %>
        <br />
        <%# Eval("ShippingPostalCode") %>
        <br />
        <%# Eval("ShippingCountry") %>

        </div>
        <br style="clear:both" />
        </fieldset>

        <br />
        
      <asp:GridView
            id="grdOrderItems"
            DataSourceID="srcOrderItems"
            AutoGenerateColumns="False"
            GridLines="None"
            CssClass="cart"
            AlternatingRowStyle-CssClass="cartAlternating"
            ShowFooter="True"
            Runat="server" OnRowDataBound="grdOrderItems_RowDataBound" OnDataBound="grdOrderItems_DataBound" EnableTheming="False">
            <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" >
                <ItemStyle Width="250px" />
            </asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" >
                <ItemStyle Width="10px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
            <%# Eval("Price", "{0:c}") %>
            </ItemTemplate>
            <FooterTemplate>
            <asp:Label id="lblTt" Runat="server" />
            </FooterTemplate>
                <FooterStyle CssClass="cartTotalFooter" />
                <ItemStyle Width = "10px" />
            </asp:TemplateField>
            </Columns>
          <AlternatingRowStyle CssClass="cartAlternating" />
        </asp:GridView>
        <br /><br />
        </div>        
        </ItemTemplate>    
    </asp:FormView>
    
 </custom:WebWindow>
    
    
    <asp:ObjectDataSource
    id="srcOrderDetails"
    TypeName="DevMedia.ECommerce.Order"
    SelectMethod="Select"
    Runat="server">
    <SelectParameters>
    <asp:ControlParameter Name="OrderId" ControlID="grdOrders" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>



<asp:ObjectDataSource
    id="srcOrderItems"
    TypeName="DevMedia.ECommerce.Order"
    SelectMethod="SelectOrderItems"
    Runat="server">
    <SelectParameters>
    <asp:ControlParameter Name="OrderId" ControlID="grdOrders" Type="int32" />
    </SelectParameters>
</asp:ObjectDataSource>


</asp:Content>

