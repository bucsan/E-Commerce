<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Controls_Menu" %>


<%@ OutputCache Duration="99999" Shared="true" VaryByParam="CategoryID" SqlDependency="ECommerce:dev_Categories" %>



<asp:Repeater ID="rpCategory" runat="server" DataSourceID="dsCategory" EnableViewState="False">                    
 <ItemTemplate>  
                <ul>
                    <li>
                         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("CategoryID", "~/Products.aspx?id={0}") %>'
                    Text='<%# Eval("Title") %>'></asp:HyperLink>
                    </li>
                </ul>    
    </ItemTemplate>       
</asp:Repeater>




<asp:ObjectDataSource ID="dsCategory" runat="server" SelectMethod="SelectCategory"
    TypeName="DevMedia.ECommerce.Category"></asp:ObjectDataSource>
