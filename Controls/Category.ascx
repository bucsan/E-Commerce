<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category.ascx.cs" Inherits="Controls_Category" %>


<asp:DropDownList ID="drpCategory" runat="server" DataSourceID="srcCategory" DataTextField="Title"
    DataValueField="CategoryId">
    
    
    
</asp:DropDownList><asp:ObjectDataSource ID="srcCategory" runat="server" 
    SelectMethod="SelectCategory" TypeName="DevMedia.ECommerce.Category"></asp:ObjectDataSource>
