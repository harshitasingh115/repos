<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyList.aspx.cs" Inherits="Travel.ModifyList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style5 {
            margin-left: 0px;
        }
        .auto-style7 {
            text-align: center;
            margin-left: 40px;
        }
    </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 100%; height: 100%; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <h1 class="auto-style1">
            <strong><span class="auto-style5">Modify List:</span></strong></h1>
        <p class="auto-style1">
            &nbsp;</p>
            <div class="auto-style7">
            <asp:GridView ID="grdModify" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Reference Number">
                        <ItemTemplate>
<%--                            <asp:HyperLink runat="server" NavigateUrl='<%# Eval("Reference Number", "~/ModifySummary.aspx?Reference Number={0}") %>' Text='<%# Eval("Reference Number") %>' />--%>
                            <asp:hyperlink runat="server" id="hlDividents" navigateurl='<%# String.Format("ModifySummary.aspx?Reference Number={0}&User Name={1}", Eval("Reference Number"), Eval("User Name")) %>' text='<%# Eval("Reference Number") %>'></asp:hyperlink>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="User Name" HeaderText="User Name" />
                    <asp:BoundField DataField="Date Completed" HeaderText="Date Completed" />
                </Columns>
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
        </p>
        <p class="auto-style1">
            &nbsp;</p>
        <p class="auto-style1">
            <asp:Button ID="btnBack" runat="server" CssClass="auto-style5" OnClick="btnBack_Click" Text="Back" Height="30px" Width="174px" />
        </p>
    </form>
</body>
</html>
