﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Travel.TestUserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: medium;
            text-align: left;
            margin-top: 0px;
        }
        .auto-style3 {
            text-align: justify;
        }
        .auto-style4 {
            margin-left: 0px;
        }
        .auto-style5 {
            font-size: x-large;
        }
    </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 100%; height: 100%; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server">
        <div>
            <br />
            <h1 class="auto-style1"><strong>User Recent Request:</strong></h1>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCompleted" runat="server" Height="33px" Text="Completed Summary Report" Width="207px" CssClass="auto-style4" OnClick="btnCompleted_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" Height="595px" CssClass="auto-style2" Width="1188px">
                Recent Request Entered:&nbsp;
                <br />
                <br />
                <asp:DropDownList ID="ddTravelOption" runat="server" Height="4%" Width="10%" OnSelectedIndexChanged="ddTravelOption_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Default</asp:ListItem>
                    <asp:ListItem>Airport</asp:ListItem>
                    <asp:ListItem>Car</asp:ListItem>
                    <asp:ListItem>Flight</asp:ListItem>
                    <asp:ListItem>Hotel</asp:ListItem>
                </asp:DropDownList>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="auto-style3">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="16px" OnRowDataBound="OnRowDataBound" Width="1066px">
                        <Columns>
                            <asp:TemplateField HeaderText="User Name" ItemStyle-Width="30">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" NavigateUrl='<%# Eval("userName", "~/Review.aspx?userName={0}") %>' Text='<%# Eval("userName") %>' />
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <FooterStyle Font-Size="Medium" />
                                <HeaderStyle Width="50px" Wrap="True" />
                                <ItemStyle Width="70px" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Status">
                            <FooterStyle Font-Size="Medium" />
                            </asp:BoundField>
                        </Columns>
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
                <span class="auto-style5">
                <br />
                <br />
                </span><strong><span class="auto-style5">Travel Expenditure Report:<br /> </span></strong>
                <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" OnRowDataBound="GridViewOnRowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />                         
                </asp:GridView>
                <br />
                <asp:Button ID="btnExport" runat="server" Height="30px" OnClick="btnExport_Click" Text="Export" Width="174px" />
            </asp:Panel>
            </div>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
