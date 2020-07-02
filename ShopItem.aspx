<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShopItem.aspx.cs" Inherits="ShopItem" Title="Untitled Page" %>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentCenter" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="dsItem">
        <ItemTemplate>
            <asp:Label ID="lblCategoryId" runat="server" Text='<%# Eval("CategoryID") %>' Visible="false" ></asp:Label><br />
            <asp:Label ID="Category" runat="server" Text='<%# Eval("CategoryTitle") %>' Font-Bold="True"></asp:Label><br />
            <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("ImageURL", "Images\\Thumb424\\{0}") %>'
                PostBackUrl='<%# Eval("ProductID","ShopItem.aspx?ProductID={0}") %>' /><br />
            <asp:Label ID="Title" runat="server" Text='<%# Eval("Title") %>' Font-Bold="True"></asp:Label><br />
            <asp:Label ID="PriceVisible" runat="server" Text='<%# Eval("Price", "{0:C}") %>'></asp:Label><br />
            <asp:Label ID="Price" runat="server" Text='<%# Eval("Price") %>' Visible="False"></asp:Label><br />
            Description: <br />
            <asp:Label ID="Description" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
            <br />
            <asp:Label ID="lblImage" runat="server" Text='<%# Eval("ImageURL", "Images\\Thumb424\\{0}") %>'
                Visible="False"></asp:Label>
        </ItemTemplate>
    </asp:DataList><asp:ObjectDataSource ID="dsItem" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Select"
        TypeName="DevMedia.ECommerce.Product">
        <SelectParameters>
            <asp:QueryStringParameter Name="productId" QueryStringField="ProductID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ImageButton ID="btnAddToCart" runat="server" ImageUrl="~/Images/btnAdd.gif"
        OnClick="btnAddToCart_Click" /><br />
    <br />
    <br />
   <a href="javascript: history.go(-1)">Return</a>
</asp:Content>

