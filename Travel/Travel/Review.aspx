<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Review.aspx.cs" Inherits="Travel.Review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"/>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
    <script type="text/javascript" lang="ja">
         $(function () {
            $("#<%=txtPickUpDate.ClientID%>").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "mm-dd-yy",
                yearRange: '2020:2050'
            });
        });
        </script>

    <script type="text/javascript">
        function sum()
        {
            var txtFirstNo1 = document.getElementById('txtHotelSubtotal').value;
            var txtSecondNo1 = document.getElementById('txtHotelHST').value;
            var result = parseFloat(txtFirstNo1) + parseFloat(txtSecondNo1);
            if (!isNaN(result))
            {
                document.getElementById('txtHotelGrandTotal').value = result;
            }
        }
        </script>

    
    <script type="text/javascript">
        function sum1()
        {
            var txtFirstNo2 = document.getElementById('txtFlightSubtotal').value;
            var txtSecondNo2 = document.getElementById('txtFlightHST').value;
            var result = parseFloat(txtFirstNo2) + parseFloat(txtSecondNo2);
            if (!isNaN(result))
            {
                document.getElementById('txtFlightGrandTotal').value = result;
            }
        }
        </script>

        <script type="text/javascript">
        function sum2()
        {
            var txtFirstNo5 = document.getElementById('txtCarSubtotal').value;
            var txtSecondNo5 = document.getElementById('txtCarHST').value;
            var result = parseFloat(txtFirstNo5) + parseFloat(txtSecondNo5);
            if (!isNaN(result))
            {
                document.getElementById('txtCarGrandTotal').value = result;
            }
        }
  
        </script>

        <script type="text/javascript">
        function sum3()
        {
            var txtFirstNo4 = document.getElementById('txtAirportSubtotal').value;
            var txtSecondNo4 = document.getElementById('txtAirportHST').value;
	        var txtThirdNo4 = document.getElementById('txtAirportGratuity').value;
            var result = parseFloat(txtFirstNo4) + parseFloat(txtSecondNo4) + parseFloat(txtThirdNo4);
            if (!isNaN(result))
            {
                document.getElementById('txtAirportGrandTotal').value = result;
            }
        }
        </script>

    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
            text-align: center;
        }
        .auto-style6 {
            text-align: center;
            margin-left: 55px;
        }
        .auto-style7 {
            width: 1629px;
            text-align: center;
            margin-left: 6px;
            margin-right: 1px;
        }
        .auto-style8 {
            text-align: center;
            margin-left: 39px;
        }
        .auto-style9 {
            margin-top: 6px;
        }
        .auto-style10 {
            text-align: center;
            margin-left: 27px;
            margin-bottom: 0px;
        }
        .auto-style21 {
            text-align: center;
        }
        .auto-style24 {
            margin-right: 0px;
        }
        </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 99%; height: 2308px; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server">
        <div>
            <br />
            <h1 class="auto-style1"><strong>Travel Summary Detail:</strong></h1>
            <p class="auto-style7">
                <asp:Label ID="lblUser" runat="server" ForeColor="Red" Width="149px" Text="Label" Height="24px"></asp:Label>
        </p>
            <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>            <strong>            <asp:Button ID="btnClick"  Font-Bold="true" runat="server" Text="&gt;" Height="33px" Visible="false" Width="42px" OnClick="btnClick_Click"/>
            </strong>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTimeRequested" runat="server" Visible="False"></asp:Label>
            <div class="auto-style21">

            <asp:Panel ID="Panel1" runat="server" Height="18%" Width="99%">
                <asp:ImageButton ID="btnHotel" runat="server" CssClass="auto-style10" Height="76px" ImageUrl="~/Image/hotel.png" Width="76px" />
                    <br />
                <strong>
                <div class="auto-style21">
                    <asp:Panel ID="Panel4" runat="server" BorderColor="Black" Width="100%" BackColor="Gray">
                        <h3>&nbsp;&nbsp;REQUESTOR INFORMATION:</h3>
                        <h3>One King/Two Queen:
                            <asp:TextBox ID="txtBedSize" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;Hotel Preferences:
                            <asp:TextBox ID="txtHotelPref0" runat="server" Height="19px" Width="153px"></asp:TextBox>
                            &nbsp; Hotel Reward#:
                            <asp:TextBox ID="txtHotelReward0" runat="server" Height="20px" Width="122px"></asp:TextBox>
                            &nbsp; Notes:<asp:TextBox ID="txtHotelNotes" runat="server" Height="16px" Width="232px"></asp:TextBox>
                        </h3>
                        <h3>Departing City:
                            <asp:TextBox ID="txtHotelDepartCity" runat="server"></asp:TextBox>
                            &nbsp; Arrival City:
                            <asp:TextBox ID="txtHotelArrivalCity" runat="server"></asp:TextBox>
                            &nbsp; Check in:
                            <asp:TextBox ID="txtCheckIN0" runat="server" Height="22px" Width="121px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;Check out:
                            <asp:TextBox ID="txtCheckOut0" runat="server" Height="21px" Width="99px"></asp:TextBox>
                        </h3>
                    </asp:Panel>
                </div>
                </strong>
                    <br />
                    &nbsp;&nbsp; Confirmation#:
                    <asp:TextBox ID="txtHotelConf0" runat="server" Height="19px" Width="84px"></asp:TextBox>
                    &nbsp; One King/Two Queen:
                <asp:DropDownList ID="ddBedSize" runat="server" Height="18px" Width="89px">
                    <asp:ListItem>One King</asp:ListItem>
                    <asp:ListItem>Two Queen</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp; Pre-Auth Form Required:
                <asp:DropDownList ID="DropDownList4" runat="server" Height="24px" Width="64px">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                &nbsp; Hotel Phone#:
                <asp:TextBox ID="txtHotelNumber1" runat="server" Height="16px" Width="146px"></asp:TextBox>
                &nbsp;&nbsp; Hotel Name:
                <asp:TextBox ID="txtHotel0" runat="server" Height="17px" Width="159px"></asp:TextBox>
                &nbsp;<br />
                <br />
                &nbsp;&nbsp; Address:
                <asp:TextBox ID="txtHotelAddress" runat="server" CssClass="auto-style9" Height="16px" Width="190px"></asp:TextBox>
                &nbsp; City:
                    <asp:TextBox ID="txtHotelCity" runat="server" Height="20px" Width="107px"></asp:TextBox>
                    &nbsp; Province:
                    <asp:DropDownList ID="DropDownList5" runat="server" Height="21px" Width="52px">
                        <asp:ListItem>AB</asp:ListItem>
                        <asp:ListItem>BC</asp:ListItem>
                        <asp:ListItem>NB</asp:ListItem>
                        <asp:ListItem>NL</asp:ListItem>
                        <asp:ListItem>NS</asp:ListItem>
                        <asp:ListItem>MB</asp:ListItem>
                        <asp:ListItem>ON</asp:ListItem>
                        <asp:ListItem>PE</asp:ListItem>
                        <asp:ListItem>QC</asp:ListItem>
                        <asp:ListItem>SK</asp:ListItem>
                    </asp:DropDownList>
                &nbsp; Postal Code:
                <asp:TextBox ID="txtHotelPostalCode" runat="server"></asp:TextBox>
                &nbsp; Check In Time:<asp:TextBox ID="txtCheckInTime" runat="server" Height="16px" Width="79px"></asp:TextBox>
                &nbsp; Check Out Time:
                <asp:TextBox ID="txtCheckOutTime" runat="server" Height="17px" Width="73px"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp; Subtotal:
                <asp:TextBox ID="txtHotelSubtotal" runat="server" Height="16px" Width="70px" onkeyup="sum()" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;HST:
                <asp:TextBox ID="txtHotelHST" runat="server" Height="16px" Width="79px" onkeyup="sum()" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;Grand Total:
                <asp:TextBox ID="txtHotelGrandTotal" runat="server" Height="16px" Width="94px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblHotel" runat="server" Visible="False"></asp:Label>
            </asp:Panel>
                 </div>
                 <br />
                <br />
            <div class="auto-style21">
            <asp:Panel ID="Panel2" runat="server" Height="44%" Width="100%">
                <asp:ImageButton ID="btnFlight" runat="server" CssClass="auto-style8" Height="76px" ImageUrl="~/Image/flight.png" Width="79px"/>
                         &nbsp;&nbsp;<strong><div class="auto-style21">
                    <asp:Panel ID="Panel5" runat="server" BorderColor="Black" BackColor="Gray" Height="25%" Width="100%">
                        <h3>&nbsp; <strong>REQUESTOR INFORMATION:</strong>&nbsp;</h3>
                        <h3>One Way/Round Trip:
                            <asp:TextBox ID="txtTrip" runat="server" Height="18px" Width="79px"></asp:TextBox>
                            &nbsp;&nbsp;<strong>&nbsp;</strong>Desired Time for Departure Flight:
                            <asp:TextBox ID="txtFlightTime1" runat="server" Height="23px" Width="75px"></asp:TextBox>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong>Desired Time for Arrival Flight:
                            <asp:TextBox ID="txtDepartArrival1" runat="server" Height="19px" Width="51px"></asp:TextBox>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong>Flyer Program#:
                            <asp:TextBox ID="txtProgram1" runat="server" Height="19px" Width="72px"></asp:TextBox>
                            <strong>&nbsp;&nbsp;&nbsp;</strong></h3>
                        <h3><strong>&nbsp;</strong>Window/Aisle:
                            <asp:TextBox ID="txtWindow" runat="server" Height="16px" Width="86px"></asp:TextBox>
                            <strong>&nbsp; Departing City:
                            <asp:TextBox ID="txtFlightDepartCity" runat="server"></asp:TextBox>
                            &nbsp; Arrival City:
                            <asp:TextBox ID="txtFlightArrivalCity" runat="server" Width="118px"></asp:TextBox>
                            &nbsp; Check in:
                            <asp:TextBox ID="txtFlightCheckIN" runat="server" Height="22px" Width="121px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;Check out:
                            <asp:TextBox ID="txtFlightCheckOut" runat="server" Height="21px" Width="118px"></asp:TextBox>
                            </strong>
                        </h3>
                    </asp:Panel>
                </div>
                <br />
                &nbsp;&nbsp;
                </strong>
                Ticket#:
                <asp:TextBox ID="txtFlightTicket" runat="server" Height="17px" Width="107px"></asp:TextBox>
                &nbsp;&nbsp;Terminal:
                <asp:TextBox ID="txtFlightTerminal" runat="server" Height="19px" Width="120px"></asp:TextBox>
                &nbsp; Airline:
                <asp:TextBox ID="txtAirline" runat="server" Height="19px" Width="129px"></asp:TextBox>
                &nbsp; Booking Reference:
                <asp:TextBox ID="txtBookRefer" runat="server" Width="150px"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp; Departing Flight:
                             <asp:TextBox ID="txtDeparture0" runat="server" Height="18px" Width="147px"></asp:TextBox>
                             &nbsp;&nbsp;Departing Flight time:
                             <asp:TextBox ID="txtFlightTime0" runat="server" Height="19px" Width="150px"></asp:TextBox>
                             &nbsp;&nbsp;Departing Flight Arrival time:
                             <asp:TextBox ID="txtDepartArrival0" runat="server" Height="18px" Width="150px"></asp:TextBox>
                &nbsp;
                <br />
                <br />
                &nbsp;&nbsp; Return Flight:
                                 <asp:TextBox ID="txtReturn" runat="server" Width="150px"></asp:TextBox>
                                 &nbsp;&nbsp;Return Flight time:
                                 <asp:TextBox ID="txtReturnTime" runat="server" Width="150px"></asp:TextBox>
                                 &nbsp;&nbsp;Return Flight Arrival time:
                                 <asp:TextBox ID="txtReturnArrival" runat="server" Width="150px"></asp:TextBox>
                &nbsp;&nbsp;<br />
                <br />
                &nbsp;&nbsp; Subtotal:
                <asp:TextBox ID="txtFlightSubtotal" runat="server" Height="16px" Width="77px" onkeyup="sum1()" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;HST:
                <asp:TextBox ID="txtFlightHST" runat="server" Height="18px" Width="86px" onkeyup="sum1()" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;Grand Total:
                <asp:TextBox ID="txtFlightGrandTotal" runat="server" Height="16px" Width="94px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblAirport" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Panel ID="Panel7" runat="server" Height="25%" Width="99%">
                    <h2 class="auto-style21"><strong>Airport Transportation:</strong></h2>
                    <asp:Panel ID="Panel8" runat="server" Width="100%" BorderColor="Black" BackColor="Gray" >
                        <strong>
                        <h3 class="auto-style21">&nbsp;&nbsp; REQUESTOR INFORMATION:</h3>
                        <h3>One Way/Round Trip:
                            <asp:TextBox ID="txtTrip0" runat="server" Height="16px" Width="60px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;Destination:<asp:TextBox ID="txtAirportDestionation0" runat="server" Height="16px" Width="86px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;PickUp Location:
                            <asp:TextBox ID="txtAirportPickUp0" runat="server" Height="16px" Width="104px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;Closest Intersection for PickUp:
                            <asp:TextBox ID="txtCloseIntersection1" runat="server" Height="16px" Width="163px"></asp:TextBox>
                        </h3>
                        <h3>Departing City:
                            <asp:TextBox ID="txtFlightDepartCity0" runat="server"></asp:TextBox>
                            &nbsp; Arrival City:
                            <asp:TextBox ID="txtFlightArrivalCity0" runat="server" Width="118px"></asp:TextBox>
                            &nbsp; Check in:
                            <asp:TextBox ID="txtFlightCheckIN0" runat="server" Height="22px" Width="121px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;Check out:
                            <asp:TextBox ID="txtFlightCheckOut0" runat="server" Height="21px" Width="118px"></asp:TextBox>
                        </h3>
                        </strong>
                    </asp:Panel>
                    <br />
                    &nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp; Confirmation #:&nbsp;&nbsp;<asp:TextBox ID="txtAirportConfirm" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;Customer Service#:<asp:TextBox ID="txtCustomerService" runat="server"></asp:TextBox>
                    &nbsp; Pick Up Time:&nbsp;<asp:TextBox ID="txtPickUpTime" runat="server" Height="16px" Width="67px"></asp:TextBox>
                    &nbsp;&nbsp;Pick Up Date:&nbsp;<asp:TextBox ID="txtPickUpDate" runat="server" OnTextChanged="txtPickUpDate_TextChanged1"></asp:TextBox>
                    &nbsp;&nbsp;ETA at Airport:&nbsp;<asp:TextBox ID="txtETAAirport" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp; Subtotal:
                    <asp:TextBox ID="txtAirportSubtotal" runat="server" Height="16px" Width="56px" onkeyup="sum3()" ></asp:TextBox>
                    &nbsp;&nbsp;HST:&nbsp;<asp:TextBox ID="txtAirportHST" runat="server" Height="17px" Width="57px" onkeyup="sum3()"></asp:TextBox>
                    &nbsp;&nbsp;Gratuity:&nbsp;<asp:TextBox ID="txtAirportGratuity" runat="server" Height="16px" Width="48px" onkeyup="sum3()"></asp:TextBox>
                    &nbsp;&nbsp;Grand Total:&nbsp;<asp:TextBox ID="txtAirportGrandTotal" runat="server" Height="16px" Width="67px"></asp:TextBox>
                </asp:Panel>
                <br />
                &nbsp;&nbsp;
                <br />
                <br />
                <br />
                &nbsp;&nbsp;
                <asp:Label ID="lblReminder" runat="server" Font-Bold="true" ForeColor="Red" Text="Label"></asp:Label>
                <br />
                <br />
                &nbsp;&nbsp;
                <asp:Label ID="lblAirportReminder" runat="server" Font-Bold="true" ForeColor="Red" Text="Label"></asp:Label>
            </asp:Panel>
            </div>
            <br />
            <br />
            <div class="auto-style21">
            <asp:Panel ID="Panel3" runat="server" Height="22%" Width="100%" CssClass="auto-style24">
                            <asp:ImageButton ID="ImageButton3" runat="server" CssClass="auto-style6" Height="64px" ImageUrl="~/Image/car.PNG" Width="79px"/>
                            <strong>
                            <asp:Panel ID="Panel6" runat="server" Width="100%" BackColor="Gray" BorderColor="Black">
                                <h3 class="auto-style21">&nbsp;&nbsp; <strong>REQUESTOR INFORMATION:</strong></h3>
                                <h3>&nbsp;&nbsp;National/Enterprise:
                                    <asp:TextBox ID="txtCarNational0" runat="server" Height="16px" Width="94px"></asp:TextBox>
                                    &nbsp;&nbsp;Emerald #:<asp:TextBox ID="txtCarEmerald0" runat="server" Height="17px" Width="68px"></asp:TextBox>
                                    &nbsp;&nbsp;Type of Vehicles:&nbsp;<asp:TextBox ID="txtVehicle" runat="server"></asp:TextBox>
                                    &nbsp;&nbsp;&nbsp;&nbsp;Pick-Up time:<asp:TextBox ID="txtCarPickUpTime0" runat="server" Height="16px" Width="78px"></asp:TextBox>
                                    &nbsp;<strong>Drop-Off time:<asp:TextBox ID="txtCarDropUpTime0" runat="server" Height="16px" Width="80px"></asp:TextBox>
                                    </strong></h3>
                                <h3>&nbsp; Notes:
                                    <asp:TextBox ID="txtCarNotes" runat="server" Height="16px" Width="181px"></asp:TextBox>
                                    &nbsp; <strong>Departing City:
                                    <asp:TextBox ID="txtCarDepartCity" runat="server" Height="22px"></asp:TextBox>
                                    &nbsp; Arrival City:
                                    <asp:TextBox ID="txtCarArrivalCity" runat="server" Width="118px"></asp:TextBox>
                                    &nbsp; Check in:
                                    <asp:TextBox ID="txtCarCheckIN" runat="server" Height="22px" Width="121px"></asp:TextBox>
                                    &nbsp;&nbsp;&nbsp;Check out:
                                    <asp:TextBox ID="txtCarCheckOut" runat="server" Height="21px" Width="99px"></asp:TextBox>
                                    </strong></h3>
                            </asp:Panel>
                            <div class="auto-style21">
                            </div>
                            </strong>
                            <br />
                            &nbsp;&nbsp; Confirmation#:
                            <asp:TextBox ID="txtCarConfirmation0" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;Emerald Aisle(Y/N):
                            <asp:DropDownList ID="DropDownList6" runat="server" Width="100px">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp; Dealership Phone#:
                            <asp:TextBox ID="txtCarDealer0" runat="server" Height="20px" Width="144px"></asp:TextBox>
                            &nbsp;&nbsp; &nbsp;&nbsp;<br />
                            <br />
                            &nbsp;&nbsp; Pick-Up Location:&nbsp;<asp:TextBox ID="txtCarPick" runat="server" Height="25px" Width="151px"></asp:TextBox>
                            &nbsp; Pick-Up time:<asp:TextBox ID="txtCarPickUpTime" runat="server" Height="20px" Width="88px"></asp:TextBox>
                            &nbsp; Drop-Off Location:&nbsp;<asp:TextBox ID="txtCarDrop" runat="server" Height="21px" Width="154px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;Drop-Off time:<asp:TextBox ID="txtCarDropUpTime" runat="server" Height="17px" Width="79px"></asp:TextBox>
&nbsp;
                            <br />
                            <br />
                            &nbsp;&nbsp; Subtotal:
                            <asp:TextBox ID="txtCarSubtotal" runat="server" Height="16px" Width="56px" onkeyup="sum2()"></asp:TextBox>
                            &nbsp;&nbsp;HST:&nbsp;<asp:TextBox ID="txtCarHST" runat="server" Height="17px" Width="57px" onkeyup="sum2()" ></asp:TextBox>
                            &nbsp;&nbsp;Grand Total:&nbsp;<asp:TextBox ID="txtCarGrandTotal" runat="server" Height="16px" Width="67px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblCar" runat="server" Visible="False" Font-Bold="true"></asp:Label>
                            <br />
                            <br />
                            &nbsp;&nbsp;
                            <asp:Label ID="lblCarReminder" ForeColor="Red" runat="server" Font-Bold="true" Text="Label"></asp:Label>
                            <asp:Label ID="lblUserEmail" runat="server"></asp:Label>
                            &nbsp;
                            <asp:Label ID="lblFileRef" runat="server"></asp:Label>
                            <br />
                            <br />
                            Attachment:
                            <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="253px"></asp:TextBox>
                    &nbsp;
                            <asp:FileUpload ID="FileUploadControl" runat="server" Height="26px" Width="257px" />
                            <br />
                            <br />
                            <asp:Button ID="btnSaved" runat="server" Height="31px" OnClick="btnSaved_Click" Text="Saved" Width="172px" />

                            </div>

            </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
