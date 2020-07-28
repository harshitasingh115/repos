using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travel
{
    public partial class SignUpForm : System.Web.UI.Page
    {
        public MySqlConnection connection;
        MysqlConn myConn = new MysqlConn();
        Random R = new Random();
        public static string userEmail = Global.ImportantData;
        public static string password = Global.ImportantData1;
        public static string Code = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text == "")
            {
                Label1.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtPassword.Text == "")
            {
                Label2.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtContact.Text == "")
            {
                Label3.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtLicense.Text == "")
            {
                Label4.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtAddress.Text == "")
            {
                Label5.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtCity.Text == "")
            {
                Label6.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (ddProvince.Text == "")
            {
                Label7.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtPostal.Text == "")
            {
                Label8.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtManager.Text == "")
            {
                Label9.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtCCHolder.Text == "")
            {
                Label10.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            if (txtEmerald.Text == "")
            {
                Label11.Visible = true;
                lblWarning.Text = "Please enter the missing information.";
            }
            else
            {
                myConn.Conn();
                if (myConn.OpenConnection() == true)
                {
                    string insert = "INSERT INTO tms.travel_summary (email,userName,password,contactNumber,driverLicense,address,city,province,postalCode,approvingManager,ccInfo,emeraldNum) VALUES ('" + txtEmail.Text + "','" + txtUserName.Text + "', '" + txtPassword.Text + "', '" + txtContact.Text + "', '" + txtLicense.Text + "', '" + txtAddress.Text + "', '" + txtCity.Text + "', '" + ddProvince.Text + "', '" + txtPostal.Text + "', '" + txtManager.Text + "', '" + txtCCHolder.Text + "', '" + txtEmerald.Text + "')";
                    //string insert = "INSERT INTO on1call.test_onlinenif (idTBL_Members, tbl_members_stationcodesUID, idtbl_Members_StationCode,validity_from,validity_end,nif_URL,code) Values('" + idTBL_Members + "', '" + tbl_members_stationcodesUID + "', '" + idtbl_Members_StationCode + "','" + current + "','" + date + "', '" + ran + "','" + Code + "')";
                    MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
                    cmd.ExecuteNonQuery();
                }
                myConn.CloseConnection();
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Profile sucessfully created.');", true);
            }
            Response.Redirect("Home.aspx");
        }

    }
}