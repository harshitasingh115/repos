<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="PdfExport.aspx.cs" Inherits="Travel.PdfExport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/combine.PNG"/>
        <asp:GridView ID="GridView1" HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"
    RowStyle-BackColor="#E4E4E4" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Customer Id" ItemStyle-Width="100px" />
        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="120px" />
        <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="120px" />
    </Columns>
</asp:GridView>
<br />
    <div>
       <table border = "1">
          <tr><td>Name</td><td>Age</td></tr>
          <tr><td>John</td><td>11</td></tr>
          <tr><td>Sam</td><td>13</td></tr>
          <tr><td>Tony</td><td>12</td></tr>
       </table>
    </div>
    <div>
<asp:Button ID="Button1" runat="server" Text="Convert ASPX page to PDF" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
