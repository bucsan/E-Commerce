<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" Title="Untitled Page" %>
<%--<%@ OutputCache Duration="99999"  VaryByParam="id" SqlDependency="ECommerce:dev_Products" %>--%>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCenter" Runat="Server">     
    <asp:DataList ID="dtProducts" runat="server" DataSourceID="dsProducts" RepeatColumns="3" RepeatDirection="Horizontal" EnableViewState="False">
        <ItemTemplate>
            <table cellpadding="3" cellspacing="2" style="width: 170px">
                <tr>
                    <td>
            <asp:ImageButton ID="imgProduct" runat="server" ImageUrl= '<%# Eval("ImageURL", "Images\\Thumb65\\{0}") %>' PostBackUrl='<%# Eval("ProductID","ShopItem.aspx?ProductID={0}") %>'/></td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price", "{0:C}") %>'></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList><asp:ObjectDataSource ID="dsProducts" runat="server"
        SelectMethod="SelectByCategoryId" TypeName="DevMedia.ECommerce.Product" EnableCaching="true" SqlCacheDependency="ECommerce:dev_Products">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="36" Name="categoryId" QueryStringField="Id"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

