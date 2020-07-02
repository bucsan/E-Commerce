<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentCenter" Runat="Server">
   
    <asp:GridView ID="CartGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" OnRowDeleting="CartGrid_RowDeleting"  OnRowCreated="CartGrid_RowCreated">
    <Columns>
    
    
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("ProductImageUrl") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        
        
        <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True" />
        
        
        <asp:TemplateField HeaderText="Quantity">
            <EditItemTemplate>
                &nbsp;
            </EditItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>' Width="53px"></asp:TextBox><asp:CompareValidator ID="compQuantity" runat="server" ControlToValidate="txtQuantity"
                    Operator="DataTypeCheck" Type="Integer">Number invalid</asp:CompareValidator><br />
                <asp:RequiredFieldValidator ID="reqQtd" runat="server" ControlToValidate="txtQuantity">The Quantity field is required</asp:RequiredFieldValidator>
            </ItemTemplate>
        </asp:TemplateField>
        
        
        <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" ReadOnly="True" HtmlEncode="False" />
        
        
        <asp:BoundField DataField="LineTotal" DataFormatString="{0:c}" HeaderText="Total"
            ReadOnly="True" HtmlEncode="False" />
        
         <asp:CommandField ShowDeleteButton="True"  />
        
        
    </Columns>
    <EmptyDataTemplate>
        There is nothing in your shopping cart. You can buy items from the Shop.<br />
        <a href="Products.aspx">Buy products</a>.
    </EmptyDataTemplate>
</asp:GridView>
&nbsp;<asp:Label ID="TotalLabel" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnUpdateTotals" runat="server" OnClick="btnUpdateTotals_Click" Text="Update totals" /><br />
<br />

<asp:Hyperlink
    id="lnkCheckOut"
    Text="Check Out"
    NavigateUrl="~/CheckOut/Default.aspx"
    Runat="server" />

    

</asp:Content>

