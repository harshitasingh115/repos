<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="Travel.Summary" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"/>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
    <script type="text/javascript" lang="ja">
         $(function () {
            $("#<%=txtIn.ClientID%>").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "mm-dd-yy",
                yearRange: '2020:2050'
            });
        });
                 $(function () {
            $("#<%=txtOut.ClientID%>").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "mm-dd-yy",
                yearRange: '2020:2050'
            });
        });
            </script>
    <style type="text/css">
        .auto-style5 {
            margin-top: 0px;
        }
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style17 {
            text-align: center;
        }
        .auto-style19 {
            font-weight: normal;
        }
        .auto-style38 {
            margin-top: 11px;
        }
        .auto-style40 {
            text-align: right;
        }
        .auto-style45 {
            text-align: left;
        }
        .auto-style47 {
            margin-top: 11px;
            text-align: left;
        }
        </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width:100%; height:100%; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server">
            <div class="auto-style17">
            <h1>&nbsp;</h1>
                <h1>Travel&nbsp; <span class="auto-style19"><strong>Summary</strong></span></h1>
                <h2>Welcome:
            <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label>
                </h2>

         <h3 class="auto-style40">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <strong>
             <asp:Button ID="btnReview" runat="server" Height="31px" OnClick="btnReview_Click" Text="Review Request" Visible="False" Width="148px" CssClass="ui-priority-primary" /></strong>&nbsp;&nbsp;&nbsp;
        </h3>
                <p class="auto-style17">
            &nbsp;<asp:ImageButton ID="btnFlight" runat="server" CssClass="auto-style5" Height="80px" ImageUrl="~/Image/flight.png" Width="89px"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="btnCar" runat="server" CssClass="auto-style6" Height="61px" ImageUrl="~/Image/car.PNG" Width="89px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="btnHotel" runat="server" CssClass="auto-style6" Height="79px" ImageUrl="~/Image/hotel.png" Width="79px" BorderColor="Black" />
        </p>
                  &nbsp;<br />
                <asp:Label ID="lblAlert" Font-Bold="true" Font-Size="Medium" ForeColor="Red" runat="server"></asp:Label>
                <asp:Panel ID="Panel4" runat="server" BackColor="Gray" Height="41px" Width="100%">
                            
                    <h3><strong>&nbsp;&nbsp;Departure City:
                        <asp:TextBox ID="txtLocation" runat="server" AutoCompleteType="Search" AutoPostBack="True" Height="25px" Width="127px"></asp:TextBox>
                        <ajaxToolkit:AutoCompleteExtender ID="txtLocation_AutoCompleteExtender" runat="server" BehaviorID="txtLocation_AutoCompleteExtender" CompletionInterval="100" CompletionSetCount="10" DelimiterCharacters="" MinimumPrefixLength="1" ServiceMethod="GetCity" TargetControlID="txtLocation">
                        </ajaxToolkit:AutoCompleteExtender>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Arrival City:<asp:TextBox ID="txtLocation1" runat="server" AutoCompleteType="Search" AutoPostBack="True" Height="25px" Width="127px"></asp:TextBox>
                        <ajaxToolkit:AutoCompleteExtender ID="txtLocation1_AutoCompleteExtender" runat="server" BehaviorID="txtLocation1_AutoCompleteExtender" CompletionInterval="100" CompletionSetCount="10" DelimiterCharacters="" MinimumPrefixLength="1" ServiceMethod="GetCity" TargetControlID="txtLocation1">
                        </ajaxToolkit:AutoCompleteExtender>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Check in:&nbsp;<asp:TextBox ID="txtIn" runat="server" OnTextChanged="txtIn_TextChanged" Height="27px" Width="121px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Check out:&nbsp;
                        <asp:TextBox ID="txtOut" runat="server" Height="27px" OnTextChanged="txtOut_TextChanged" Width="116px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp; </strong></h3>
                </asp:Panel>
                            <strong>
                        <asp:Panel ID="Panel2" runat="server" Width="100%" Height="100%" BorderColor="Black">
                            <p class="auto-style47">
                                <asp:CheckBox ID="chckFlight" runat="server" Text="Are you looking to book Flight?" OnCheckedChanged="chckFlight_CheckedChanged" AutoPostBack="true"/>
                            </p>
                            <div class="auto-style45">
                                <asp:Panel ID="Panel8" runat="server" BorderColor="Black" Enabled="False">
                                    One Way/Round Trip:
                                    <asp:DropDownList ID="ddFlightWay" runat="server" Height="20px" Width="79px">
                                        <asp:ListItem>One Way</asp:ListItem>
                                        <asp:ListItem>Round Way</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp; Desired Time for Departure Flight:
                                    <asp:DropDownList ID="ddFlightTime0" runat="server" Height="18px" Width="58px">
                                        <asp:ListItem>00:00</asp:ListItem>
                                        <asp:ListItem>00:30</asp:ListItem>
                                        <asp:ListItem>01:00</asp:ListItem>
                                        <asp:ListItem>01:30</asp:ListItem>
                                        <asp:ListItem>02:00</asp:ListItem>
                                        <asp:ListItem>02:30</asp:ListItem>
                                        <asp:ListItem>03:00</asp:ListItem>
                                        <asp:ListItem>03:30</asp:ListItem>
                                        <asp:ListItem>04:00</asp:ListItem>
                                        <asp:ListItem>04:30</asp:ListItem>
                                        <asp:ListItem>05:00</asp:ListItem>
                                        <asp:ListItem>05:30</asp:ListItem>
                                        <asp:ListItem>06:00</asp:ListItem>
                                        <asp:ListItem>06:30</asp:ListItem>
                                        <asp:ListItem>07:00</asp:ListItem>
                                        <asp:ListItem>07:30</asp:ListItem>
                                        <asp:ListItem>08:00</asp:ListItem>
                                        <asp:ListItem>08:30</asp:ListItem>
                                        <asp:ListItem>09:00</asp:ListItem>
                                        <asp:ListItem>09:30</asp:ListItem>
                                        <asp:ListItem>10:00</asp:ListItem>
                                        <asp:ListItem>10:30</asp:ListItem>
                                        <asp:ListItem>11:00</asp:ListItem>
                                        <asp:ListItem>11:30</asp:ListItem>
                                        <asp:ListItem>12:00</asp:ListItem>
                                        <asp:ListItem>12:30</asp:ListItem>
                                        <asp:ListItem>13:00</asp:ListItem>
                                        <asp:ListItem>13:30</asp:ListItem>
                                        <asp:ListItem>14:00</asp:ListItem>
                                        <asp:ListItem>14:30</asp:ListItem>
                                        <asp:ListItem>15:00</asp:ListItem>
                                        <asp:ListItem>15:30</asp:ListItem>
                                        <asp:ListItem>16:00</asp:ListItem>
                                        <asp:ListItem>16:30</asp:ListItem>
                                        <asp:ListItem>17:00</asp:ListItem>
                                        <asp:ListItem>17:30</asp:ListItem>
                                        <asp:ListItem>18:00</asp:ListItem>
                                        <asp:ListItem>18:30</asp:ListItem>
                                        <asp:ListItem>19:00</asp:ListItem>
                                        <asp:ListItem>19:30</asp:ListItem>
                                        <asp:ListItem>20:00</asp:ListItem>
                                        <asp:ListItem>20:30</asp:ListItem>
                                        <asp:ListItem>21:00</asp:ListItem>
                                        <asp:ListItem>21:30</asp:ListItem>
                                        <asp:ListItem>22:00</asp:ListItem>
                                        <asp:ListItem>22:30</asp:ListItem>
                                        <asp:ListItem>23:00</asp:ListItem>
                                        <asp:ListItem>23:30</asp:ListItem>
                                        <asp:ListItem>24:00</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp; Desired Time for Arrival Flight:
                                    <asp:DropDownList ID="ddDepartArrival0" runat="server" Height="27px" Width="58px">
                                        <asp:ListItem>00:00</asp:ListItem>
                                        <asp:ListItem>00:30</asp:ListItem>
                                        <asp:ListItem>01:00</asp:ListItem>
                                        <asp:ListItem>01:30</asp:ListItem>
                                        <asp:ListItem>02:00</asp:ListItem>
                                        <asp:ListItem>02:30</asp:ListItem>
                                        <asp:ListItem>03:00</asp:ListItem>
                                        <asp:ListItem>03:30</asp:ListItem>
                                        <asp:ListItem>04:00</asp:ListItem>
                                        <asp:ListItem>04:30</asp:ListItem>
                                        <asp:ListItem>05:00</asp:ListItem>
                                        <asp:ListItem>05:30</asp:ListItem>
                                        <asp:ListItem>06:00</asp:ListItem>
                                        <asp:ListItem>06:30</asp:ListItem>
                                        <asp:ListItem>07:00</asp:ListItem>
                                        <asp:ListItem>07:30</asp:ListItem>
                                        <asp:ListItem>08:00</asp:ListItem>
                                        <asp:ListItem>08:30</asp:ListItem>
                                        <asp:ListItem>09:00</asp:ListItem>
                                        <asp:ListItem>09:30</asp:ListItem>
                                        <asp:ListItem>10:00</asp:ListItem>
                                        <asp:ListItem>10:30</asp:ListItem>
                                        <asp:ListItem>11:00</asp:ListItem>
                                        <asp:ListItem>11:30</asp:ListItem>
                                        <asp:ListItem>12:00</asp:ListItem>
                                        <asp:ListItem>12:30</asp:ListItem>
                                        <asp:ListItem>13:00</asp:ListItem>
                                        <asp:ListItem>13:30</asp:ListItem>
                                        <asp:ListItem>14:00</asp:ListItem>
                                        <asp:ListItem>14:30</asp:ListItem>
                                        <asp:ListItem>15:00</asp:ListItem>
                                        <asp:ListItem>15:30</asp:ListItem>
                                        <asp:ListItem>16:00</asp:ListItem>
                                        <asp:ListItem>16:30</asp:ListItem>
                                        <asp:ListItem>17:00</asp:ListItem>
                                        <asp:ListItem>17:30</asp:ListItem>
                                        <asp:ListItem>18:00</asp:ListItem>
                                        <asp:ListItem>18:30</asp:ListItem>
                                        <asp:ListItem>19:00</asp:ListItem>
                                        <asp:ListItem>19:30</asp:ListItem>
                                        <asp:ListItem>20:00</asp:ListItem>
                                        <asp:ListItem>20:30</asp:ListItem>
                                        <asp:ListItem>21:00</asp:ListItem>
                                        <asp:ListItem>21:30</asp:ListItem>
                                        <asp:ListItem>22:00</asp:ListItem>
                                        <asp:ListItem>22:30</asp:ListItem>
                                        <asp:ListItem>23:00</asp:ListItem>
                                        <asp:ListItem>23:30</asp:ListItem>
                                        <asp:ListItem>24:00</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp; Flyer Program#:
                                    <asp:TextBox ID="txtProgram0" runat="server" Height="16px" Width="75px"></asp:TextBox>
                                    &nbsp; Window/Aisle:<strong>
                                    <asp:DropDownList ID="ddWindow" runat="server" Height="20px" Width="78px">
                                        <asp:ListItem>Window</asp:ListItem>
                                        <asp:ListItem>Aisle</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp; </strong>Country:
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem>Canada</asp:ListItem>
                                        <asp:ListItem>US</asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </div>
                                <br />
                                <strong>
                                <asp:CheckBox ID="chckAirport" runat="server" AutoPostBack="true" Text="Are you looking to book Airport Service?" OnCheckedChanged="chckAirport_CheckedChanged" />
                                <br />
                                </strong>
                                <asp:Panel ID="Panel9"  Enabled="False"  BorderColor="Black" runat="server">
                                
                                <asp:Label ID="lblLocation" runat="server" Text="PickUp Location:"></asp:Label>
                                &nbsp;&nbsp;<asp:TextBox ID="txtAirportPickUp" runat="server" Height="16px" Width="88px"></asp:TextBox>
                                &nbsp;
                                <asp:Label ID="lblClosest" runat="server" Text="Closest Intersection for PickUp:"></asp:Label>
                                &nbsp;<asp:TextBox ID="txtAirportCloseIntersection" runat="server" Height="16px" Width="113px"></asp:TextBox>
                                &nbsp; Destination:
                                <asp:TextBox ID="txtAirportDestionation" runat="server" Height="16px" Width="161px"></asp:TextBox>
                                &nbsp; Notes:
                                <asp:TextBox ID="txtAirportFlightNotes" runat="server" Height="16px" Width="289px"></asp:TextBox>
                                    <br />
                                </asp:Panel>                                
                                <br />
                                <asp:CheckBox ID="chckCar" runat="server" OnCheckedChanged="chckCar_CheckedChanged" Text="Are you looking to book Car?" AutoPostBack="true"/>
                                &nbsp;<br /> <asp:Panel ID="Panel7" runat="server" Enabled="False" BorderColor="Black" Width="1547px">
                                    &nbsp;National/Enterprise:
                                    <asp:DropDownList ID="ddCarNational" runat="server" Height="27px" Width="91px">
                                        <asp:ListItem>National</asp:ListItem>
                                        <asp:ListItem>Enterprise</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;<strong>&nbsp;Emerald #:<asp:TextBox ID="txtCarEmerald" runat="server" Height="21px" Width="99px"></asp:TextBox>
                                    &nbsp;Type of Vehicles:
                                    <asp:DropDownList ID="txtDropdownVehicle" runat="server" Height="26px" Width="149px">
                                        <asp:ListItem>7 Passenger Minivan</asp:ListItem>
                                        <asp:ListItem>Cargo Van</asp:ListItem>
                                        <asp:ListItem>Compact</asp:ListItem>
                                        <asp:ListItem>Compact SUV</asp:ListItem>
                                        <asp:ListItem>Economy</asp:ListItem>
                                        <asp:ListItem>Full-Size</asp:ListItem>
                                        <asp:ListItem>Full Size SUV</asp:ListItem>
                                        <asp:ListItem>Intermediate</asp:ListItem>
                                        <asp:ListItem>Intermediate SUV</asp:ListItem>
                                        <asp:ListItem>Pickup</asp:ListItem>
                                        <asp:ListItem>Premium</asp:ListItem>
                                        <asp:ListItem>Standard</asp:ListItem>
                                        <asp:ListItem>Standard SUV</asp:ListItem>
                                        <asp:ListItem>Not Selected</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;Pick-Up time:&nbsp;<asp:DropDownList ID="ddCarPickUpTime" runat="server" Height="18px" Width="58px">
                                        <asp:ListItem>00:00</asp:ListItem>
                                        <asp:ListItem>00:30</asp:ListItem>
                                        <asp:ListItem>01:00</asp:ListItem>
                                        <asp:ListItem>01:30</asp:ListItem>
                                        <asp:ListItem>02:00</asp:ListItem>
                                        <asp:ListItem>02:30</asp:ListItem>
                                        <asp:ListItem>03:00</asp:ListItem>
                                        <asp:ListItem>03:30</asp:ListItem>
                                        <asp:ListItem>04:00</asp:ListItem>
                                        <asp:ListItem>04:30</asp:ListItem>
                                        <asp:ListItem>05:00</asp:ListItem>
                                        <asp:ListItem>05:30</asp:ListItem>
                                        <asp:ListItem>06:00</asp:ListItem>
                                        <asp:ListItem>06:30</asp:ListItem>
                                        <asp:ListItem>07:00</asp:ListItem>
                                        <asp:ListItem>07:30</asp:ListItem>
                                        <asp:ListItem>08:00</asp:ListItem>
                                        <asp:ListItem>08:30</asp:ListItem>
                                        <asp:ListItem>09:00</asp:ListItem>
                                        <asp:ListItem>09:30</asp:ListItem>
                                        <asp:ListItem>10:00</asp:ListItem>
                                        <asp:ListItem>10:30</asp:ListItem>
                                        <asp:ListItem>11:00</asp:ListItem>
                                        <asp:ListItem>11:30</asp:ListItem>
                                        <asp:ListItem>12:00</asp:ListItem>
                                        <asp:ListItem>12:30</asp:ListItem>
                                        <asp:ListItem>13:00</asp:ListItem>
                                        <asp:ListItem>13:30</asp:ListItem>
                                        <asp:ListItem>14:00</asp:ListItem>
                                        <asp:ListItem>14:30</asp:ListItem>
                                        <asp:ListItem>15:00</asp:ListItem>
                                        <asp:ListItem>15:30</asp:ListItem>
                                        <asp:ListItem>16:00</asp:ListItem>
                                        <asp:ListItem>16:30</asp:ListItem>
                                        <asp:ListItem>17:00</asp:ListItem>
                                        <asp:ListItem>17:30</asp:ListItem>
                                        <asp:ListItem>18:00</asp:ListItem>
                                        <asp:ListItem>18:30</asp:ListItem>
                                        <asp:ListItem>19:00</asp:ListItem>
                                        <asp:ListItem>19:30</asp:ListItem>
                                        <asp:ListItem>20:00</asp:ListItem>
                                        <asp:ListItem>20:30</asp:ListItem>
                                        <asp:ListItem>21:00</asp:ListItem>
                                        <asp:ListItem>21:30</asp:ListItem>
                                        <asp:ListItem>22:00</asp:ListItem>
                                        <asp:ListItem>22:30</asp:ListItem>
                                        <asp:ListItem>23:00</asp:ListItem>
                                        <asp:ListItem>23:30</asp:ListItem>
                                        <asp:ListItem>24:00</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp; Drop-Off time:<asp:DropDownList ID="ddCarDropUpTime" runat="server" Height="18px" Width="58px">
                                        <asp:ListItem>00:00</asp:ListItem>
                                        <asp:ListItem>00:30</asp:ListItem>
                                        <asp:ListItem>01:00</asp:ListItem>
                                        <asp:ListItem>01:30</asp:ListItem>
                                        <asp:ListItem>02:00</asp:ListItem>
                                        <asp:ListItem>02:30</asp:ListItem>
                                        <asp:ListItem>03:00</asp:ListItem>
                                        <asp:ListItem>03:30</asp:ListItem>
                                        <asp:ListItem>04:00</asp:ListItem>
                                        <asp:ListItem>04:30</asp:ListItem>
                                        <asp:ListItem>05:00</asp:ListItem>
                                        <asp:ListItem>05:30</asp:ListItem>
                                        <asp:ListItem>06:00</asp:ListItem>
                                        <asp:ListItem>06:30</asp:ListItem>
                                        <asp:ListItem>07:00</asp:ListItem>
                                        <asp:ListItem>07:30</asp:ListItem>
                                        <asp:ListItem>08:00</asp:ListItem>
                                        <asp:ListItem>08:30</asp:ListItem>
                                        <asp:ListItem>09:00</asp:ListItem>
                                        <asp:ListItem>09:30</asp:ListItem>
                                        <asp:ListItem>10:00</asp:ListItem>
                                        <asp:ListItem>10:30</asp:ListItem>
                                        <asp:ListItem>11:00</asp:ListItem>
                                        <asp:ListItem>11:30</asp:ListItem>
                                        <asp:ListItem>12:00</asp:ListItem>
                                        <asp:ListItem>12:30</asp:ListItem>
                                        <asp:ListItem>13:00</asp:ListItem>
                                        <asp:ListItem>13:30</asp:ListItem>
                                        <asp:ListItem>14:00</asp:ListItem>
                                        <asp:ListItem>14:30</asp:ListItem>
                                        <asp:ListItem>15:00</asp:ListItem>
                                        <asp:ListItem>15:30</asp:ListItem>
                                        <asp:ListItem>16:00</asp:ListItem>
                                        <asp:ListItem>16:30</asp:ListItem>
                                        <asp:ListItem>17:00</asp:ListItem>
                                        <asp:ListItem>17:30</asp:ListItem>
                                        <asp:ListItem>18:00</asp:ListItem>
                                        <asp:ListItem>18:30</asp:ListItem>
                                        <asp:ListItem>19:00</asp:ListItem>
                                        <asp:ListItem>19:30</asp:ListItem>
                                        <asp:ListItem>20:00</asp:ListItem>
                                        <asp:ListItem>20:30</asp:ListItem>
                                        <asp:ListItem>21:00</asp:ListItem>
                                        <asp:ListItem>21:30</asp:ListItem>
                                        <asp:ListItem>22:00</asp:ListItem>
                                        <asp:ListItem>22:30</asp:ListItem>
                                        <asp:ListItem>23:00</asp:ListItem>
                                        <asp:ListItem>23:30</asp:ListItem>
                                        <asp:ListItem>24:00</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp; Country:
                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                        <asp:ListItem>Canada</asp:ListItem>
                                        <asp:ListItem>US</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;&nbsp; Notes:
                                    <asp:TextBox ID="txtCarNotes" runat="server" Height="16px" Width="289px"></asp:TextBox>
                                    </strong>
                                    <p>
                                        <asp:Label ID="lblReminders" runat="server" CssClass="auto-style6" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Height="46px" Width="1561px"></asp:Label>
                                    </p>
                                </asp:Panel>
                                <p class="auto-style45">
                                    &nbsp;<asp:CheckBox ID="chckHotel" runat="server" OnCheckedChanged="chckHotel_CheckedChanged" Text="Are you looking to book Hotel?" AutoPostBack="true"/>
                                </p>
                                <asp:Panel ID="Panel6" runat="server" EnableTheming="True" BorderColor="Black" Enabled="False">
                                    <p class="auto-style38">
                                        One King/Two Queen:
                                        <asp:DropDownList ID="ddBedSize" runat="server" Height="23px" Width="89px">
                                            <asp:ListItem>One King</asp:ListItem>
                                            <asp:ListItem>Two Queen</asp:ListItem>
                                            <asp:ListItem>Either</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp; Hotel Preferences:
                                        <asp:TextBox ID="txtHotelPref" runat="server" Height="19px" Width="153px"></asp:TextBox>
                                        &nbsp; Country:
                                        <asp:DropDownList ID="DropDownList3" runat="server">
                                            <asp:ListItem>Canada</asp:ListItem>
                                            <asp:ListItem>US</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp; Hotel Reward#:
                                        <asp:TextBox ID="txtHotelReward" runat="server" Height="19px" Width="153px"></asp:TextBox>
                                        &nbsp; Notes:
                                        <asp:TextBox ID="txtHotelNotes" runat="server" Height="16px" Width="507px"></asp:TextBox>
                                    </p>
                                </asp:Panel>
                            </asp:Panel>
                            </strong>
                <br />

                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                &nbsp;<asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Height="36px" Width="145px" />
            </div>
    </form>
</body>
</html>
