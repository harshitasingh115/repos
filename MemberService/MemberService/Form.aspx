<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="MemberSignature.Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 1241px;
            text-align: center;
            margin-left: 7px;
        }
        .auto-style3 {
            text-align: justify;
            margin-left: 160px;
        }
        .auto-style4 {
            font-size: medium;
            width: 899px;
            text-align: left;
            margin-left: 0px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            width: 1181px;
            margin-left: 40px;
        }
        .auto-style14 {
            width: 1212px;
            margin-left: 40px;
            text-align: center;
        }
        .auto-style17 {
            font-size: small;
            text-align: left;
            margin-left: 3px;
            margin-top: 0px;
        }
        .auto-style18 {
            font-size: medium;
            width: 899px;
            text-align: center;
            margin-left: 0px;
        }
        .auto-style19 {
            font-size: small;
            text-align: left;
            margin-left: 4px;
        }
        .auto-style16 {
            width: 1227px;
            text-align: center;
            margin-left: 25px;
        }
        .auto-style22 {
            width: 1223px;
            text-align: center;
            font-size: x-large;
            margin-left: 26px;
        }
        .auto-style23 {
            font-size: small;
            text-align: left;
            margin-left: 0px;
        }
        .auto-style24 {
            font-size: small;
            width: 899px;
            text-align: left;
            margin-left: 0px;
        }
        .auto-style25 {
            width: 1212px;
            margin-left: 40px;
            text-align: left;
        }
        .auto-style26 {
            text-align: left;
        }
        .auto-style27 {
            font-size: small;
            width: 899px;
            text-align: center;
            margin-left: 0px;
        }
        .auto-style28 {
            font-size: small;
        }
        .auto-style29 {
            font-size: small;
            width: 1184px;
            text-align: left;
            margin-left: 40px;
        }
        .auto-style30 {
            width: 1181px;
            margin-left: 40px;
            font-size: small;
        }
        .auto-style31 {
            font-size: small;
            width: 1180px;
            text-align: left;
            margin-left: 40px;
        }
        .auto-style32 {
            width: 1180px;
            margin-left: 40px;
        }
        .auto-style33 {
            width: 470px;
            margin-left: 417px;
        }
        .auto-style34 {
            font-size: small;
            width: 899px;
            text-align: left;
            margin-left: 40px;
        }
        .auto-style35 {
            text-align: justify;
            margin-left: 160px;
            height: 38px;
        }
        .auto-style36 {
            width: 1223px;
            text-align: center;
            font-size: x-large;
        }
        </style>
</head>
<body class="auto-style5" style="width: 1583px; margin-left: 181px; margin-right: 0px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
            <div class="auto-style35">
                <div>
                    <pre class="auto-style16">Please provide the 6 digit confirmation code: <asp:TextBox ID="txtID" runat="server"></asp:TextBox><asp:Button ID="btnSearchCode" runat="server" Text="Enter" OnClick="btnSearchCode_Click" Font-Size="Small" />      </pre>
                    <pre class="auto-style36">&nbsp;</pre>
                    <pre class="auto-style36">&nbsp;</pre>
                </div>
                <br />
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
        <div class="auto-style3">
        <div>
            <dl>
                <dl>
                    <pre class="auto-style22"><strong>ONTARIO ONE CALL</strong></pre>
                    <pre class="auto-style16" aria-hidden="True"><span class="auto-style24">Station Code:</span><asp:TextBox ID="txtStationCode" runat="server" CssClass="auto-style23" Width="69px"></asp:TextBox><span class="auto-style24">&nbsp;&nbsp;Company: </span><asp:TextBox ID="txtCompany" runat="server" CssClass="auto-style23" Width="312px"></asp:TextBox><span class="auto-style24">&nbsp;&nbsp;Address:</span><asp:TextBox ID="txtAddress" runat="server" CssClass="auto-style23" Width="342px"></asp:TextBox><span class="auto-style24">&nbsp;&nbsp;&nbsp;Locate Valid (Days):</span><asp:TextBox ID="txtLocate" runat="server" CssClass="auto-style23" Width="27px"></asp:TextBox></pre>
                </dl>
            </dl>
            </div>
            <blockquote class="auto-style5">
                <dl>
                    <dd>
                        <dl>
                            <dd>
                        <pre class="auto-style27">Contacts:</pre>
                            </dd>
                        </dl>
                    </dd>
                </dl>
            </blockquote>
            <p class="auto-style2">
            &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="1253px" CssClass="auto-style23">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="conType" HeaderText="Detail" ReadOnly="True" />
                    <asp:BoundField DataField="ConName" HeaderText="Contact Person" SortExpression="ConName" />
                    <asp:BoundField DataField="Phn1" HeaderText="Phone#" />
                    <asp:BoundField DataField="Phn2" HeaderText="Cell" />
                    <asp:BoundField DataField="Email" HeaderText="E-mail" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            </p>
            <blockquote class="auto-style5">
                <dl>
                    <dd>
                        <dl>
                            <dd>
                                <div class="auto-style26">
                        <pre class="auto-style33"><span class="auto-style24">LSP</span><span class="auto-style4">:&nbsp;&nbsp;&nbsp; </span><asp:TextBox ID="txtLSP" runat="server" CssClass="auto-style4" Width="308px"></asp:TextBox>	</pre>
                                </div>
                            </dd>
                        </dl>
                    </dd>
                </dl>
            </blockquote>
            <p class="auto-style2">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Height="16px" Width="1247px" CssClass="auto-style17" PageIndex="2" PageSize="2">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField HeaderText="Detail" ReadOnly="True" DataField="Detail" />
                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson"/>
                    <asp:BoundField DataField="Tel" HeaderText="Phone#" />
                    <asp:BoundField DataField="Cell" HeaderText="Cell" />
                    <asp:BoundField DataField="Email" HeaderText="E-mail" />
                </Columns>
                <EditRowStyle BorderStyle="Dotted" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
                </p>
            <br />
            <blockquote class="auto-style5">
                <dl>
                    <dd>
                        <dl>
                            <dd>
                        <pre class="auto-style18"><span class="auto-style28">Mediums</span>:</pre>
                            </dd>
                        </dl>
                    </dd>
                </dl>
            </blockquote>
            <p class="auto-style2">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="1244px" CssClass="auto-style19">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="DOW" HeaderText="Days of Week" ReadOnly="True" />
                    <asp:BoundField DataField="From" HeaderText="From" SortExpression="ConName" />
                    <asp:BoundField DataField="To" HeaderText="To" />
                    <asp:BoundField DataField="RequestType" HeaderText="Request Type" />
                    <asp:BoundField DataField="RecEquip" HeaderText="Receiving Equipment" />
                    <asp:BoundField DataField="Sketches" HeaderText="Sketches" />
                    <asp:BoundField DataField="GoodNight" HeaderText="Good Night" />
                    <asp:BoundField DataField="Medium Settings" HeaderText="Medium Settings" />
                    <asp:BoundField DataField="TicketFormat" HeaderText="Ticket Format" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
                </p>
            <dl>
                <pre class="auto-style34"><span class="auto-style28">Comments</span> (Special Instructions, codes, etc. if notifying an answering service)</pre>
                <pre class="auto-style6"><asp:TextBox ID="txtComment" runat="server" CssClass="auto-style23" Width="1174px"></asp:TextBox></pre>
                <pre class="auto-style30">Emergency Escalation Procedure</pre>
                <pre class="auto-style32"><asp:TextBox ID="txtEmergency" runat="server" CssClass="auto-style23" Width="1177px"></asp:TextBox></pre>
                <pre class="auto-style32">Company Holidays (Please list only non Statutory Holidays observed)</pre>
                        <pre class="auto-style32"><asp:TextBox ID="txtHoliday" runat="server" CssClass="auto-style23" Width="1172px"></asp:TextBox></pre>
                <pre class="auto-style32"><span class="auto-style24">Lookup Option: </span><asp:TextBox ID="txtLookup" runat="server" CssClass="auto-style23" Width="152px"></asp:TextBox><span class="auto-style24">&nbsp;&nbsp;&nbsp;LU Business Rules Validated: </span><asp:TextBox ID="txtLU" runat="server" CssClass="auto-style23" Width="183px"></asp:TextBox><span class="auto-style24">&nbsp;&nbsp;&nbsp; 360 Password:</span><asp:TextBox ID="txt360" runat="server" CssClass="auto-style23" Width="128px"></asp:TextBox><span class="auto-style24">&nbsp;&nbsp;&nbsp; Class Code:</span><asp:TextBox ID="txtClass" runat="server" CssClass="auto-style23" Width="56px"></asp:TextBox></pre>
                                <pre class="auto-style31">***Please notify Ontario One Call any time your organization&#39;s operational hours and/or information will be changing due to holidays,special events,</pre>
                <pre class="auto-style29">etc. Adding more than one medium may increase your annual cost assessment,<span class="auto-style24">for more information please contact </span><a href="mailto:memberservices@on1call.com.***"><span class="auto-style24">memberservices@on1call.com</span></a><span class="auto-style24"> ***</span></pre>
                <pre class="auto-style16"><strong><span class="auto-style24">[NOTE: Accept button sends the confirmation whereas, Reject gives the member the opportunity to send updated information into the given textbox below]</span></strong></pre>
                <div class="auto-style26">
                    <pre class="auto-style25">Full Name*	<asp:TextBox ID="txtName" runat="server" Width="228px"></asp:TextBox></pre>
                    <pre class="auto-style25">Email*		<asp:TextBox ID="txtEmail" runat="server" Width="228px"></asp:TextBox></pre>
                    <pre class="auto-style25"> <asp:CheckBox ID="checkBox" runat="server" />By checking this box you confirm that the information given in this form is true, complete and accurate.</pre>
                    <pre class="auto-style25"><asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>	<asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>  <asp:Label ID="lblColor" runat="server" Text="Label" Visible="False"></asp:Label></pre>
                    <pre class="auto-style14"><asp:Button ID="btnAccept" runat="server" CssClass="auto-style24" Text="Accept" Width="187px" OnClick="btnAccept_Click" /><span class="auto-style24">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><asp:Button ID="btnReject" runat="server" Text="Reject" OnClick="btnReject_Click1" Width="169px" /></pre>
                    <pre class="auto-style14"><asp:Label ID="lblReject" runat="server" Text="Label" Visible="False"></asp:Label><asp:TextBox ID="txtReject" runat="server" CssClass="auto-style24" Height="132px" Width="419px"></asp:TextBox></pre>
                    <pre class="auto-style14"><asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click1" Text="Send" /></pre>
                    <pre></pre>
                </div>
            </dl>
        </div>
        </asp:Panel>
    </form>
</body>
</html>
