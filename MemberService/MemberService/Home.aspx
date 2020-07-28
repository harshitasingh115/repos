<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MemberSignature.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 480px;
            width: 405px;
            height: 30px;
            font-size: x-large;
        }
        .auto-style5 {
            width: 346px;
        }
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style7 {
            width: 609px;
        }
        .auto-style8 {
            width: 347px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="auto-style1">
            <strong>Online Signature Access for Members</strong></div>
        <p class="auto-style8">
            <asp:Label ID="lblStationCode" runat="server" Text="Station Code:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtStation" runat="server" Width="182px"></asp:TextBox>
        </p>
        <p class="auto-style8">
            <asp:Label ID="lblStation" runat="server" Text="Member ID:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="txtMemberID" runat="server" Width="183px" CssClass="auto-style6"></asp:TextBox>
        </p>
        <p class="auto-style5">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="350px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
        </p>
        <p class="auto-style5">
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="117px" />
        &nbsp;&nbsp;&nbsp;
            <asp:Label ID="cal" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
        <p class="auto-style7">
            Url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFormUrl" runat="server" Width="443px" Enabled="False"></asp:TextBox>
        </p>
        <p class="auto-style5">
            Code Generator:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtCode" runat="server" Width="168px"></asp:TextBox>
        </p>
        <p class="auto-style5">
&nbsp;</p>
    </form>
</body>
</html>
