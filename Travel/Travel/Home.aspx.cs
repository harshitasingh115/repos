using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travel
{
    public partial class Home : System.Web.UI.Page
    {
        //private MySqlDataAdapter mySqlDataAdapter;
        public MySqlConnection connection;
        MysqlConn myConn = new MysqlConn();
        Random R = new Random();
        public static string userEmail = Global.ImportantData;
        public static string password = Global.ImportantData1;
        public static string Code = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Code = Random.randomNumber;
            lblCode.Text = Code.ToString();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string login = txtUserLogin.Text;
            string password = txtUserPassword.Text;
            Global.ImportantData = login;
            Global.ImportantData1 = password;
            try
            {
                var userVal = getUserData(login, password);
                if (!userVal)
                {
                    lblWarning.Text = "Missing profile from the database. Please create your profile.";
                }
                else
                {
                    lblWarning.Text = "Thank you for providing the details.";
                    string userName;
                    userName = "Summary.aspx?code=" + login;
                    Response.Redirect(userName);
                    //Response.Redirect("Summary.aspx");
                }
            }
            catch (Exception)
            {

            }
        }

        protected bool getUserData(string userName, string password)
        {
            try
            {
                myConn.Conn();
                myConn.OpenConnection();
                string query = "SELECT * FROM tms.travel_summary WHERE userName = '" + txtUserLogin.Text + "' AND password ='" + txtUserPassword.Text + "'";
                MySqlCommand cm = new MySqlCommand(query, myConn.connection);
                MySqlDataReader dr = cm.ExecuteReader();
                if (dr.Read())
                {
                    return true;
                }
                myConn.CloseConnection();
                return false;
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void lblForgot_Click(object sender, EventArgs e)
        {
            PasswordRecovery1.Visible = true;
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(PasswordRecovery1.UserName);
            mail.CC.Add("HSingh@ON1Call.com");
            mail.From = new MailAddress("HSingh@ON1Call.com");
            string Info = lblCode.Text;
            mail.Subject = "Request to reset your password";
            mail.IsBodyHtml = true;
            mail.Body = "<b>Forgot your Password?</b>"+Environment.NewLine+"Please enter this code to reset the password:" + Environment.NewLine + Info;
            //SmtpClient smtp = new SmtpClient(ConfigurationManager.AppSettings["Network"]);
            SmtpClient smtp = new SmtpClient("exchange.ON1Call.com", 25);
            smtp.EnableSsl = true;
            NetworkCredential netCre = new NetworkCredential("HSingh@ON1Call.com", "xxxxx");
            smtp.Credentials = netCre;
            try
            {
                smtp.Send(mail);

                
            }
            catch (Exception)
            {

            }

            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string insert = "INSERT INTO tms.passwordreset(email, code) Values('" + mail.To + "','" + lblCode.Text + "')";
            }
            myConn.CloseConnection();

            //string url;
            //url = "PasswordChange.aspx?code=" + lblCode.Text;

            //string userNameURL;
            //userNameURL = "PasswordChange.aspx?userEmail=" + PasswordRecovery1.UserName;

            Response.Redirect("PasswordChange.aspx?code=" + lblCode.Text + "&userEmail=" + PasswordRecovery1.UserName);
            

            //Response.Redirect(userNameURL);
            //Response.Redirect("PasswordChange.aspx" + lblCode.Text);

        }

        protected void txtSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUpForm.aspx");
        }
    }
}