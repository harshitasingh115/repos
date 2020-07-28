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
        .auto-style31 {
            left: 35%;
            height: 74%;
            position: absolute;
            z-index: 0;
            top: 313px;
            width: 37%;
            margin-left: 0px;
        }
        .auto-style33 {
            margin-left: 720px;
        }
        .auto-style34 {
            margin-top: 0px;
            margin-left: 0px;
        }
        .auto-style36 {
            width: 447px;
            text-align: center;
        }
        .auto-style38 {
            margin-top: 11px;
        }
        .auto-style40 {
            text-align: right;
        }
        .auto-style41 {
            text-align: left;
            margin-left: 40px;
        }
        .auto-style42 {
            width: 447px;
            text-align: left;
        }
        .auto-style43 {
            width: 404px;
            text-align: left;
        }
    </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 100%; height:100%; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server">
            <div class="auto-style17">
            <h1>Travel&nbsp; <span class="auto-style19"><strong>Summary</strong></span></h1>
                <h2>Welcome:
            <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label>
                </h2>

         <h3 class="auto-style40">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnReview" runat="server" Height="31px" OnClick="btnReview_Click" Text="Review Request" Visible="False" Width="148px" />
        </h3>
                <p class="auto-style17">
            &nbsp;<asp:ImageButton ID="btnFlight" runat="server" CssClass="auto-style5" Height="80px" ImageUrl="~/Image/flight.png" Width="89px" OnClick="btnFlight_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="btnCar" runat="server" CssClass="auto-style6" Height="61px" ImageUrl="~/Image/car.PNG" Width="89px" OnClick="btnCar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="btnHotel" runat="server" CssClass="auto-style6" Height="79px" ImageUrl="~/Image/hotel.png" Width="79px" BorderColor="Black" OnClick="btnHotel_Click" />
        </p>
                <asp:Panel ID="Panel4" runat="server" BackColor="Gray" Height="41px">
                            
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
                        <div class="auto-style41">
                        <asp:Panel ID="Panel2" runat="server" Width="35%" Height="100%" CssClass="auto-style38" >
                            <p class="auto-style38">
                                One Way/Round Trip:
                                <asp:DropDownList ID="ddFlightWay" runat="server" Height="20px" Width="79px">
                                    <asp:ListItem>One Way</asp:ListItem>
                                    <asp:ListItem>Round Way</asp:ListItem>
                                </asp:DropDownList>
                            </p>
                            <p class="auto-style38">
                                Desired Time for Departure Flight:
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
                            </p>
                            <p class="auto-style38">
                                Desired Time for Arrival Flight:
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
                            </p>
                            <p class="auto-style38">
                                Flyer Program#:
                                <asp:TextBox ID="txtProgram0" runat="server" Height="16px" Width="75px"></asp:TextBox>
                            </p>
                            <p class="auto-style38">
                                Window/Aisle:<strong>
                                <asp:DropDownList ID="ddWindow" runat="server" Height="20px" Width="78px">
                                    <asp:ListItem>Window</asp:ListItem>
                                    <asp:ListItem>Aisle</asp:ListItem>
                                </asp:DropDownList>
                                </strong>
                            </p>
                            <p class="auto-style38">
                                Country:
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>Canada</asp:ListItem>
                                    <asp:ListItem>US</asp:ListItem>
                                </asp:DropDownList>
                            </p>
                            <h3 class="auto-style17"><strong>Airport Service:</strong></h3>
                            <p class="auto-style43">
                                <asp:Label ID="lblLocation" runat="server" Text="PickUp Location:"></asp:Label>
                                &nbsp;&nbsp;<asp:TextBox ID="txtAirportPickUp" runat="server" Height="16px" Width="88px"></asp:TextBox>
                                <p class="auto-style38">
                                    <asp:Label ID="lblClosest" runat="server" Text="Closest Intersection for PickUp:"></asp:Label>
                                    &nbsp;<asp:TextBox ID="txtAirportCloseIntersection" runat="server" Height="16px" Width="113px"></asp:TextBox>
                                </p>
                                <p class="auto-style38">
                                    Destination:
                                    <asp:TextBox ID="txtAirportDestionation" runat="server" Height="16px" Width="161px"></asp:TextBox>
                                    <p class="auto-style38">
                                        Notes:
                                        <asp:TextBox ID="txtAirportFlightNotes" runat="server" Height="16px" Width="289px"></asp:TextBox>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                </p>
                            </p>

                </asp:Panel>
                </div>
                <div class="auto-style33">
                   <asp:Panel ID="Panel3" runat="server" Style="left: 50%; margin-left: -300px;">
                <p class="auto-style36">
                    &nbsp;National/Enterprise:
                    <asp:DropDownList ID="ddCarNational" runat="server" Height="27px" Width="91px">
                        <asp:ListItem>National</asp:ListItem>
                        <asp:ListItem>Enterprise</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;<strong>&nbsp;</strong></p>
                                       <p class="auto-style36">
                                           Emerald #:<asp:TextBox ID="txtCarEmerald" runat="server" Height="21px" Width="99px"></asp:TextBox>
                                           &nbsp;&nbsp;</p>
                        <p class="auto-style36">
                            Type of Vehicles:
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
                            &nbsp;&nbsp;<strong>&nbsp;</strong></p>
                       <p class="auto-style36">
                           Pick-Up time:&nbsp;<asp:DropDownList ID="ddCarPickUpTime" runat="server" Height="18px" Width="58px">
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
                       </p>
                       <p class="auto-style36">
                           Drop-Off time:<asp:DropDownList ID="ddCarDropUpTime" runat="server" Height="18px" Width="58px">
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
                       </p>
                       <p class="auto-style36">
                           Country:
                           <asp:DropDownList ID="DropDownList2" runat="server">
                               <asp:ListItem>Canada</asp:ListItem>
                               <asp:ListItem>US</asp:ListItem>
                           </asp:DropDownList>
                       </p>
                        <p class="auto-style36">
                            &nbsp; Notes:
                            <asp:TextBox ID="txtCarNotes" runat="server" Height="16px" Width="289px"></asp:TextBox>
                       </p>
                        <p class="auto-style36">
                            <asp:Label ID="lblReminders" runat="server" CssClass="auto-style6" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Height="128px" Width="431px"></asp:Label>
                       </p>
                        </asp:Panel>
                                       <div class="auto-style40">
                                       <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right" Width="91%" Height="100%" CssClass="auto-style34">
                                           <p class="auto-style38">
                                               &nbsp;&nbsp;One King/Two Queen:
                                               <asp:DropDownList ID="ddBedSize" runat="server" Height="23px" Width="89px">
                                                   <asp:ListItem>One King</asp:ListItem>
                                                   <asp:ListItem>Two Queen</asp:ListItem>
                                                   <asp:ListItem>Either</asp:ListItem>
                                               </asp:DropDownList>
                                           </p>
                                           <p class="auto-style38">
                                               Hotel Preferences:
                                               <asp:TextBox ID="txtHotelPref" runat="server" Height="19px" Width="153px"></asp:TextBox>
                                           </p>
                                           <p class="auto-style38">
                                               Country:
                                               <asp:DropDownList ID="DropDownList3" runat="server">
                                                   <asp:ListItem>Canada</asp:ListItem>
                                                   <asp:ListItem>US</asp:ListItem>
                                               </asp:DropDownList>
                                           </p>
                                           <p class="auto-style38">
                                               Hotel Reward#: <asp:TextBox ID="txtHotelReward" runat="server" Height="19px" Width="153px"></asp:TextBox>
                                           </p>
                                           <p class="auto-style38">
                                               Notes:
                                               <asp:TextBox ID="txtHotelNotes" runat="server" Height="16px" Width="289px"></asp:TextBox>
                                           </p>
                       </asp:Panel>
                    </div>
                    <%--                                       </asp:Panel>--%>
                </div>
                   &nbsp;<br />
                <asp:Label ID="lblAlert" runat="server"></asp:Label>
                <br />

                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Height="36px" Width="145px" />
        </div>
    </form>
</body>
</html>
