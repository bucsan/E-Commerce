<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowWebWindow.aspx.cs" Inherits="JavaScript_ShowWebWindow" %>

<%@ Register TagPrefix="custom" Namespace="DevMedia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">


 <style type="text/css">
        .webWindow
        {
            width:400px;
            height:400px;
            border:Outset;
            background-color:white;
        }
        .webWindowBody
        {
            padding:10px;
        }
        .webWindowTitleBar
        {
            font:14px Verdana,Sans-Serif;
            padding-left:10px;
            background-color:Blue;
            color:white;
            cursor:move;
        }
        .webWindowTitleText
        {
            float:left;
        }
        .webWindowClose
        {
            background-color:Red;
            cursor:pointer;
        }
    </style>

    <title>Cadastro</title>
</head>





<body>
    <form id="form1" runat="server">
   <div>
    <asp:LinkButton
        id="lnkOpenWindow"
        Text="Open Window"
        OnClick="lnkOpenWindow_Click" 
        Runat="server" />
    </div>
    
    
    <custom:WebWindow
        id="WebWindow1"
        WindowTitleText="The WebWindow Title"
        Visible="false"
        OnClosed="WebWindow1_Closed"
        Runat="server">
        Here is some content    
    </custom:WebWindow>
    
        
    
    </form>
</body>
</html>
