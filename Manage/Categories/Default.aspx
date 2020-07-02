<%@ Page Language="C#" MasterPageFile="~/Manage/Manage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Manage_Categories_Default" Title="Untitled Page" %>


<%@ Import Namespace="DevMedia" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





<div style="padding: 15px">
        Use this page to manage product categories. You can add new product categories,
        delete categories and edit existing categories.
    </div>
    <div style="width: 800px">
        <div style="float: left; margin-right: 10px; padding: 10px; border-left: solid 1px black;
            height: 510px;">
            
            
            
         <asp:GridView ID="grdCategories" DataSourceID="dsCategory" DataKeyNames="CategoryId"
                            AutoGenerateColumns="False" CssClass="grid" GridLines="None" runat="server" OnSelectedIndexChanged="grdCategories_SelectedIndexChanged" OnRowDeleted="grdCategories_RowDeleted">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" CommandName="Select" runat="server" />
                                        /
                                        <asp:LinkButton ID="LinkButton1" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure that you want to delete this category?');"
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Title" HeaderText="Title" />
                            </Columns>
                        </asp:GridView>
                        
                        
            <custom:OpenWebWindow ID="lnkAdd" Text="Add Category" WebWindowID="winAdd" runat="server" />
            &nbsp;<br />
            
            <custom:WebWindow ID="winEdit" Hide="True" WindowTitleText="Edit Category" runat="server" style="left: 26px; top: 492px">
               
           
            
            
        
            
        
         <asp:FormView ID="frmEdit" DataSourceID="dsCategoryUpdate" DefaultMode="Edit" runat="server"
                    OnItemCommand="frmEdit_ItemCommand" OnItemUpdated="frmEdit_ItemUpdated">
                    <EditItemTemplate>
                        <asp:Label ID="lblTitle" Text="Title:" AssociatedControlID="txtTitle" runat="server" />
                        <asp:RequiredFieldValidator ID="reqTitle" ControlToValidate="txtTitle" Text="(Required)"
                            ValidationGroup="Edit" runat="server" />
                        <br />
                        <asp:TextBox ID="txtTitle" Text='<%# Bind("Title") %>' runat="server" />
                        <br />
                        <asp:Button ID="btnEdit" Text="Update" CommandName="Update" ValidationGroup="Edit"
                            runat="server" />
                        <asp:Button ID="btnCancel" Text="Cancel" CommandName="Cancel" CausesValidation="false"
                            runat="server" />
                    </EditItemTemplate>
                </asp:FormView>
        
        
            </custom:WebWindow>
            
            
              <custom:WebWindow ID="winAdd" WindowTitleText="Add Category" Hide="true" runat="server" ShowCloseButton="False" style="left: 23px; top: 459px">
            
           
                <asp:FormView ID="frmAdd" DataSourceID="dsCategory" DefaultMode="Insert" OnItemCommand="frmAdd_ItemCommand"
                    OnItemInserted="frmAdd_ItemInserted" runat="server">
                    <InsertItemTemplate>
                        <asp:Label ID="lblTitle" Text="Title:" AssociatedControlID="txtTitle" runat="server" />
                        <asp:RequiredFieldValidator ID="reqTitle" ControlToValidate="txtTitle" Text="(Required)"
                            ValidationGroup="Add" runat="server" />
                        <br />
                        <asp:TextBox ID="txtTitle" Text='<%# Bind("Title") %>' runat="server" />&nbsp;<br />
                        <asp:Button ID="btnAdd" Text="Add" CommandName="Insert" ValidationGroup="Add" runat="server" />
                        <asp:Button ID="btnCancel" Text="Cancel" CommandName="Cancel" CausesValidation="false"
                            runat="server" />
                    </InsertItemTemplate>
                </asp:FormView>
                
                
            </custom:WebWindow>
           
            
            <asp:ObjectDataSource ID="dsCategoryUpdate" runat="server"  SelectMethod="SelectbyId"
                TypeName="DevMedia.ECommerce.Category" UpdateMethod="Update">
                 <UpdateParameters>
                   <asp:ControlParameter Name="CategoryId" ControlID="grdCategories" />
                 </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdCategories" Name="CategoryId" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            
            
            
             <asp:ObjectDataSource ID="dsCategory" runat="server" InsertMethod="Insert" SelectMethod="SelectCategory"
                TypeName="DevMedia.ECommerce.Category" DeleteMethod="DeleteCat">
                 <DeleteParameters>
                     <asp:Parameter Name="CategoryId" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="title" Type="String" />
                 </InsertParameters>
            </asp:ObjectDataSource>
            
        
        </div>
            
            
          
    </div>




</asp:Content>

