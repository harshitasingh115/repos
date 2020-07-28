<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpForm.aspx.cs" Inherits="Travel.SignUpForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style27 {
            font-family: "Times New Roman", Times, serif;
            font-size: xx-large;
            height: 100%;
            width: 100%;
            margin-right: 3px;
            margin-bottom: 19px;
        }
        .auto-style42 {
            height: 100%;
            width: 46%;
            margin-left: 610px;
            margin-right: 12px;
            text-align: center;
        }
        .auto-style11 {
            margin-left: 27px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style2 {
            margin-left: 13px;
        }
        .auto-style22 {
            margin-left: 68px;
        }
        .auto-style26 {
            margin-left: 20px;
        }
        .auto-style38 {
            height: 100%;
            width: 46%;
            margin-left: 610px;
            margin-right: 12px;
        }
        .auto-style28 {
            margin-left: 218px;
        }
        .auto-style43 {
            text-align: center;
            font-size: xx-large;
        }
        </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 100%; height: 100%; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server">
        <div>
        </div>
        <p class="auto-style43">
            <strong>Sign Up:</strong></p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <asp:Panel ID="Panel1" runat="server">
                    <p class="auto-style27">
            <strong><em>Trying to register for the first time? Please provide all the details:</em></strong></p>
                    <p class="auto-style27">
                        <asp:Label ID="lblWarning" runat="server"></asp:Label>
                    </p>
        <p class="auto-style42">
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style11" Width="242px" Height="17px"></asp:TextBox>
            <asp:Label ID="Label12" runat="server" Font-Bold="true" ForeColor="Red" Text="!" Visible="false"></asp:Label>
        </p>
        <p class="auto-style42">
            User Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUserName" runat="server" CssClass="auto-style11" Width="242px" Height="17px"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="Red" Text="!" Visible="false"></asp:Label>
        </p>
        <p class="auto-style42">
            Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="txtPassword" runat="server" Width="242px" Height="17px" CssClass="auto-style3"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
        <p class="auto-style42">
            Contact Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtContact" runat="server" CssClass="auto-style2" Width="242px" Height="17px"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
        <p class="auto-style42">
            Driver&#39;s License:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox ID="txtLicense" runat="server" Width="242px" Height="17px"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
        <p class="auto-style42">
            Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <asp:TextBox ID="txtAddress" runat="server" CssClass="auto-style3" Width="242px" Height="17px"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
       <p class="auto-style42">
            City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtCity" runat="server" Width="242px" Height="17px" CssClass="auto-style22"></asp:TextBox>
            <asp:Label ID="Label6" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
       <p class="auto-style42" >
            Province:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddProvince" Width="245px" Height="22px" runat="server" CssClass="auto-style26">
                <asp:ListItem>Alberta</asp:ListItem>
                <asp:ListItem>British Columbia</asp:ListItem>
                <asp:ListItem>Manitoba</asp:ListItem>
                <asp:ListItem>New Brunswick</asp:ListItem>
                <asp:ListItem>Newfoundland and Labrador</asp:ListItem>
                <asp:ListItem>Nova Scotia</asp:ListItem>
                <asp:ListItem>Ontario</asp:ListItem>
                <asp:ListItem>Prince Edward Island</asp:ListItem>
                <asp:ListItem>Quebec City</asp:ListItem>
                <asp:ListItem>Saskatchewan</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label7" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
       <p class="auto-style42">
            Postal Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPostal" runat="server" Width="242px" Height="17px"></asp:TextBox>
            <asp:Label ID="Label8" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
       <p class="auto-style42">
            Approving Manager:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; 
            <asp:DropDownList ID="txtManager" runat="server" Width="245px" Height="22px">
                <asp:ListItem>Adam Mordaunt</asp:ListItem>
                <asp:ListItem>Ben Hamilton</asp:ListItem>
                <asp:ListItem>Brandon Denton</asp:ListItem>
                <asp:ListItem>Crystal Bedore</asp:ListItem>
                <asp:ListItem>Ian Simpson</asp:ListItem>
                <asp:ListItem>Jeff Hitchcock</asp:ListItem>
                <asp:ListItem>Katie Gotsman</asp:ListItem>
                <asp:ListItem>Kelly Kowalik</asp:ListItem>
                <asp:ListItem>Kim Smith</asp:ListItem>
                <asp:ListItem>Morgan Malinski</asp:ListItem>
                <asp:ListItem>Rachelle Bar</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label9" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
       <p class="auto-style42">
            Credit Card Holder:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:DropDownList ID="txtCCHolder" runat="server" Width="245px" Height="22px">
                <asp:ListItem>Ben Hamilton</asp:ListItem>
                <asp:ListItem>Brandon Denton</asp:ListItem>
                <asp:ListItem>Crystal Bedore</asp:ListItem>
                <asp:ListItem>Ian Simpson</asp:ListItem>
                <asp:ListItem>Jeff Hitchcock</asp:ListItem>
                <asp:ListItem>Katie Gotsman</asp:ListItem>
                <asp:ListItem>Kelly Kowalik</asp:ListItem>
                <asp:ListItem>Kim Smith</asp:ListItem>
                <asp:ListItem>Morgan Malinski</asp:ListItem>
                <asp:ListItem>Rachelle Bar</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label10" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
       <p class="auto-style42">
            Emerald Confirmation Number: <asp:TextBox ID="txtEmerald" runat="server" Width="242px" Height="17px"></asp:TextBox>
            <asp:Label ID="Label11" runat="server" Text="!" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
        </p>
       <p class="auto-style38">
            <asp:Button ID="btnSignUp" BackColor="YellowGreen" ForeColor="White" Font-Bold="true"  runat="server" Text="Save" CssClass="auto-style28" Width="158px" Height="38px" OnClick="btnSignUp_Click" />
        </p>
        </asp:Panel>
    </form>
</body>
</html>
