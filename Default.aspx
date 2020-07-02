<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentCenter" Runat="Server">


    <asp:DataList ID="dtListRandom" runat="server" DataSourceID="dsRandom" RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table cellpadding="3" cellspacing="2" style="width: 170px">
                <tr>
                    <td>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl= '<%# Eval("ImageURL", "Images\\Thumb65\\{0}") %>' PostBackUrl='<%# Eval("ProductID","ShopItem.aspx?ProductID={0}") %>' /></td>
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
    </asp:DataList><asp:ObjectDataSource ID="dsRandom" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="SelectProductRandom" TypeName="DevMedia.ECommerce.Product"></asp:ObjectDataSource>

</asp:Content>

