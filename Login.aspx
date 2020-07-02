<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCenter" runat="Server">
    <div style="width: 600px">
        <div style="float: left; width: 275px; margin-right: 8px">
            <fieldset>
                <legend>Existing Customers</legend>
                <asp:Login ID="Login1" PasswordRecoveryText="Password Reminder" PasswordRecoveryUrl="~/PasswordReminder.aspx"
                    runat="server" />
            </fieldset>
        </div>
        <div style="float: left">
            <fieldset>
                <legend>New Customers</legend>
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server">
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep runat="server">
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </fieldset>
        </div>
    </div>
</asp:Content>

