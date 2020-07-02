<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="CheckOut_Confirmation" Title="Untitled Page" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCenter" Runat="Server">

Thank you for placing your order!
<br /><br />
Your order confirmation number is
<asp:Label
    id="lblConfirmNumber"
    Runat="server" />.

<br /><br />
<asp:HyperLink
    id="lnkContinue"
    Text="Continue"
    NavigateUrl="~/Default.aspx"
    Runat="server" />


</asp:Content>

