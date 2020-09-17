<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Travel.TestUserInfo" %>

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
            text-align: center;
            margin-top: 0px;
        }
        .auto-style4 {
            margin-left: 0px;
        }
        .auto-style5 {
            font-size: x-large;
        }
        .auto-style6 {
            margin-left: 32px;
        }
        .auto-style7 {
            margin-left: 36px;
        }
        .auto-style8 {
            text-align: right;
            width: 1639px;
            height: 1194px;
        }
        </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 100%; height: 100%; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server">
        <div class="auto-style8">
            <br />
            <h1 class="auto-style1"><strong>User Recent Request:</strong></h1>
            <asp:Button ID="btnModify" runat="server" Height="35px" OnClick="btnModify_Click" Text="Modify" Width="78px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCompleted" runat="server" Height="34px" Text="Completed Summary Report" Width="193px" CssClass="auto-style4" OnClick="btnCompleted_Click" />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:Label ID="lblFileRef" runat="server" Visible="False"></asp:Label>
            <br />
            <br />
            <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" Height="987px" CssClass="auto-style2" Width="1643px">
                <br />
                <strong><span class="auto-style5">Recent Request Entered:</span></strong><br />
                <br />
                <asp:DropDownList ID="ddTravelOption" runat="server" Height="2%" Width="6%" OnSelectedIndexChanged="ddTravelOption_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Default</asp:ListItem>
                    <asp:ListItem>Airport</asp:ListItem>
                    <asp:ListItem>Car</asp:ListItem>
                    <asp:ListItem>Flight</asp:ListItem>
                    <asp:ListItem>Hotel</asp:ListItem>
                </asp:DropDownList>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div>
                   &nbsp;&nbsp;&nbsp; 
                    <div class="auto-style1">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style6" ForeColor="#333333" GridLines="None" Height="21px" OnRowDataBound="OnRowDataBound" Width="1585px">
                            <Columns>
                                <asp:TemplateField HeaderText="User Name" ItemStyle-Width="30">
                                    <ItemTemplate>
<%--                                        <asp:HyperLink runat="server" NavigateUrl='<%# Eval("userName", "~/Review.aspx?userName={0}") %>' Text='<%# Eval("userName") %>' />--%>
                                    <asp:hyperlink runat="server" id="hlDividents" navigateurl='<%# String.Format("Review.aspx?userName={0}&file_refer={1}", Eval("userName"), Eval("file_refer")) %>' text='<%# Eval("userName") %>'></asp:hyperlink>
                                    </ItemTemplate>
                                    <ControlStyle Width="50px" />
                                    <FooterStyle Font-Size="Medium" />
                                    <HeaderStyle Width="50px" Wrap="True" />
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Status">
                                <FooterStyle Font-Size="Medium" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="userName, file_refer" DataNavigateUrlFormatString="Review.aspx?userName={0}&file_refer={1}"/>
<%--                                <asp:TemplateField HeaderText="File Reference" Visible="false" ItemStyle-Width="30">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" NavigateUrl='<%# Eval("file_refer", "~/Review.aspx?file_refer={0}") %>' Text='<%# Eval("file_refer") %>' />
                                    </ItemTemplate>
                                    <ControlStyle Width="50px" />
                                    <FooterStyle Font-Size="Medium" />
                                    <HeaderStyle Width="50px" Wrap="True" />
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>--%>
<%--                                <asp:BoundField DataField="file_refer" HeaderText="File Reference" Visible="False" />--%>
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
                </div>
                <span class="auto-style5">
                <br />
                <br />
                <br />
                </span><strong><span class="auto-style5">Travel Expenditure Report:<br /> </span></strong>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div>
                   &nbsp;&nbsp;&nbsp; 
                    <div class="auto-style1">
                        <asp:GridView ID="GridView3" runat="server" CellPadding="4" CssClass="auto-style7" ForeColor="#333333" Height="170px" OnRowDataBound="GridViewOnRowDataBound" Width="1580px">
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
                </div>
                <br />
                <asp:Button ID="btnExport" runat="server"  OnClick="btnExport_Click" Text="Export" Height="30px" Width="174px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" Height="30px" Width="174px" OnClick="btnBack_Click" />
            </asp:Panel>
            </div>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
