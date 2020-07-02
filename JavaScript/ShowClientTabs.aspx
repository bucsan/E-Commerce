<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowClientTabs.aspx.cs" Inherits="JavaScript_ShowClientTabs" %>

<%@ Register TagPrefix="custom" Namespace="DevMedia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
     <custom:ClientTabs
        id="ClientTabs1"
        Runat="server">
        <custom:Tab ID="Tab1" Text="First Tab" runat="server">
            Contents of the first tab
        </custom:Tab>    
        <custom:Tab ID="Tab2" Text="Second Tab" runat="server">
            Contents of the second tab
        </custom:Tab>    
        <custom:Tab ID="Tab3" Text="Third Tab" runat="server">
            Contents of the third tab
            <br /><br />
            <asp:Label
                id="lblUserName"
                Text="User Name:"
                AssociatedControlID="txtUserName"
                Runat="server" />
            <asp:TextBox
                id="txtUserName"
                Runat="server" />
            <asp:Button
                id="btnSubmit"
                Text="Submit"
                Runat="server" />    
        </custom:Tab>    
    </custom:ClientTabs>
    
    </div>
    </form>
</body>
</html>
