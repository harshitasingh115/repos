using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travel
{
    public partial class Summary : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                string correctPass = Request.QueryString["code"];
                lblUser.Text = correctPass;
                if (lblUser.Text == "HSingh")
                {
                    btnReview.Visible = true;
                }
                lblReminders.Text = "Reminders: 1) Full size sedans are the standard vehicle class for all business use as per the expense policy. Should you require an SUV (ie. transporting equipment/weather), you must get approval from your manager (include in notes). 2) You must have a valid drivers license in order to pick up a rental vehicle. 3) Should unfortunate events occur during your travels and you need roadside assistance, you can call (844) 556-4930 for assistance.";
            }
        }

        [ScriptMethod]
        [WebMethod]
        public static List<string> GetCity(string prefixText, int count)
        {
            MySqlDataAdapter da;
            DataTable dt;
            MysqlConn myConn = new MysqlConn();
            myConn.Conn();
            myConn.OpenConnection();
            DataTable Result = new DataTable();
            string str = "SELECT city FROM tms.city WHERE city LIKE '" + prefixText + "%'";
            da = new MySqlDataAdapter(str, myConn.connection);
            dt = new DataTable();
            da.Fill(dt);

            List<string> Output = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            Output.Add(dt.Rows[i][0].ToString());
            myConn.CloseConnection();
            return Output;
        }


        //protected void btnHotel_Click(object sender, ImageClickEventArgs e)
        //{
        //    j = 3;
        //    //Panel1.Visible = true;
        //    //Panel2.Visible = false;
        //    //Panel3.Visible = false;
        //}

        //public void hotelDetail()
        //{
        //    
        //    if (txtLocation.Text != null || txtLocation1.Text != null || txtIn.Text != null || txtOut.Text != null || txtHotelPref.Text != null || ddBedSize.Text != null || txtHotelReward.Text != null ||txtHotelNotes.Text != null || timeStamp !=null)
        //    {
        //        myConn.Conn();
        //        if (myConn.OpenConnection() == true)
        //        {
        //            string insert = "INSERT INTO tms.travel_summary_hotel(userName,departCity,arrivalCity,checkIN, checkOUT,hotel_Preference,hotel_BedSize,hotel_Rewards,hotel_Notes,hotel_date_requested,date_completed) VALUES ('" + lblUser.Text + "', '" + txtLocation.Text + "', '" + txtLocation1.Text + "', '" + txtIn.Text + "', '" + txtOut.Text + "', '" + txtHotelPref.Text + "', '" + ddBedSize.Text + "', '" + txtHotelReward.Text + "', '" + txtHotelNotes.Text + "', '"+timeStamp+"', '"+"Not Entered"+"')";
        //            MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
        //            cmd.ExecuteNonQuery();
        //        }
        //        myConn.CloseConnection();
        //        //Response.Write("<script LANGUAGE='JavaScript' >alert('Hotel Requested Entered')</script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script LANGUAGE='JavaScript' >alert('Missing Information. Please contact Reporting.')</script>");
        //    }
        //}

        ////protected void btnFlight_Click(object sender, ImageClickEventArgs e)
        ////{
        ////    j = 1;
        ////    //Panel1.Visible = false;
        ////    //Panel2.Visible = true;
        ////    //Panel3.Visible = false;
        ////}

        //public void flightDetail()
        //{
        //    string timeStamp = DateTime.Now.ToString();
        //    if (txtLocation.Text != null || txtLocation1.Text != null || txtIn.Text != null || txtOut.Text != null || txtHotelPref.Text != null || ddBedSize.Text != null || txtHotelReward.Text != null || txtHotelNotes.Text != null || timeStamp != null)
        //    {
        //        myConn.Conn();
        //        if (myConn.OpenConnection() == true)
        //        {
        //            string insert = "INSERT INTO tms.travel_summary_flight(userName,departCity,arrivalCity,checkIN,checkOUT,flight_trip,flight_desiredTimeCheckIN,flight_desiredTimeCheckOUT,flight_flyerNum,flight_window,flight_notes,flight_date_requested,date_completed) VALUES ('" + lblUser.Text + "', '" + txtLocation.Text + "', '" + txtLocation1.Text + "', '" + txtIn.Text + "', '" + txtOut.Text + "', '" + ddFlightWay.Text + "', '" + ddFlightTime0.Text + "', '" + ddDepartArrival0.Text + "', '" + txtProgram0.Text + "', '" + ddWindow.Text + "', '" + txtAirportFlightNotes.Text + "', '" + timeStamp + "', '" + "Not Entered" + "')";
        //            MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
        //            cmd.ExecuteNonQuery();
        //            string insert1 = "INSERT INTO tms.travel_summary_airport(userName,departCity,arrivalCity,checkIN,checkOUT,airport_trip,airport_destination,airport_pickUpAddress,airport_ClosestIntersection,airport_notes,airport_date_requested,date_completed) VALUES ('" + lblUser.Text + "', '" + txtLocation.Text + "', '" + txtLocation1.Text + "', '" + txtIn.Text + "', '" + txtOut.Text + "', '" + ddFlightWay.Text + "', '" + txtAirportDestionation.Text + "', '" + txtAirportPickUp.Text + "', '" + txtAirportCloseIntersection.Text + "', '" + txtAirportFlightNotes.Text + "', '" + timeStamp + "', '" + "Not Entered" + "')";
        //            MySqlCommand cmd1 = new MySqlCommand(insert1, myConn.connection);
        //            cmd1.ExecuteNonQuery();
        //        }
        //        myConn.CloseConnection();
        //        Response.Write("<script LANGUAGE='JavaScript' >alert('Flight Requested Entered')</script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script LANGUAGE='JavaScript' >alert('Missing Information. Please contact Reporting.')</script>");
        //    }
        //}

        ////protected void btnCar_Click(object sender, ImageClickEventArgs e)
        ////{
        ////    j = 2;
        ////    //lblReminders.Visible = true;
        ////    //Panel1.Visible = false;
        ////    //Panel2.Visible = false;
        ////    //Panel3.Visible = true;
        ////    //Panel3.Left = this.Width / 2;
        ////}
        //public void carDetail()
        //{
        //    string timeStamp = DateTime.Now.ToString();
        //    if (txtLocation.Text != null || txtLocation1.Text != null || txtIn.Text != null || txtOut.Text != null || txtHotelPref.Text != null || ddBedSize.Text != null || txtHotelReward.Text != null || txtHotelNotes.Text != null || timeStamp != null)
        //    {
        //        myConn.Conn();
        //        if (myConn.OpenConnection() == true)
        //        {
        //            string insert = "INSERT INTO tms.travel_summary_car(userName,departCity,arrivalCity,checkIN,checkOUT,car_NationalEnterprise,car_typeOfVehicle,car_PickUpTime,car_DropOFFTime,car_Notes,car_EmeraldClub,car_date_requested,date_completed)VALUES('" + lblUser.Text + "', '" + txtLocation.Text + "', '" + txtLocation1.Text + "', '" + txtIn.Text + "', '" + txtOut.Text + "', '" + ddCarNational.Text + "', '" + txtDropdownVehicle.Text + "', '" + ddCarPickUpTime.Text + "', '" + ddCarDropUpTime.Text + "', '" + txtCarNotes.Text + "','" + txtCarEmerald.Text + "','" + timeStamp + "', '" + "Not Entered" + "')";
        //            MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
        //            cmd.ExecuteNonQuery();
        //        }
        //        myConn.CloseConnection();
        //        Response.Write("<script LANGUAGE='JavaScript' >alert('Car Requested Entered')</script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script LANGUAGE='JavaScript' >alert('Missing Information. Please contact Reporting.')</script>");
        //    }
        //}


        protected void txtIn_TextChanged(object sender, EventArgs e)
        {
            txtIn.Text = DateTime.ParseExact(txtIn.Text, "mm-dd-yyyy", null).ToString("mm-dd-yyyy");
        }

        protected void txtOut_TextChanged(object sender, EventArgs e)
        {
            txtOut.Text = DateTime.ParseExact(txtOut.Text, "mm-dd-yyyy", null).ToString("mm-dd-yyyy");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var latestFileRefer = CheckLatestFileRefer();
            string timeStamp = DateTime.Now.ToString();
            if (txtLocation.Text != "" && txtLocation1.Text != "" && txtIn.Text != "" && txtOut.Text != "")
            {
                myConn.Conn();
                if (myConn.OpenConnection() == true)
                {
                    if (chckHotel.Checked)
                    {
                        string insert = "INSERT INTO tms.travel_summary_hotel(userName,departCity,arrivalCity,checkIN, checkOUT,hotel_Preference,hotel_BedSize,hotel_Rewards,hotel_Notes,hotel_date_requested,date_completed, file_refer) VALUES ('" + lblUser.Text + "', '" + txtLocation.Text + "', '" + txtLocation1.Text + "', '" + txtIn.Text + "', '" + txtOut.Text + "', '" + txtHotelPref.Text + "', '" + ddBedSize.Text + "', '" + txtHotelReward.Text + "', '" + txtHotelNotes.Text + "', '" + timeStamp + "', '" + "Not Entered" + "', '"+ latestFileRefer + "')";
                        MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
                        cmd.ExecuteNonQuery();
                    }
                    if(chckFlight.Checked)
                    {
                        string insert1 = "INSERT INTO tms.travel_summary_flight(userName,departCity,arrivalCity,checkIN,checkOUT,flight_trip,flight_desiredTimeCheckIN,flight_desiredTimeCheckOUT,flight_flyerNum,flight_window,flight_notes,flight_date_requested,date_completed, file_refer) VALUES ('" + lblUser.Text + "', '" + txtLocation.Text + "', '" + txtLocation1.Text + "', '" + txtIn.Text + "', '" + txtOut.Text + "', '" + ddFlightWay.Text + "', '" + ddFlightTime0.Text + "', '" + ddDepartArrival0.Text + "', '" + txtProgram0.Text + "', '" + ddWindow.Text + "', '" + txtAirportFlightNotes.Text + "', '" + timeStamp + "', '" + "Not Entered" + "', '" + latestFileRefer + "')";
                        MySqlCommand cmd1 = new MySqlCommand(insert1, myConn.connection);
                        cmd1.ExecuteNonQuery();
                    }
                    if(chckAirport.Checked)
                    {
                        string insert2 = "INSERT INTO tms.travel_summary_airport(userName,departCity,arrivalCity,checkIN,checkOUT,airport_trip,airport_destination,airport_pickUpAddress,airport_ClosestIntersection,airport_notes,airport_date_requested,date_completed, file_refer) VALUES ('" + lblUser.Text + "', '" + txtLocation.Text + "', '" + txtLocation1.Text + "', '" + txtIn.Text + "', '" + txtOut.Text + "', '" + ddFlightWay.Text + "', '" + txtAirportDestionation.Text + "', '" + txtAirportPickUp.Text + "', '" + txtAirportCloseIntersection.Text + "', '" + txtAirportFlightNotes.Text + "', '" + timeStamp + "', '" + "Not Entered" + "', '" + latestFileRefer + "')";
                        MySqlCommand cmd2 = new MySqlCommand(insert2, myConn.connection);
                        cmd2.ExecuteNonQuery();
                    }
                    if (chckCar.Checked)
                    {
                        string insert3 = "INSERT INTO tms.travel_summary_car(userName,departCity,arrivalCity,checkIN,checkOUT,car_NationalEnterprise,car_typeOfVehicle,car_PickUpTime,car_DropOFFTime,car_Notes,car_EmeraldClub,car_date_requested,date_completed, file_refer)VALUES('" + lblUser.Text + "', '" + txtLocation.Text + "', '" + txtLocation1.Text + "', '" + txtIn.Text + "', '" + txtOut.Text + "', '" + ddCarNational.Text + "', '" + txtDropdownVehicle.Text + "', '" + ddCarPickUpTime.Text + "', '" + ddCarDropUpTime.Text + "', '" + txtCarNotes.Text + "','" + txtCarEmerald.Text + "','" + timeStamp + "', '" + "Not Entered" + "', '" + latestFileRefer + "')";
                        MySqlCommand cmd3 = new MySqlCommand(insert3, myConn.connection);
                        cmd3.ExecuteNonQuery();
                    }
                }
                myConn.CloseConnection();            
                MailMessage mail = new MailMessage();
                mail.CC.Add("HSingh@ON1Call.com");
                mail.From = new MailAddress("HSingh@ON1Call.com");
                string Info = lblUser.Text;
                mail.Subject = "Travel Request Entered.";
                mail.IsBodyHtml = true;
                mail.Body = "<b></b>" + Environment.NewLine + "Recent request has been entered." + Environment.NewLine + Info;
                //SmtpClient smtp = new SmtpClient(ConfigurationManager.AppSettings["Network"]);
                SmtpClient smtp = new SmtpClient("exchange.ON1Call.com", 25);
                smtp.EnableSsl = true;
                NetworkCredential netCre = new NetworkCredential("HSingh@ON1Call.com", "xxxxxx");
                smtp.Credentials = netCre;
                try
                {
                    smtp.Send(mail);
                }
                catch (Exception)
                {
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Requested sumbitted.')", true);
                //Response.Write("<script LANGUAGE='JavaScript' >alert('Requested sumbitted.')</script>");
                txtLocation.Text = string.Empty;
                txtLocation1.Text = string.Empty;
                txtIn.Text = string.Empty;
                txtOut.Text = string.Empty;
            }
            else
            {
                lblAlert.Text = "Please fill the details.";
            }
            Response.Redirect("Home.aspx");
        }

        private int CheckLatestFileRefer()
        {
            int j = 001;
            int result = 1;
            string timeStamp = DateTime.Now.ToString();
            string fileStringData = timeStamp.Substring(6, 2);
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string fileDetail = "SELECT MAX(airport.file_refer) AS GAirport, (SELECT MAX(hotel.file_refer) FROM tms.travel_summary_hotel hotel) AS GHotel, (SELECT MAX(car.file_refer) FROM tms.travel_summary_car car)  AS GCar," +
                "(SELECT MAX(flight.file_refer) FROM tms.travel_summary_flight flight) AS GFlight FROM tms.travel_summary_airport airport";
                MySqlCommand mySqlCommand = new MySqlCommand(fileDetail, myConn.connection);
                MySqlDataReader mySqlDataReader;
                mySqlDataReader = mySqlCommand.ExecuteReader();
                List<int> fileRefVal = new List<int>();
                if (mySqlDataReader.HasRows)
                {
                    while (mySqlDataReader.Read())
                    {
                        if (mySqlDataReader["GHotel"].GetType().GetProperties().Any())
                        {
                            fileRefVal.Add(Convert.ToInt16(mySqlDataReader["GHotel"]));
                        }
                        if (mySqlDataReader["GCar"].GetType().GetProperties().Any())
                        {
                            fileRefVal.Add(Convert.ToInt16(mySqlDataReader["GCar"]));
                        }
                        if (mySqlDataReader["GFlight"].GetType().GetProperties().Any())
                        {
                            fileRefVal.Add(Convert.ToInt16(mySqlDataReader["GFlight"]));
                        }
                        if (mySqlDataReader["GAirport"].GetType().GetProperties().Any())
                        {
                            fileRefVal.Add(Convert.ToInt16(mySqlDataReader["GAirport"]));
                        }
                        //lblFileRef.Text = mySqlDataReader["File_Number"].ToString();
                    }
                }
                if(fileRefVal.Count == 0)
                {
                    var tempRefVal = fileStringData + "00" +j;
                    result = int.Parse(tempRefVal);
                }
                else if (fileRefVal.Count > 0)
                {
                    var tempRefVal = fileRefVal.Max();
                    result = tempRefVal + 1;
                }
                else
                {
                    lblAlert.Text = "Please contact Reporting.";
                }
                
            }
            return result;
        }

        protected void btnReview_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserInfo.aspx");
        }

        protected void chckHotel_CheckedChanged(object sender, EventArgs e)
        {
            if(chckHotel.Checked)
            {
                Panel6.Enabled = true;
            }
        }

        protected void chckCar_CheckedChanged(object sender, EventArgs e)
        {
            if(chckCar.Checked)
            {
                Panel7.Enabled = true;
            }
        }

        protected void chckFlight_CheckedChanged(object sender, EventArgs e)
        {
            if(chckFlight.Checked)
            {
                Panel8.Enabled = true;
            }
        }

        protected void chckAirport_CheckedChanged(object sender, EventArgs e)
        {
            if (chckAirport.Checked)
            {
                Panel9.Enabled = true;
            }
        }
    }
}