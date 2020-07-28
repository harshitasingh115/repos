<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Travel.Home" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 100%;
            margin-left: 6px;
            text-align: center;
            font-size: xx-large;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            margin-left: 0px;
            margin-top: 0px;
        }
        .newStyle1 {
            font-family: "Times New Roman", Times, serif;
            font-size: large;
        }
        .auto-style35 {
            width: 100%;
            height: 100%;
            margin-bottom: 6px;
        }
        .auto-style36 {
            width: 96%;
            margin-left: 1px;
            height: 27px;
            margin-right: 0px;
            margin-top: 0px;
            text-align: center;
            margin-bottom: 5px;
        }
        .auto-style37 {
            margin-left: 384px;
            margin-right: 614px;
        }
        .auto-style40 {
            text-align: left;
        }
        .auto-style41 {
            height: 54px;
            width: 323px;
            margin-left: 0px;
        }
        .auto-style42 {
            text-align: center;
        }
        .auto-style43 {
            width: 97%;
            margin-left: 81px;
            height: 27px;
            margin-right: 0px;
            margin-top: 0px;
            text-align: center;
            margin-bottom: 5px;
        }
        </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 100%; height: 100%; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server" class="auto-style35">
        <div class="auto-style1">
            <strong>
            <br />
            Travel Summary<br />
            <br />
            <br />
            <br />
            </strong></div>
        <h1 class="auto-style42">
            <strong><asp:Label ID="lblUser" runat="server" Text="User Login"></asp:Label>
            :&nbsp; </strong><asp:TextBox ID="txtUserLogin" runat="server" CssClass="auto-style3" Width="194px" Height="29px"></asp:TextBox>
            <strong>&nbsp;&nbsp;&nbsp; </strong>
        </h1>
        <h1 class="auto-style42">
            <strong>Password</strong>: &nbsp; <asp:TextBox ID="txtUserPassword" runat="server" CssClass="auto-style4" Width="193px" Height="29px"></asp:TextBox>
            &nbsp;</h1>
        <h5 class="auto-style42">
            <asp:Button ID="btnLogin" BackColor="YellowGreen" ForeColor="White" Font-Bold="true" runat="server" CssClass="auto-style4" OnClick="btnLogin_Click" Text="Login" Width="129px" Height="39px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="txtSignUp" BackColor="YellowGreen" ForeColor="White" Font-Bold="true"  runat="server" Height="39px" Text="Sign Up" Width="129px" OnClick="txtSignUp_Click" />
        </h5>
        <p class="auto-style42">
            <asp:Label ID="lblWarning" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:Label>
        </p>
        <p class="auto-style43">
            <asp:Label ID="lblCode" runat="server" Text="Label" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUserInfo" runat="server"></asp:Label>
            <asp:LinkButton ID="lblForgot" runat="server" OnClick="lblForgot_Click">Forgot Password?</asp:LinkButton>
&nbsp;&nbsp;<asp:PasswordRecovery ID="PasswordRecovery1" Visible="false" runat="server" CssClass="auto-style37" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="31px" Width="293px">
                <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                <UserNameTemplate>
                    <table cellpadding="4" cellspacing="0" style="border-collapse:collapse; margin-left: 52px;">
                        <tr>
                            <td>
                                <table cellpadding="0" class="auto-style41" align="center">
                                    <tr>
                                        <td align="center" colspan="2" style="color:White;background-color:#5D7B9D;font-size:0.9em;font-weight:bold;">Forgot Your Password?</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Black;font-style:italic;">Enter your email to receive your password.</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style40">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Height="16px" Width="198px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="SubmitButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Submit" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" Text="Submit" ValidationGroup="PasswordRecovery1" OnClick="SubmitButton_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </UserNameTemplate>
            </asp:PasswordRecovery>
        </p>
        <p class="auto-style36">
            &nbsp;</p>


    </form>
</body>
</html>
