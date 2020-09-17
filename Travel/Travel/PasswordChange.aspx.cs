using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travel
{
    public partial class PasswordChange : System.Web.UI.Page
    {
        //PasswordEncpDecp encpDecp = new PasswordEncpDecp();
        public MySqlConnection connection;
        MysqlConn myConn = new MysqlConn();

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        public void Infor()
        {
            string currentPass = txtPassword.Text;
            string currentNewPass = txtNewPassword.Text;
            string currentConNewPass = txtConfirmNewPassword.Text;
            //encpDecp.Encrypt();
            //string reminder = lblReminder.Text;
            //var testVal = txtPswdRcvd.PasswordRecoveryText;
            var correctPass = this.Request.QueryString["code"];
            var userName = this.Request.QueryString["userEmail"];
            //string correctPass = Request.QueryString["code"];
            //string userName = Request.QueryString["userEmail"];
            if (currentPass == correctPass)
            {
                lblReminder.Text= "You have successfully changed your password.";
                myConn.Conn();
                if (myConn.OpenConnection() == true)
                {
                    string insert = "UPDATE tms.travel_summary SET password = '"+txtConfirmNewPassword.Text +"' WHERE(email = '" + userName + "')";
                    //UPDATE tms.travel_summary_hotel SET hotel_CONHotelName = '" + txtHotel0.Text + "', hotel_CONHotelAddress = '" + txtHotelAddress.Text + "', hotel_CONHotelConfirmationNum = '" + txtHotelConf0.Text + "', hotel_CONHotelCity = '" + txtHotelCity.Text + "', hotel_CONHotelPostal = '" + txtHotelPostalCode.Text + "', hotel_CONHotelPhone = '" + txtHotelNumber1.Text + "',hotel_CONcheckIN = '"+txtCheckInTime.Text+"', hotel_CONcheckOut = '"+txtCheckOutTime.Text+ "', hotel_CONAuthForm = '"+DropDownList4.Text+"', hotel_CONSubtotal = '"+txtHotelSubtotal.Text+"', hotel_CONHST = '"+txtHotelHST.Text+"',hotel_CONGrandTotal = '"+txtHotelGrandTotal.Text+ "', date_completed = '"+ currentDate + "' WHERE (userName = '" + lblUser.Text+"' AND arrivalCity = '"+txtHotelArrivalCity.Text+"' AND departCity = '"+txtHotelDepartCity.Text+"' AND checkIN = '"+txtCheckIN0.Text+"' AND checkOut= '"+txtCheckOut0.Text+"' AND hotel_Preference= '"+txtHotelPref0.Text+"' AND hotel_BedSize= '"+txtBedSize.Text+"' AND hotel_Rewards= '"+txtHotelReward0.Text+"' AND hotel_Notes = '"+txtHotelNotes.Text+ "' AND hotel_date_requested ='"+lblHotel.Text+"')
                    MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
                    cmd.ExecuteNonQuery();
                }
                myConn.CloseConnection();
            }
            else
            {
                lblReminder.Text = "Please enter the 6 digit code received through email.";
            }
        }
        
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Infor();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}