using GemBox.Document;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Net.Mail;
using System.Net;
using System.Data;

namespace Travel
{
    public partial class Review : System.Web.UI.Page
    {
        public MySqlConnection connection;
        MysqlConn myConn = new MysqlConn();
        public int j
        {
            get
            {
                if (ViewState["j"] != null)
                    return int.Parse(ViewState["j"].ToString());
                else
                    return 1;
            }
            set { ViewState["j"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Init();
            // Set license key to use GemBox.Document in a Free mode.
            ComponentInfo.SetLicense("FREE-LIMITED-KEY");
            // Continue to use the component in a Trial mode when free limit is reached.
            ComponentInfo.FreeLimitReached += (sen, ev) => ev.FreeLimitReachedAction = FreeLimitReachedAction.ContinueAsTrial;
        }

        public void Init()
        {
            lblUser.Text = HttpUtility.UrlDecode(Request.QueryString["userName"]);
            //Response.Write(Request.QueryString["userFileReference"]);
            lblFileRef.Text = HttpUtility.UrlDecode(Request.QueryString["file_refer"]);
            //string correctPass = Request.QueryString["userName"];
            lblReminder.Text = "Reminder: Early check-in avail. 24 hrs before your scheduled flight. Checked baggage will cost $33.90 included HST.";
            lblAirportReminder.Text = "Reminder: After you land, you will depart from the airport within 30 minutes after check-in at transportation desk. Pearson Terminal 1: Please check in at Ground Transportation Desk -on Ground Level between door R & S, inside the building.After hours, your driver will be dispatched by Red Car Service.Pearson Terminal 3: Please check in at Ground Transportation Desk -on Arrivals Level between door C & D, inside the building.After hours, your driver will be dispatched by Red Car Service.";
            lblCarReminder.Text = "Reminders: 1) Full size sedans are the standard vehicle class for all business use as per the expense policy. Should you require an SUV (ie. transporting equipment/weather), you must get approval from your manager (include in notes). 2) You must have a valid drivers license in order to pick up a rental vehicle. 3) Should unfortunate events occur during your travels and you need roadside assistance, you can call (844) 556-4930 for assistance.";
            myConn.Conn();
            string correctPass = lblUser.Text;
            string fileRefer = lblFileRef.Text;
            if (myConn.OpenConnection() == true)
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM tms.travel_summary_hotel WHERE userName ='" +correctPass+ "' AND file_refer = '"+ fileRefer + "' AND date_completed = 'Not Entered' ORDER BY hotel_date_requested DESC LIMIT  1"))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = myConn.connection;
                    //myConn.OpenConnection();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if(sdr.Read())
                        {
                            txtBedSize.Text = sdr["hotel_BedSize"].ToString() == null ? "N/A" : sdr["hotel_BedSize"].ToString();
                            txtHotelPref0.Text = sdr["hotel_Preference"].ToString() == null ? "N/A" : sdr["hotel_Preference"].ToString();
                            txtHotelReward0.Text = sdr["hotel_Rewards"].ToString() == null ? "N/A" : sdr["hotel_Rewards"].ToString();
                            txtHotelNotes.Text = sdr["hotel_Notes"].ToString() == null ? "N/A" : sdr["hotel_Notes"].ToString();
                            txtCheckIN0.Text = sdr["checkIN"].ToString() == null ? "N/A" : sdr["checkIN"].ToString();
                            txtCheckOut0.Text = sdr["checkOUT"].ToString() == null ? "N/A" : sdr["checkOUT"].ToString();
                            txtHotelArrivalCity.Text = sdr["arrivalCity"].ToString() == null ? "N/A" : sdr["arrivalCity"].ToString();
                            txtHotelDepartCity.Text = sdr["departCity"].ToString() == null ? "N/A" : sdr["departCity"].ToString();
                        }
                    }
                }
                using (MySqlCommand cmd1 = new MySqlCommand("SELECT * FROM tms.travel_summary_airport air WHERE air.userName ='" + correctPass + "' AND file_refer = '" + fileRefer + "' AND air.date_completed = 'Not Entered' ORDER BY airport_date_requested DESC LIMIT  1"))
                {
                    cmd1.CommandType = System.Data.CommandType.Text;
                    cmd1.Connection = myConn.connection;
                    using (MySqlDataReader sdr1 = cmd1.ExecuteReader())
                    {
                        if(sdr1.Read())
                        {
                            txtTrip0.Text = sdr1["airport_trip"].ToString() == null ? "N/A" : sdr1["airport_trip"].ToString();
                            txtAirportDestionation0.Text = sdr1["airport_destination"].ToString() == null ? "N/A" : sdr1["airport_destination"].ToString();
                            txtAirportPickUp0.Text = sdr1["airport_pickUpAddress"].ToString() == null ? "N/A" : sdr1["airport_pickUpAddress"].ToString();
                            txtCloseIntersection1.Text = sdr1["airport_ClosestIntersection"].ToString() == null ? "N/A" : sdr1["airport_ClosestIntersection"].ToString();
                            txtFlightArrivalCity0.Text = sdr1["arrivalCity"].ToString() == null ? "N/A" : sdr1["arrivalCity"].ToString();
                            txtFlightDepartCity0.Text = sdr1["departCity"].ToString() == null ? "N/A" : sdr1["departCity"].ToString();
                            txtFlightCheckIN0.Text = sdr1["checkIN"].ToString() == null ? "N/A" : sdr1["checkIN"].ToString();
                            txtFlightCheckOut0.Text = sdr1["checkOUT"].ToString() == null ? "N/A" : sdr1["checkOUT"].ToString();
                        }
                    }
                }
                using (MySqlCommand cmd3 = new MySqlCommand("SELECT * FROM tms.travel_summary_flight flight WHERE flight.userName ='" + correctPass + "' AND file_refer = '" + fileRefer + "'  AND flight.date_completed = 'Not Entered' ORDER BY flight_date_requested DESC LIMIT  1"))
                {
                    cmd3.CommandType = System.Data.CommandType.Text;
                    cmd3.Connection = myConn.connection;
                    using (MySqlDataReader sdr1 = cmd3.ExecuteReader())
                    {
                        if (sdr1.Read())
                        {
                            txtTrip.Text = sdr1["flight_trip"].ToString() == null ? "N/A" : sdr1["flight_trip"].ToString();
                            txtFlightTime1.Text = sdr1["flight_desiredTimeCheckIN"].ToString() == null ? "N/A" : sdr1["flight_desiredTimeCheckIN"].ToString();
                            txtDepartArrival1.Text = sdr1["flight_desiredTimeCheckOUT"].ToString() == null ? "N/A" : sdr1["flight_desiredTimeCheckOUT"].ToString();
                            txtProgram1.Text = sdr1["flight_flyerNum"].ToString() == null ? "N/A" : sdr1["flight_flyerNum"].ToString();
                            txtWindow.Text = sdr1["flight_window"].ToString() == null ? "N/A" : sdr1["flight_window"].ToString();
                            //txtAirportPickUp.Text = sdr1["airport_pickUpAddress"].ToString() == null ? "N/A" : sdr1["airport_pickUpAddress"].ToString();
                            //txtCloseIntersection0.Text = sdr1["airport_ClosestIntersection"].ToString() == null ? "N/A" : sdr1["airport_ClosestIntersection"].ToString();
                            txtFlightArrivalCity.Text = sdr1["arrivalCity"].ToString() == null ? "N/A" : sdr1["arrivalCity"].ToString();
                            txtFlightDepartCity.Text = sdr1["departCity"].ToString() == null ? "N/A" : sdr1["departCity"].ToString();
                            txtFlightCheckIN.Text = sdr1["checkIN"].ToString() == null ? "N/A" : sdr1["checkIN"].ToString();
                            txtFlightCheckOut.Text = sdr1["checkOUT"].ToString() == null ? "N/A" : sdr1["checkOUT"].ToString();
                        }
                    }
                }
                using (MySqlCommand cmd2 = new MySqlCommand("SELECT * FROM tms.travel_summary_car WHERE userName ='" + correctPass + "' AND file_refer = '" + fileRefer + "' AND date_completed = 'Not Entered' ORDER BY car_date_requested DESC LIMIT  1"))
                {
                    cmd2.CommandType = System.Data.CommandType.Text;
                    cmd2.Connection = myConn.connection;
                    using (MySqlDataReader sdr2 = cmd2.ExecuteReader())
                    {
                        if (sdr2.Read())
                        {
                            txtCarNational0.Text = sdr2["car_NationalEnterprise"].ToString() == null ? "N/A" : sdr2["car_NationalEnterprise"].ToString();
                            //txtCarNational0.Text = sdr2["car_NationalEnterprise"].ToString();
                            txtCarEmerald0.Text = sdr2["car_EmeraldClub"].ToString() == null ? "N/A" : sdr2["car_EmeraldClub"].ToString();
                            txtVehicle.Text = sdr2["car_typeOfVehicle"].ToString() == null ? "N/A" : sdr2["car_typeOfVehicle"].ToString();
                            txtCarPickUpTime0.Text = sdr2["car_PickUpTime"].ToString() == null ? "N/A" : sdr2["car_PickUpTime"].ToString();
                            txtCarDropUpTime0.Text = sdr2["car_DropOFFTime"].ToString() == null ? "N/A" : sdr2["car_DropOFFTime"].ToString();
                            txtCarNotes.Text = sdr2["car_Notes"].ToString() == null ? "N/A" : sdr2["car_Notes"].ToString();
                            txtCarArrivalCity.Text = sdr2["arrivalCity"].ToString() == null ? "N/A" : sdr2["arrivalCity"].ToString();
                            txtCarDepartCity.Text = sdr2["departCity"].ToString() == null ? "N/A" : sdr2["departCity"].ToString();
                            txtCarCheckIN.Text = sdr2["checkIN"].ToString() == null ? "N/A" : sdr2["checkIN"].ToString();
                            txtCarCheckOut.Text = sdr2["checkOUT"].ToString() == null ? "N/A" : sdr2["checkOUT"].ToString();

                        }
                    }
                }
            }
            myConn.CloseConnection();
            DropDownList5.SelectedValue = "ON";
        }

        protected void btnClick_Click(object sender, EventArgs e)
        {
            j++;
            if (j == 1)
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;

            }
            else if (j == 2)
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
                Panel3.Visible = false;
            }
            else if (j == 3)
            {
                Panel3.Visible = true;
                Panel1.Visible = false;
                Panel2.Visible = false;
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            // Render ASPX page as HTML formatted string.
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.Render(htw);

            // Load HTML text to DocumentModel.
            string html = sw.ToString();
            DocumentModel document = new DocumentModel();
            document.Content.LoadText(html, LoadOptions.HtmlDefault);

            // Convert ASPX to PDF by exporting, downloading,
            // DocumentModel in PDF format from ASP.NET application.
            document.Save(this.Response, "TravelSummary.pdf");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    this.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }

        protected void txtPickUpDate_TextChanged(object sender, EventArgs e)
        {
            txtPickUpDate.Text = DateTime.ParseExact(txtPickUpDate.Text, "mm-dd-yyyy", null).ToString("mm-dd-yyyy");
        }

        protected void btnSaved_Click(object sender, EventArgs e)
        {
            //string fileReference;
            int j = 1;
            string correctPass = lblUser.Text;
            string fileRefer = lblFileRef.Text;
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string fileDate = DateTime.Now.ToString();
                string fileStringData = fileDate.Substring(6, 2);
                ////string fileDetail = "SELECT SUBSTRING(airport.date_completed, 9, 2) AS File_Number FROM tms.travel_summary sum JOIN tms.travel_summary_airport airport ON airport.userName = sum.userName WHERE airport.date_completed != 'Not Entered' GROUP by sum.userName";
                ////string fileDetail = "SELECT GREATEST(hotel.file_refer,car.file_refer,flight.file_refer,airport.file_refer) AS File_Number FROM tms.travel_summary sum JOIN tms.travel_summary_hotel hotel ON hotel.userName = sum.userName JOIN tms.travel_summary_car car ON car.userName = sum.userName JOIN tms.travel_summary_flight flight ON flight.userName = sum.userName JOIN tms.travel_summary_airport airport ON airport.userName = sum.userName WHERE hotel.date_completed IS NOT NULL OR car.date_completed IS NOT NULL OR flight.date_completed IS NOT NULL  OR airport.date_completed IS NOT NULL";
                //string fileDetail = "SELECT SUBSTRING(hotel.file_refer,4,3) AS Hotel, Substring(car.file_refer,4,3) AS Car, Substring(flight.file_refer,4,3) AS Flight, SUBSTRING(airport.file_refer,4,3) AS Airport FROM tms.travel_summary sum  LEFT JOIN tms.travel_summary_hotel hotel ON hotel.userName = sum.userName LEFT JOIN tms.travel_summary_car car ON car.userName = sum.userName LEFT JOIN tms.travel_summary_flight flight ON flight.userName = sum.userName LEFT JOIN tms.travel_summary_airport airport ON airport.userName = sum.userName WHERE hotel.date_completed != 'Not Entered' OR car.date_completed != 'Not Entered' OR flight.date_completed != 'Not Entered'  OR airport.date_completed != 'Not Entered'ORDER BY hotel.date_completed,car.date_completed,flight.date_completed,airport.date_completed DESC LIMIT 1";
                //MySqlCommand mySqlCommand = new MySqlCommand(fileDetail, myConn.connection);
                //MySqlDataReader mySqlDataReader;
                //mySqlDataReader = mySqlCommand.ExecuteReader();
                //List<int> fileRefVal = new List<int>();
                //if (mySqlDataReader.HasRows)
                //{
                //    while (mySqlDataReader.Read())
                //    {
                //        if(mySqlDataReader["Hotel"].GetType().GetProperties().Any())
                //        {
                //            fileRefVal.Add(Convert.ToInt16(mySqlDataReader["Hotel"]));
                //        }
                //        if (mySqlDataReader["Car"].GetType().GetProperties().Any())
                //        {
                //            fileRefVal.Add(Convert.ToInt16(mySqlDataReader["Car"]));
                //        }
                //        if (mySqlDataReader["Flight"].GetType().GetProperties().Any())
                //        {
                //            fileRefVal.Add(Convert.ToInt16(mySqlDataReader["Flight"]));
                //        }
                //        if (mySqlDataReader["Airport"].GetType().GetProperties().Any())
                //        {
                //            fileRefVal.Add(Convert.ToInt16(mySqlDataReader["Airport"]));
                //        }
                //    }
                //}
                //var tempRefVal = fileRefVal.Max();
                //string temp = "";
                //int dataInsert = tempRefVal + j;
                //if (fileStringData.StartsWith("20"))
                //{
                //    temp = fileStringData.ToString() + "001";
                //}
                ////if (mySqlDataReader["File_Number"] != "")
                ////{
                ////temp = mySqlDataReader["File_Number"].ToString();
                ////int fileReferData = Convert.ToInt16(temp.Split('-').Last());
                //if (tempRefVal <= 9)
                //{
                //    temp = fileStringData + "-00" + dataInsert;
                //}
                //else if (j <= 99)
                //{
                //    temp = fileStringData + "-0" + dataInsert;
                //}
                //else
                //{
                //    temp = fileStringData + "-" + dataInsert;
                //}
                ////}
                //mySqlDataReader.Close();
                //mySqlDataReader.Dispose();
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM tms.travel_summary_hotel WHERE userName ='" + correctPass + "' AND file_refer = '" + fileRefer + "' AND date_completed = 'Not Entered' ORDER BY hotel_date_requested DESC LIMIT  1"))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = myConn.connection;
                    //myConn.OpenConnection();
                   
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if(sdr.Read())
                        {
                            txtBedSize.Text = sdr["hotel_BedSize"].ToString();
                            txtHotelPref0.Text = sdr["hotel_Preference"].ToString();
                            txtHotelReward0.Text = sdr["hotel_Rewards"].ToString();
                            txtHotelNotes.Text = sdr["hotel_Notes"].ToString();
                            txtCheckIN0.Text = sdr["checkIN"].ToString();
                            txtCheckOut0.Text = sdr["checkOUT"].ToString();
                            txtHotelArrivalCity.Text = sdr["arrivalCity"].ToString();
                            txtHotelDepartCity.Text = sdr["departCity"].ToString();
                            lblHotel.Text = sdr["hotel_date_requested"].ToString();
                        }
                    }
                    string currentDate = DateTime.Now.ToString();
                    string insertRev = "UPDATE tms.travel_summary_hotel SET hotel_CONHotelName = '" + txtHotel0.Text + "', hotel_CONHotelAddress = '" + txtHotelAddress.Text + "', hotel_CONHotelConfirmationNum = '" + txtHotelConf0.Text + "', hotel_CONBed ='"+ddBedSize.Text+"', hotel_CONHotelCity = '" + txtHotelCity.Text + "', hotel_CONHotelPostal = '" + txtHotelPostalCode.Text + "', hotel_CONHotelPhone = '" + txtHotelNumber1.Text + "',hotel_CONcheckIN = '"+txtCheckInTime.Text+"', hotel_CONcheckOut = '"+txtCheckOutTime.Text+ "', hotel_CONAuthForm = '"+DropDownList4.Text+"', hotel_CONSubtotal = '"+txtHotelSubtotal.Text+"', hotel_CONHST = '"+txtHotelHST.Text+"',hotel_CONGrandTotal = '"+txtHotelGrandTotal.Text+ "', date_completed = '"+ currentDate + "' WHERE (userName = '" + lblUser.Text+"' AND arrivalCity = '"+txtHotelArrivalCity.Text+"' AND departCity = '"+txtHotelDepartCity.Text+"' AND checkIN = '"+txtCheckIN0.Text+"' AND checkOut= '"+txtCheckOut0.Text+"' AND hotel_Preference= '"+txtHotelPref0.Text+"' AND hotel_BedSize= '"+txtBedSize.Text+"' AND hotel_Rewards= '"+txtHotelReward0.Text+"' AND hotel_Notes = '"+txtHotelNotes.Text+ "' AND hotel_date_requested ='"+lblHotel.Text+ "' AND file_refer = '" + fileRefer + "')";
                    MySqlCommand cm1 = new MySqlCommand(insertRev,myConn.connection);
                    cm1.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated for Hotel.')", true);
                }
                using (MySqlCommand cmd1 = new MySqlCommand("SELECT * FROM tms.travel_summary_airport air JOIN tms.travel_summary_flight ON tms.travel_summary_flight.flight_date_requested = air.airport_date_requested WHERE air.userName ='" + correctPass + "' AND air.date_completed = 'Not Entered' ORDER BY flight_date_requested DESC LIMIT  1"))
                {
                    cmd1.CommandType = System.Data.CommandType.Text;
                    cmd1.Connection = myConn.connection;

                        using (MySqlDataReader sdr1 = cmd1.ExecuteReader())
                        {
                            if (sdr1.Read())
                            {
                                txtTrip0.Text = sdr1["airport_trip"].ToString() == null ? "N/A" : sdr1["airport_trip"].ToString();
                                txtAirportDestionation0.Text = sdr1["airport_destination"].ToString() == null ? "N/A" : sdr1["airport_destination"].ToString();
                                txtAirportPickUp0.Text = sdr1["airport_pickUpAddress"].ToString() == null ? "N/A" : sdr1["airport_pickUpAddress"].ToString();
                                txtCloseIntersection1.Text = sdr1["airport_ClosestIntersection"].ToString() == null ? "N/A" : sdr1["airport_ClosestIntersection"].ToString();
                                txtFlightArrivalCity0.Text = sdr1["arrivalCity"].ToString() == null ? "N/A" : sdr1["arrivalCity"].ToString();
                                txtFlightDepartCity0.Text = sdr1["departCity"].ToString() == null ? "N/A" : sdr1["departCity"].ToString();
                                txtFlightCheckIN0.Text = sdr1["checkIN"].ToString() == null ? "N/A" : sdr1["checkIN"].ToString();
                                txtFlightCheckOut0.Text = sdr1["checkOUT"].ToString() == null ? "N/A" : sdr1["checkOUT"].ToString();
                            }
                        }

                    string currentDate = DateTime.Now.ToString();
                    string insertRev1 = "UPDATE tms.travel_summary_airport air SET airport_CONConfirmation = '" + txtAirportConfirm.Text + "',  airport_CONCustPhone = '" + txtCustomerService.Text + "', airport_CONPickUpTime = '" + txtPickUpTime.Text + "', airport_CONDate = '" + txtPickUpDate.Text + "', airport_CONETA = '" + txtETAAirport.Text + "',airport_CONSubtotal = '" + txtAirportSubtotal.Text + "', airport_CONHST = '" + txtAirportHST.Text + "', airport_CONGratuity = '" + txtAirportGratuity.Text + "', airport_CONGrandTotal = '" + txtAirportGrandTotal.Text + "', date_completed = '" + currentDate + "' WHERE (userName = '" + lblUser.Text + "' AND arrivalCity = '" + txtFlightArrivalCity0.Text + "' AND departCity = '" + txtFlightDepartCity0.Text + "' AND checkIN = '" + txtFlightCheckIN0.Text + "' AND checkOut= '" + txtFlightCheckOut0.Text + "' AND airport_trip ='" + txtTrip0.Text + "' AND airport_destination = '" + txtAirportDestionation0.Text + "' AND airport_pickUpAddress = '" + txtAirportPickUp0.Text + "' AND airport_ClosestIntersection = '" + txtCloseIntersection1.Text + "' AND file_refer = '" + fileRefer + "')";
                    MySqlCommand cm2 = new MySqlCommand(insertRev1, myConn.connection);
                    cm2.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated for Airport and Flight.')", true);

                }

                using (MySqlCommand cmd3 = new MySqlCommand("SELECT * FROM tms.travel_summary_flight flight WHERE flight.userName ='" + correctPass + "' AND file_refer = '" + fileRefer + "'  AND flight.date_completed = 'Not Entered' ORDER BY flight_date_requested DESC LIMIT  1"))
                    {
                        cmd3.CommandType = System.Data.CommandType.Text;
                        cmd3.Connection = myConn.connection;
                        using (MySqlDataReader sdr1 = cmd3.ExecuteReader())
                        {
                            if (sdr1.Read())
                            {
                                txtTrip.Text = sdr1["flight_trip"].ToString() == null ? "N/A" : sdr1["flight_trip"].ToString();
                                txtFlightTime1.Text = sdr1["flight_desiredTimeCheckIN"].ToString() == null ? "N/A" : sdr1["flight_desiredTimeCheckIN"].ToString();
                                txtDepartArrival1.Text = sdr1["flight_desiredTimeCheckOUT"].ToString() == null ? "N/A" : sdr1["flight_desiredTimeCheckOUT"].ToString();
                                txtProgram1.Text = sdr1["flight_flyerNum"].ToString() == null ? "N/A" : sdr1["flight_flyerNum"].ToString();
                                txtWindow.Text = sdr1["flight_window"].ToString() == null ? "N/A" : sdr1["flight_window"].ToString();
                                //txtAirportPickUp.Text = sdr1["airport_pickUpAddress"].ToString() == null ? "N/A" : sdr1["airport_pickUpAddress"].ToString();
                                //txtCloseIntersection0.Text = sdr1["airport_ClosestIntersection"].ToString() == null ? "N/A" : sdr1["airport_ClosestIntersection"].ToString();
                                txtFlightArrivalCity.Text = sdr1["arrivalCity"].ToString() == null ? "N/A" : sdr1["arrivalCity"].ToString();
                                txtFlightDepartCity.Text = sdr1["departCity"].ToString() == null ? "N/A" : sdr1["departCity"].ToString();
                                txtFlightCheckIN.Text = sdr1["checkIN"].ToString() == null ? "N/A" : sdr1["checkIN"].ToString();
                                txtFlightCheckOut.Text = sdr1["checkOUT"].ToString() == null ? "N/A" : sdr1["checkOUT"].ToString();
                            }
                        }
                    string currentDate = DateTime.Now.ToString();
                    string insertRev2 = "UPDATE tms.travel_summary_flight flight SET flight_CONtickNum = '" + txtFlightTicket.Text + "', flight_CONTerminal = '" + txtFlightTerminal.Text + "', flight_CONAirline = '" + txtAirline.Text + "', flight_CONBookingRefer = '" + txtBookRefer.Text + "', flight_CONdepartingNum = '" + txtDeparture0.Text + "', flight_CONdepartingTime = '" + txtFlightTime0.Text + "',flight_CONdepartimeArrivalTime = '" + txtDepartArrival0.Text + "', flight_CONReturnNum = '" + txtReturn.Text + "', flight_CONReturnTime = '" + txtReturnTime.Text + "', flight_CONreturnArrivalTime = '" + txtReturnArrival.Text + "', flight_CONSubtotal = '" + txtFlightSubtotal.Text + "',flight_CONHST = '" + txtFlightHST.Text + "', flight_CONGrandTotal ='" + txtFlightGrandTotal.Text + "', date_completed = '" + currentDate + "' WHERE (userName = '" + lblUser.Text + "' AND arrivalCity = '" + txtFlightArrivalCity.Text + "' AND departCity = '" + txtFlightDepartCity.Text + "' AND checkIN = '" + txtFlightCheckIN.Text + "' AND checkOut= '" + txtFlightCheckOut.Text + "' AND flight_trip= '" + txtTrip.Text + "' AND flight_desiredTimeCheckIN= '" + txtFlightTime1.Text + "' AND flight_desiredTimeCheckOUT= '" + txtDepartArrival1.Text + "' AND flight_flyerNum = '" + txtProgram1.Text + "' AND flight_window ='" + txtWindow.Text + "' AND file_refer = '" + fileRefer + "')";
                    MySqlCommand cm3 = new MySqlCommand(insertRev2, myConn.connection);
                    cm3.ExecuteNonQuery();
                }

                using (MySqlCommand cmd4 = new MySqlCommand("SELECT * FROM tms.travel_summary_car WHERE userName ='" + correctPass + "' AND file_refer = '" + fileRefer + "'  AND date_completed = 'Not Entered' ORDER BY car_date_requested DESC LIMIT  1"))
                {
                    string currentDate = DateTime.Now.ToString();
                    cmd4.CommandType = System.Data.CommandType.Text;
                    cmd4.Connection = myConn.connection;
                    using (MySqlDataReader sdr2 = cmd4.ExecuteReader())
                    {
                        if (sdr2.Read())
                        {
                            txtCarNational0.Text = sdr2["car_NationalEnterprise"].ToString() == null ? "N/A" : sdr2["car_NationalEnterprise"].ToString();
                            //txtCarNational0.Text = sdr2["car_NationalEnterprise"].ToString();
                            txtCarEmerald0.Text = sdr2["car_EmeraldClub"].ToString() == null ? "N/A" : sdr2["car_EmeraldClub"].ToString();
                            txtVehicle.Text = sdr2["car_typeOfVehicle"].ToString() == null ? "N/A" : sdr2["car_typeOfVehicle"].ToString();
                            txtCarPickUpTime0.Text = sdr2["car_PickUpTime"].ToString() == null ? "N/A" : sdr2["car_PickUpTime"].ToString();
                            txtCarDropUpTime0.Text = sdr2["car_DropOFFTime"].ToString() == null ? "N/A" : sdr2["car_DropOFFTime"].ToString();
                            txtCarNotes.Text = sdr2["car_Notes"].ToString() == null ? "N/A" : sdr2["car_Notes"].ToString();
                            txtCarArrivalCity.Text = sdr2["arrivalCity"].ToString() == null ? "N/A" : sdr2["arrivalCity"].ToString();
                            txtCarDepartCity.Text = sdr2["departCity"].ToString() == null ? "N/A" : sdr2["departCity"].ToString();
                        }
                    }
                    string insertRev3 = "UPDATE tms.travel_summary_car car SET car_CONConfirNum ='"+ txtCarConfirmation0.Text + "',car_CONEmeraldAisle = '"+DropDownList6.Text+ "',car_CONDealership = '"+txtCarDealer0.Text+ "',car_CONPickUpAddress= '"+txtCarPick.Text+ "',car_CONPickUpHour = '"+txtCarPickUpTime.Text+"' ,car_CONDropOFFAddress = '" + txtCarDrop.Text+ "',car_CONDropOFFHour = '"+txtCarDropUpTime.Text+ "' , car_CONSubtotal = '"+txtCarSubtotal.Text+ "', car_CONHST = '"+txtCarHST.Text+ "', car_CONGrandTotal = '"+txtCarGrandTotal.Text+"', date_completed = '" + currentDate + "' WHERE (userName = '" + lblUser.Text + "' AND departCity = '"+txtCarDepartCity.Text+ "' AND arrivalCity = '"+txtCarArrivalCity.Text+"' AND checkIN = '"+txtCarCheckIN.Text+"' AND checkOUT = '"+txtCarCheckOut.Text+ "' AND car_NationalEnterprise = '"+txtCarNational0.Text+ "' AND car_typeOfVehicle = '"+txtVehicle.Text+ "' AND car_PickUpTime = '"+ txtCarPickUpTime0 .Text+ "' AND car_DropOFFTime = '"+ txtCarDropUpTime0 .Text+ "' AND car_Notes = '"+txtCarNotes.Text+ "' AND car_EmeraldClub = '"+txtCarEmerald0.Text+ "' AND file_refer = '" + fileRefer + "')";
                    MySqlCommand cm = new MySqlCommand(insertRev3, myConn.connection);
                    cm.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated for Car.')", true);
                }
                string textFill = "SELECT sum.userName, sum.email, managerEmail FROM tms.travel_summary sum JOIN tms.travel_summary_managerdetail ON tms.travel_summary_managerdetail.managerName = sum.approvingManager";
                //MySqlConnection connection = new MySqlConnection(textFill);
                MySqlCommand command = new MySqlCommand(textFill, myConn.connection);
                MySqlDataReader dataReader;
                dataReader = command.ExecuteReader();
                while(dataReader.Read())
                {
                    TextBox1.Text = dataReader["managerEmail"].ToString();
                    //lblUserEmail.Text = dataReader["email"].ToString();
                }
                dataReader.Close();
                dataReader.Dispose();
            }
            myConn.CloseConnection();
            InsertMessage();
        }

        public void InsertMessage()
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("HSingh@on1call.com");
            //msg.To.Add(lblUserEmail.Text);
            msg.CC.Add("HSingh@On1Call.com");
            //msg.CC.Add(lblUserEmail.Text);
            msg.Subject = "Travel Summary Detail:  "+ lblUser.Text;
            msg.IsBodyHtml = true;
            string Body = "<i>Hello " + lblUser.Text+ "!</i>" + "<br/>" + "<br/>" +
            "<i>Please find attached, your travel summary with all the information you need for your travels are included in the body of this email.You should have this email handy(printed or electronic) during your travels.</i>" + "<br/>" + "<br/>" +
            "<i><b>Traveller’s Manager, please find attached, all the confirmations associated with this travel charged on your credit card.Please use the confirmations as receipts to reconcile to your visa.If a confirmation is not attached, your credit card was not used for this travel or we have a corporate account with that / those particular vendor(s).</b></i>" + "<br/>" + "<br/>" +
            "<i>Please review all details of your bookings and reply to this email acknowledging they are correct. If you have any questions, please let me know.,</i>" + "<br/>" + "<br/>" +
            "<i><b><p style='color:red'>Through our corporate account with Enterprise / National, the damage waiver is included in the daily price of all rentals.There is no need to ask for anymore insurance as it is already included. Should unfortunate events occur and you need roadside assistance, you can call(844) 556 - 4930 for help(this phone number can also be found on your key tag).</p></b></i>" + "<br/>" + "<br/>" +
            "<i><b>Below are the booking details:</b></i>" + "<br/>" +
            "<b>Hotel Booking Detail: </b>" + "<br/>" + "Confirmation#:  " +txtHotelConf0.Text+ "; Room Detail:  " +ddBedSize.Text+ "; Pre-Auth Form Required:  " +DropDownList4.Text+ "<br/>" +
            "Hotel Phone#: " +txtHotelNumber1.Text+ "; Hotel Name:  " + txtHotel0.Text+ "; Hotel Address: " + txtHotelAddress.Text+ "; City" +txtHotelCity.Text+ "; Province: " +DropDownList5.Text+ "<br/>" +
            "Postal Code: " +txtHotelPostalCode.Text+ "; Check In Time: " + txtCheckInTime.Text+ "; Check Out Time:  " + txtCheckOutTime.Text+ "; Subtotal:  $ " + txtHotelSubtotal.Text+ "; HST:  $ " + txtHotelHST.Text+ "; Grand Total:  $ " + txtHotelGrandTotal.Text + "<br/>" + "<br/>" +
            "<b>Flight Details: </b>" + "<br/>" + "Ticket#:  " + txtFlightTicket.Text+ "; Terminal:  " + txtFlightTerminal.Text+ "; Airline:  " +txtAirline.Text+ "; Booking Reference:  " +txtBookRefer.Text+ "<br/>" +
            "Departing Flight:  " +txtDeparture0.Text+ "; Departing Flight time:  " +txtFlightTime0.Text+ "; Departing Flight Arrival time:  " +txtDepartArrival1.Text+ "<br/>" +
            "Return Flight: " +txtReturn.Text+ "; Return Flight time:  "+txtReturnTime.Text+ "; Return Flight Arrival time:  " +txtReturnArrival.Text+ "<br/>" +
            "Subtotal:  $ " + txtFlightSubtotal.Text+ "; HST:  $ " + txtFlightHST.Text+ "; Grand Total:  $ " + txtFlightGrandTotal.Text+ "<br/>" + "<br/>" +
            "<b>Airport Details: </b>" + "<br/>" + "Confirmation #:  " +txtAirportConfirm.Text+ "; Customer Service#:  " +txtCustomerService.Text+ "; Pick Up Time:  " +txtPickUpTime.Text+ "<br/>" +
            "Pick Up Date:  " +txtPickUpDate.Text+ "; ETA at Airport:  " +txtETAAirport.Text+ "; Subtotal:  $ " + txtAirportSubtotal.Text+ "; HST:  $ " + txtAirportHST.Text+ "; Gratuity:  $ " + txtAirportGratuity.Text+ "; Grand Total:  $ " + txtAirportGrandTotal.Text + "<br/>" + "<br/>" +
            "<b>Car Detail: </b>" + "<br/>" + "Confirmation#:  " +txtCarConfirmation0.Text+ "; Emerald Aisle:  " + DropDownList6.Text+ "; Dealership Phone#:  " + txtCarDealer0.Text+ "; Pick-Up Location:  " + txtCarPick.Text+ "; Pick-Up time:  " + txtCarPickUpTime.Text+ "<br/>" +
            "Drop-Off Location:  " + txtCarDrop.Text+ "; Drop-Off time:  " + txtCarDropUpTime.Text+ "; Subtotal:  $ " + txtCarSubtotal.Text+ "; HST:  $ " + txtCarHST.Text+ ";  Grand Total:  $ " + txtCarGrandTotal.Text+ "<br/>" +"<br/>" +
            "<i>Thank you,</i>" + "<br/>" +
            "<i>Cory</i>";
            msg.Body = Body;
            if (FileUploadControl.HasFile)
            {
                msg.Attachments.Add(new Attachment(FileUploadControl.PostedFile.InputStream, FileUploadControl.FileName));
            }
            //SmtpClient smtp = new SmtpClient(ConfigurationManager.AppSettings["Network"]);
            SmtpClient smtp = new SmtpClient("exchange.ON1Call.com", 25);
            smtp.EnableSsl = true;
            NetworkCredential netCre = new NetworkCredential("HSingh@ON1Call.com", "xxxxxx");
            smtp.Credentials = netCre;
            try
            {
                smtp.Send(msg);
            }
            catch (Exception)
            {

            }
        }

        protected void txtPickUpDate_TextChanged1(object sender, EventArgs e)
        {
            txtPickUpDate.Text = DateTime.ParseExact(txtPickUpDate.Text, "mm-dd-yyyy", null).ToString("mm-dd-yyyy");
        }

        //protected void btnBrowser_Click(object sender, EventArgs e)
        //{
        //    if (FileUploadControl.HasFile)
        //    {
        //        try
        //        {
        //            string filename = Path.GetFileName(FileUploadControl.FileName);
        //            FileUploadControl.SaveAs(Server.MapPath("~/") + filename);
        //            StatusLabel.Text = "Upload status: File uploaded!";
        //        }
        //        catch (Exception ex)
        //        {
        //            StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
        //        }
        //    }
        //}
    }
}