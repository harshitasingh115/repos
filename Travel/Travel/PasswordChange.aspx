<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordChange.aspx.cs" Inherits="Travel.PasswordChange" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: x-large;
        }
        .auto-style6 {
            height: 680px;
            text-align: center;
        }
        .auto-style7 {
            margin-left: 271px;
        }
        .auto-style8 {
            text-align: left;
            background-color: #808080;
        }
        .auto-style9 {
            text-align: center;
            width: 713px;
            height: 358px;
        }
        .auto-style10 {
            text-align: justify;
        }
    </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 100%; height: 100%; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>Forgot Password</strong></div>
        <div class="auto-style6">
            <br />
            <asp:Label ID="lblUser" runat="server"></asp:Label>
            <br />
            &nbsp;
            <br />
            <div class="auto-style10">
            <asp:Panel ID="Panel1" runat="server" CssClass="auto-style7" Height="363px" Width="716px" BorderWidth="2">
                <asp:Panel ID="Panel2" runat="server" CssClass="auto-style8" Height="49px" BorderWidth="2">
                    <div class="auto-style9">
                        <strong>
                        <br />
                        Change Your Password<br />
                        <br />
                        <br />
                        Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                        <asp:TextBox ID="txtPassword" runat="server" Height="24px" Width="130px"></asp:TextBox>
                        <br />
                        <br />
                        <strong>New Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;
                        <asp:TextBox ID="txtNewPassword" Text="*" runat="server" Height="23px" Width="130px"></asp:TextBox>
                        <br />
                        <br />
                        <strong>Confirm New Password:&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;<asp:TextBox ID="txtConfirmNewPassword" runat="server" Height="24px" Width="130px"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="lblReminder" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="btnChangePassword" runat="server" Height="26px" OnClick="btnChangePassword_Click" Text="Change Password" Width="143px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Height="26px" OnClick="btnCancel_Click" Text="Cancel" Width="143px" />
                    </div>
                </asp:Panel>
            </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
