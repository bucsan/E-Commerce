<%@ Page Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Manage_Products_Default" Title="Untitled Page" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style="padding:10px">
Use this page to manage your product inventory. You can add, delete, and edit existing products.
</div>

<asp:GridView
    id="grdProducts"
    DataSourceID="srcProducts"
    DataKeyNames="ProductId"
    AutoGenerateColumns="False"
    GridLines="None"
    CssClass="grid"
    OnSelectedIndexChanged="grdProducts_SelectedIndexChanged"
    runat="server">
    <Columns>
    <asp:TemplateField>
    <ItemTemplate>
        <asp:LinkButton
            id="lnkEdit"
            Text="Edit"
            CommandName="Select"
            Runat="server" />
        /
        <asp:LinkButton
            id="lnkDelete"
            Text="Delete"
            CommandName="Delete"
            OnClientClick="return confirm('Are you sure that you want to delete this product?')"
            Runat="server" />
    </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="ProductID" HeaderText="ProductID" />
    <asp:HyperLinkField DataTextField="Title" DataNavigateUrlFields="CategoryID" DataNavigateUrlFormatString="~/Products.aspx?id={0}" Target="_blank" HeaderText="Name" />
    <asp:BoundField DataField="CategoryTitle" HeaderText="Category" />
    <asp:BoundField DataField="Price" HeaderText="Price" HtmlEncode="False" DataFormatString="{0:c}" />
    </Columns>
</asp:GridView>

<custom:OpenWebWindow
    id="lnkOpen"
    Text="Add New Product"
    WebWindowID="winAdd"
    Runat="server" />
    
   
    
    
  
    <br />
    
  <custom:WebWindow
    id="winAdd"
    WindowTitleText="Add New Product"
    Hide="true"
    ShowCloseButton="false"
    Runat="server">  
    
     <asp:FormView ID="frmAdd" DefaultMode="Insert" DataSourceID="srcProducts" runat="server"
        OnItemInserted="frmAdd_ItemInserted" OnItemCommand="frmAdd_ItemCommand">
        
        
        <InsertItemTemplate>
        
            <asp:Label ID="lblName" Text="Name:"  runat="server" AssociatedControlID="txtName" />
            
            <asp:RequiredFieldValidator ID="reqName" ControlToValidate="txtName" Text="(Required)"
                ValidationGroup="Add" runat="server" />
                
            <div class="instructions">
                Enter the name of the product.
            </div>
            
            <asp:TextBox ID="txtName" Text='<%# Bind("Title") %>' runat="server" />&nbsp;<br />
            <br />
        
            
            
                <asp:Label ID="lblCategory" Text="Category:" runat="server" AssociatedControlID="drpCategory" />
                                    <asp:RequiredFieldValidator ID="reqCategory" runat="server" ControlToValidate="drpCategory"
                        ErrorMessage="(Requerid)" InitialValue="Choose a category" ValidationGroup="Add" />
                
                
                <div class="instructions">
                    Select a product category.<br />
                    <asp:DropDownList ID="drpCategory" runat="server" DataSourceID="sqlDsCategory"
                        DataTextField="Title" DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>' AppendDataBoundItems="True">
                        <asp:ListItem Selected="True">Choose a category</asp:ListItem>
                    </asp:DropDownList><br />

                    <asp:SqlDataSource ID="sqlDsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:StoreString %>"
                        SelectCommand="SELECT [CategoryID], [Title] FROM [dev_Categories] ORDER BY [Title]">
                    </asp:SqlDataSource>
                  </div>
           
           <br />
                <asp:Label ID="lblPrice" Text="Price:" runat="server" AssociatedControlID="txtPrice" />
                <asp:RequiredFieldValidator ID="reqPrice" ControlToValidate="txtPrice" Text="(Required)"
                    Display="Dynamic" ValidationGroup="Add" runat="server" />
                <asp:CompareValidator ID="valPrice" ControlToValidate="txtPrice" Text="(Currency)"
                    Operator="DataTypeCheck" Type="Currency" ValidationGroup="Add" Display="Dynamic"
                    runat="server" />
                <div class="instructions">
                    Enter the product price.
                </div>
                <asp:TextBox ID="txtPrice" Columns="5" Text='<%# Bind("Price") %>' runat="server"  />
          
            <br style="clear: both" />
            <br />
            <asp:Label ID="lblDescription" Text="Brief Description (can include HTML):" AssociatedControlID="txtDescription"
                runat="server" />
            <asp:RequiredFieldValidator ID="reqDescription" ControlToValidate="txtDescription"
                Text="(Required)" ValidationGroup="Add" runat="server" />
            <div class="instructions">
                The brief description appears in the Products.aspx page and in advertisements.
            </div>
            <asp:TextBox ID="txtDescription" Text='<%#Bind("Description")%>' TextMode="multiLine"
                Columns="40" Rows="2" runat="server" />&nbsp;<br />
            <br />
            <br />
            <asp:Label ID="lblImage" Text="Image:" AssociatedControlID="upImage" runat="server" />
            <asp:RequiredFieldValidator ID="reqImage" runat="server" ControlToValidate="upImage"
                ValidationGroup="Add">(Required)</asp:RequiredFieldValidator><div class="instructions">
                (Optional)Upload a product image from your hard drive.
            </div>
            <asp:FileUpload ID="upImage" runat="server" FileName='<%# Bind("ImageURL") %>' />&nbsp;<br />
            <div>
            </div>
            <br />
            <asp:Button ID="btnAdd" Text="Add Product" CommandName="Insert" ValidationGroup="Add"
                runat="server" />
            <asp:Button ID="btnCancel" Text="Cancel" CausesValidation="false" CommandName="Cancel"
                runat="server" />
           
                
        </InsertItemTemplate>
        
        
    </asp:FormView>
   
    
    
   
    </custom:WebWindow>
  
 
  
   
   
        <custom:WebWindow
    id="winEdit"
    WindowTitleText="Edit Product"
    Hide="true"
    ShowCloseButton="false"
    Runat="server">
    
      
       
        <asp:FormView
        id="frmEdit"
        DefaultMode="Edit"
        DataSourceID="srcEditProducts"
        Runat="server" OnItemCommand="frmEdit_ItemCommand">
        <EditItemTemplate>
          
        <asp:Label
            id="lblName"
            Text="Name:"
            AssociatedControlID="txtName"
            Runat="server" />
        <asp:RequiredFieldValidator
            id="reqName"
            ControlToValidate="txtName"
            Text="(Required)"
            ValidationGroup="Add"
            Runat="server" />    
        <div class="instructions">
            Enter the name of the product.
        </div>
        <asp:TextBox
            id="txtName"
            Text='<%# Bind("Title") %>'
            Runat="server" />&nbsp;<br /><br />
        <div class="colForm">
        <asp:Label
            id="lblDropCategory"
            Text="Category:"
            AssociatedControlID="drpCat"
            Runat="server" />
        <div class="instructions">
            Select a product category.
            <br />
            <asp:DropDownList ID="drpCat" runat="server" DataSourceID="sqlDsCategory"
                DataTextField="Title" DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>'>
            </asp:DropDownList><asp:SqlDataSource ID="sqlDsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:StoreString %>"
                SelectCommand="SELECT [CategoryID], [Title] FROM [dev_Categories] ORDER BY [Title]">
            </asp:SqlDataSource>
            <br />
            <br />
        </div>      
        </div>    
        <div class="colForm">
        <asp:Label
            id="lblPrice"
            Text="Price:"
            AssociatedControlID="txtPrice"
            Runat="server" />
        <asp:RequiredFieldValidator
            id="reqPrice"
            ControlToValidate="txtPrice"
            Text="(Required)"
            Display="Dynamic"
            ValidationGroup="Add"
            Runat="server" />
        <asp:CompareValidator
            id="valPrice"
            ControlToValidate="txtPrice"
            Text="(Currency)"
            Operator="DataTypeCheck"
            Type="Currency"
            ValidationGroup="Add"
            Display="Dynamic"
            Runat="server" />        
        <div class="instructions">
            Enter the product price. 
        </div>
        <asp:TextBox
            id="txtPrice"
            Columns="5"
            Text='<%# Bind("Price", "{0:0.00}") %>'
            Runat="server" />
        </div>        
        <br style="clear:both" /><br />
        <asp:Label
            id="lblDescription"
            Text="Brief Description (can include HTML):"
            AssociatedControlID="txtDescription"
            Runat="server" />
        <asp:RequiredFieldValidator
            id="reqDescription"
            ControlToValidate="txtDescription"
            Text="(Required)"
            ValidationGroup="Add"
            Runat="server" />    
        <div class="instructions">
            The brief description appears in the Products.aspx
            page and in advertisements.
        </div>
        <asp:TextBox
            id="txtDescription"
            Text='<%#Bind("Description")%>'
            TextMode="multiLine"
            Columns="40"
            Rows="2"
            Runat="server" />&nbsp;<br />
            &nbsp;<br /><br />
        <asp:Label
            id="lblImage"
            Text="Image:"
            AssociatedControlID="upImage"
            Runat="server" />
        <div class="instructions">
            (Optional)Upload a product image from your hard drive. 
        </div>
        <asp:FileUpload
            id="upImage"
            Runat="server" />            
        <br /><br />
        <asp:Label
            id="lblImageAltText"
            Text="Image Alt Text:"
            AssociatedControlID="txtImageAltText"
            Runat="server" />
        <div class="instructions">
        Alternate text associated with the product image.
        </div>
        <asp:TextBox
            id="txtImageAltText"
            Text='<%#Bind("ImageUrl")%>'
            Columns="40"
            Runat="server" />
        <br /><br />         
      
        <asp:Button 
            id="btnEdit"
            Text="Update Product"
            CommandName="Update"
            ValidationGroup="Edit"
            Runat="server" />
        <asp:Button 
            id="btnCancel"
            Text="Cancel"
            CausesValidation="false"
            CommandName="Cancel"
            Runat="server" />

        </EditItemTemplate>
    </asp:FormView>
       
       
         </custom:WebWindow>
    
         
         
<asp:ObjectDataSource
    id="srcProducts"
    TypeName="DevMedia.ECommerce.Product"
    SelectMethod="Select"
    InsertMethod="Insert"
    DeleteMethod="Delete"
    OnInserted="srcProducts_Inserted"
    Runat="server">
    <DeleteParameters>
        <asp:Parameter Name="ProductId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="categoryId" Type="Int32" />
        <asp:Parameter Name="title" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
        <asp:Parameter Name="imageURL" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>


    <asp:ObjectDataSource ID="srcEditProducts" TypeName="DevMedia.ECommerce.Product"
        SelectMethod="Select" UpdateMethod="Update" runat="server" OnUpdated="srcEditProducts_Updated"
        OnDeleted="srcEditProducts_Deleted">
        <UpdateParameters>
            <asp:ControlParameter Name="ProductId" ControlID="grdProducts" Type="Int32" />            
            <asp:Parameter Name="categoryId" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="imageUrl" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdProducts" Name="ProductId" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
  

</asp:Content>

