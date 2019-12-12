using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Globalization;
using System.Configuration;
using System.Collections;
using System.Web.Script.Serialization;
using System.Net;
using System.Drawing;
using System.Net.Mail;

namespace MemberSignature
{
    public partial class Form : System.Web.UI.Page
    {
        private MySqlDataAdapter mySqlDataAdapter;
        public MySqlConnection connection;
        MysqlConn myConn = new MysqlConn();
        Home h = new Home();
        public static string Ran = "";
        Random R = new Random();
        public static string Member = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            Panel2.Visible = false;
        }
        protected void btnSearchCode_Click(object sender, EventArgs e)
        {
            var searchCode = string.IsNullOrEmpty(txtID.Text) ? "" : txtID.Text.ToString();
            if (!string.IsNullOrEmpty(searchCode))
            {
                DataTable dt = new DataTable();
                myConn.Conn();
                if (myConn.OpenConnection() == true)
                {
                    string Query = "SELECT * FROM on1call.test_onlinenif WHERE code = '" + searchCode + "'";
                    mySqlDataAdapter = new MySqlDataAdapter(Query, myConn.connection);
                    mySqlDataAdapter.Fill(dt);
                }
                myConn.CloseConnection();

                if(dt.Rows.Count > 0)
                {
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    LoadEvent();
                }
            }
        }

        public void LoadEvent()
        {
            var a = Page.RouteData.ToString();
            string urlQuery = HttpContext.Current.Request.Url.Query;
            //if (flag == 1)
            //{
            //    txtReject.Visible = true;
            //    btnSend.Visible = true;

            //}
            //if (flag == 0)
            //{
            //    txtReject.Visible = false;
            //    btnSend.Visible = false;
            //}

            //Member = Global.ImportantData;

            var selectedMember = searchUrlMember(urlQuery);
            string tbl_members_stationcodesUID = "";

            foreach (DataRow dr in selectedMember.Rows)
            {
                tbl_members_stationcodesUID = dr["tbl_members_stationcodesUID"].ToString();
            }

            Member = tbl_members_stationcodesUID;
            IpAddress(tbl_members_stationcodesUID);
            Search(tbl_members_stationcodesUID);
            Contact(tbl_members_stationcodesUID);
            LSP(tbl_members_stationcodesUID);
            //LocatorContact(tbl_members_stationcodesUID);
            Mediums(tbl_members_stationcodesUID);
            Info(tbl_members_stationcodesUID);
        }

        public void IpAddress(string tbl_members_stationcodesUID)
        {
            Member = tbl_members_stationcodesUID;
            IPHostEntry host = default(IPHostEntry);
            string Hostname = string.Empty;
            Hostname = System.Environment.MachineName;
            host = Dns.GetHostEntry(Hostname);
            foreach (IPAddress IP in host.AddressList)
            {
                if (IP.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                {
                    Label1.Text = Convert.ToString(IP);
                    Label2.Text = Convert.ToString(Hostname);
                    //searchUrlMember();
                    //LookUP();
                }
            }
            string ip1 = Label1.Text;
            string host1 = Label2.Text;

            myConn.Conn();
            if(myConn.OpenConnection() == true)
            {
                string insert = "INSERT INTO on1call.test_onlinenif (ipAddress,user) Values('" + ip1 + "', '" + host1 + "') WHERE tbl_members_stationcodesUID = '"+ Member + "'";
            }
            myConn.CloseConnection();
        }

        private DataTable searchCode(string codeString)
        {
            DataTable d = new DataTable();
            myConn.Conn();
            if(myConn.OpenConnection() ==true)
            {
                string q = "SELECT * FROM on1call.test_onlinenif WHERE code = '" + codeString + "'";
                mySqlDataAdapter = new MySqlDataAdapter(q, myConn.connection);
                mySqlDataAdapter.Fill(d);
            }
            myConn.CloseConnection();
            return d;
        }

        private DataTable searchUrlMember(string ranString)
        {
            DataTable dt = new DataTable();
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string Query = "SELECT * FROM on1call.test_onlinenif WHERE nif_URL = '" + ranString + "'";
                mySqlDataAdapter = new MySqlDataAdapter(Query, myConn.connection);
                mySqlDataAdapter.Fill(dt);
            }
            myConn.CloseConnection();
            return dt;
        }

        private void LookUP()
        {
            Member = Home.MemberID;
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string Query = "SELECT * FROM on1calldev.tbl_locators loc JOIN on1calldev.tbl_members_stationcodes stncode ON loc.idtbl_Locators = stncode.LocatorID WHERE stncode.tbl_members_stationcodesUID = '" + Member + "'";
                mySqlDataAdapter = new MySqlDataAdapter(Query, myConn.connection);
                DataTable dt = new DataTable();
                mySqlDataAdapter.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            myConn.CloseConnection();
        }


        private void Search(string tbl_members_stationcodesUID)
        {
            Member = tbl_members_stationcodesUID;
            myConn.Conn();
            string query = "SELECT *FROM on1calldev.tbl_members mem JOIN on1calldev.tbl_members_stationcodes stncode ON mem.idTBL_Members = stncode.idTBL_Members WHERE stncode.tbl_members_stationcodesUID = '" + Member + "'";
            myConn.OpenConnection();
            MySqlCommand mySql = new MySqlCommand(query, myConn.connection);
            MySqlDataReader dr = mySql.ExecuteReader();
            if (dr.Read())
            {
                txtStationCode.Text = (dr["idtbl_Members_StationCode"].ToString());
                txtAddress.Text = (dr["NI_Address"].ToString() + " " + dr["NI_Street"].ToString() + " " + dr["NI_Suffix"].ToString() + " " + dr["NI_Direction"].ToString() + " " + dr["NI_City"].ToString() + " " + dr["NI_ProvStat"].ToString() + " " + dr["NI_Country"].ToString() + " " + dr["NI_ZipPostalCode"].ToString());
                txtCompany.Text = (dr["CorpName"].ToString());
                txtLocate.Text = (dr["LocateValid"].ToString());
            }
            myConn.CloseConnection();
        }

        private void Contact(string tbl_members_stationcodesUID)
        {
            Member = tbl_members_stationcodesUID;
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string Q = "SELECT *FROM on1calldev.tbl_members_stationcodes stncode JOIN on1call.tbl_ni_contact con ON stncode.idTBL_Members = con.idTBL_Members WHERE stncode.tbl_members_stationcodesUID = '" + Member + "'";
                mySqlDataAdapter = new MySqlDataAdapter(Q, myConn.connection);
                DataTable dt = new DataTable();
                mySqlDataAdapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            myConn.CloseConnection();
        }


        private void LSP(string tbl_members_stationcodesUID)
        {
            Member = tbl_members_stationcodesUID;
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string LSP = "SELECT LocateCompany, ContactPerson,Tel,Cell, Email, AltContactPerson,AltTel,AltCell, AltEmail FROM on1calldev.tbl_locators loc JOIN on1calldev.tbl_members_stationcodes stncode ON loc.idtbl_Locators = stncode.LocatorID WHERE stncode.tbl_members_stationcodesUID = '" + Member + "'";
                //string LSP = "SELECT * FROM on1calldev.tbl_locators loc JOIN on1calldev.tbl_members_stationcodes stncode ON loc.idtbl_Locators = stncode.LocatorID WHERE stncode.tbl_members_stationcodesUID = '" + Member + "'";
                MySqlDataAdapter da = new MySqlDataAdapter(LSP, myConn.connection);
                DataTable dt = new DataTable();
                //DataRow d = null;
                da.Fill(dt);
                LocatorContact(dt);
            }
            myConn.CloseConnection();
        }

        private void LocatorContact(DataTable dbDt)
        {
            string contactPerson = "";
            string phoneNum = "";
            string cellNum = "";
            string email = "";
            string altContactPerson = "";
            string altPhoneNum = "";
            string altCellNum = "";
            string altEmail = "";

            DataTable gridDt = new DataTable();
            gridDt.Columns.Add("Detail", typeof(string));
            gridDt.Columns.Add("ContactPerson", typeof(string));
            gridDt.Columns.Add("Tel", typeof(string));
            gridDt.Columns.Add("Cell", typeof(string));
            gridDt.Columns.Add("Email", typeof(string));

            foreach(DataRow dbDtRow in dbDt.Rows)
            {
                contactPerson = dbDtRow["ContactPerson"] == null ? "" : dbDtRow["ContactPerson"].ToString();
                phoneNum = dbDtRow["Tel"] == null ? "" : dbDtRow["Tel"].ToString();
                cellNum = dbDtRow["Cell"] == null ? "" : dbDtRow["Cell"].ToString();
                email = dbDtRow["Email"] == null ? "" : dbDtRow["Email"].ToString();
                altContactPerson = dbDtRow["AltContactPerson"] == null ? "" : dbDtRow["AltContactPerson"].ToString();
                altPhoneNum = dbDtRow["AltTel"] == null ? "" : dbDtRow["AltTel"].ToString();
                altCellNum = dbDtRow["AltCell"] == null ? "" : dbDtRow["AltCell"].ToString();
                altEmail = dbDtRow["AltEmail"] == null ? "" : dbDtRow["AltEmail"].ToString();
            }

            DataRow primaryGridRow = gridDt.NewRow();
            primaryGridRow["Detail"] = "Primary";
            primaryGridRow["ContactPerson"] = contactPerson;
            primaryGridRow["Tel"] = phoneNum;
            primaryGridRow["Cell"] = cellNum;
            primaryGridRow["Email"] = email;

            gridDt.Rows.Add(primaryGridRow);

            if (!string.IsNullOrEmpty(altContactPerson))
            {
                DataRow altGridRow = gridDt.NewRow();
                altGridRow["Detail"] = "Alternate";
                altGridRow["ContactPerson"] = altContactPerson;
                altGridRow["Tel"] = altPhoneNum;
                altGridRow["Cell"] = altCellNum;
                altGridRow["Email"] = altEmail;
                gridDt.Rows.Add(altGridRow);
            }

            GridView2.DataSource = gridDt;
            GridView2.DataBind();

            if (dbDt.Rows.Count > 0)
            {
                txtLSP.Text = dbDt.Rows[0]["LocateCompany"].ToString();
            }

        }

        private void Mediums(string tbl_members_stationcodesUID)
        {
            Member = tbl_members_stationcodesUID;
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string t = "SELECT * FROM on1calldev.tbl_ni_mediums meds JOIN on1calldev.tbl_members_stationcodes stncode ON meds.tbl_members_stationcodesUID = stncode.tbl_members_stationcodesUID WHERE stncode.tbl_members_stationcodesUID = '" + Member + "'";
                mySqlDataAdapter = new MySqlDataAdapter(t, myConn.connection);
                DataTable dt = new DataTable();
                mySqlDataAdapter.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
            }
            myConn.CloseConnection();
        }

        private void Info(string tbl_members_stationcodesUID)
        {
            Member = tbl_members_stationcodesUID;
            myConn.Conn();
            string mem = "SELECT *FROM on1calldev.tbl_members_stationcodes WHERE tbl_members_stationcodesUID = '" + Member + "'";
            myConn.OpenConnection();
            MySqlCommand cmd = new MySqlCommand(mem, myConn.connection);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtComment.Text = (dr["Comments"].ToString());
                txtEmergency.Text = (dr["EmergencyEscalationProc"].ToString());
                txtLookup.Text = (dr["LookupOption"].ToString());
                txtLU.Text = (dr["LookupBRValidated"].ToString());
                txt360.Text = (dr["Classcode"].ToString());
            }
            myConn.CloseConnection();
        }

        //	Update query for IP Address and user on form page at Accept and Send event
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            string ip1 = Label1.Text;
            string host1 = Label2.Text;
            ArrayList list_emails = new ArrayList();
            int i = 0;
            myConn.Conn();
            MySqlCommand cmd_Email = new MySqlCommand("SELECT Email FROM on1calldev.tbl_members_stationcodes stncode JOIN on1call.tbl_ni_contact con ON stncode.idTBL_Members = con.idTBL_Members WHERE ((con.conType) in ('Primary', 'Alternate')) AND stncode.tbl_members_stationcodesUID = '" + Member + "'", myConn.connection);
            myConn.OpenConnection();
            MySqlDataReader read_Email = cmd_Email.ExecuteReader();
            while(read_Email.Read())
            {
                string email = read_Email.GetValue(i).ToString();
                list_emails.Add(email);
                i = i + 1 - 1;
            }

            foreach(string email_to in list_emails)
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(email_to);
                mail.CC.Add("HSingh@ON1Call.com");
                mail.From = new MailAddress("HSingh@ON1Call.com");
                string Info = txtStationCode.Text;
                mail.Subject = "Accepted " +  Info;
                mail.IsBodyHtml = false;
                string detail = "Dear Member," + Environment.NewLine +
                    Environment.NewLine +
                    "This email is to verify that the IP address:" + ip1+ " and User: "+host1+ " belongs to your department/company and has confirmated the information on NIF Form of: "+ Info+"" + Environment.NewLine +
                    "If you are unaware of any changes performed by the above IP address or the user, please contact the Member Services from Ontario One Call." + Environment.NewLine +
                     Environment.NewLine +
                    "Sincerely," + Environment.NewLine +
                    "Member Services.";
                mail.Body = detail;
                SmtpClient smtp = new SmtpClient(ConfigurationManager.AppSettings["Network"]);
                smtp.Send(mail);
                //string connect = "INSERT INTO on1call.tbl_sys_emailqueue(tbl_sys_emailqueuecol_FROM, tbl_sys_emailqueue_TO, tbl_sys_emailqueuecol_CC, tbl_sys_emailqueuecol_SUBJECT,tbl_sys_emailqueuecol_BODY) VALUES ('"+ mail.From+ "', '" + mail.To + "', '" + mail.CC + "', '" + mail.Subject + "', '" + detail + "')";
                //MySqlCommand cm = new MySqlCommand(connect, myConn.connection);
                //cm.ExecuteNonQuery();
            }
            myConn.CloseConnection();
            Response.Write("<script>alert('Send to Ontario One Call');</script>");
        }


        //private void InsertIpAddress(DataTable dt, string ip1)
        //{
        //    string idTBL_Members = "";
        //    string tbl_members_stationcodesUID = "";
        //    string idtbl_Members_StationCode = "";
        //    string host1 = Label2.Text;

        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        idTBL_Members = dr["idTBL_Members"].ToString();
        //        tbl_members_stationcodesUID = dr["tbl_members_stationcodesUID"].ToString();
        //        idtbl_Members_StationCode = dr["idtbl_Members_StationCode"].ToString();

        //    }

        //    myConn.Conn();
        //    if (myConn.OpenConnection() == true)
        //    {
        //        string insert = "INSERT INTO on1call.test_onlinenif (idTBL_Members, tbl_members_stationcodesUID, idtbl_Members_StationCode,validity_from,validity_end,nif_URL,code) Values('" + idTBL_Members + "', '" + tbl_members_stationcodesUID + "', '" + idtbl_Members_StationCode + "','" + current + "','" + date + "', '" + ran + "','" + Code + "')";
        //        MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
        //        cmd.ExecuteNonQuery();
        //    }
        //    myConn.CloseConnection();
        //}

        private void UpdateIpAddress(DataTable dt, string ip1)
        {
            string idTBL_Members = "";
            string tbl_members_stationcodesUID = "";
            string idtbl_Members_StationCode = "";
            //string ip1 = Label1.Text;
            string host1 = Label2.Text;

            foreach (DataRow dr in dt.Rows)
            {
                idTBL_Members = dr["idTBL_Members"].ToString();
                tbl_members_stationcodesUID = dr["tbl_members_stationcodesUID"].ToString();
                idtbl_Members_StationCode = dr["idtbl_Members_StationCode"].ToString();
            }
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string update = "UPDATE on1call.test_onlinenif SET ipAddress = '" + ip1 + "', code ='" + host1 + "' WHERE idTBL_Members = '" + idTBL_Members + "'";
                MySqlCommand cmd = new MySqlCommand(update, myConn.connection);
                cmd.ExecuteNonQuery();
            }
            myConn.CloseConnection();
        }

        protected void btnReject_Click1(object sender, EventArgs e)
        {
            
        }

        protected void btnSend_Click1(object sender, EventArgs e)
        {
            if(txtReject.Text.Length ==0 || txtName.Text.Length ==0 || txtEmail.Text.Length ==0)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please type your User ID');", true);
                Page.Response.Redirect(Page.Request.Url.ToString());
            }
            else
            {
                return ;
            }
            string ip1 = Label1.Text;
            string host1 = Label2.Text;
            ArrayList list_emails = new ArrayList();
            int i = 0;
            myConn.Conn();
            MySqlCommand cmd_Email = new MySqlCommand("SELECT Email FROM on1calldev.tbl_members_stationcodes stncode JOIN on1call.tbl_ni_contact con ON stncode.idTBL_Members = con.idTBL_Members WHERE ((con.conType) in ('Primary', 'Alternate')) AND stncode.tbl_members_stationcodesUID = '" + Member + "'", myConn.connection);
            myConn.OpenConnection();
            MySqlDataReader read_Email = cmd_Email.ExecuteReader();
            while (read_Email.Read())
            {
                string email = read_Email.GetValue(i).ToString();
                list_emails.Add(email);
                i = i + 1 - 1;
            }

            foreach (string email_to in list_emails)
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(email_to);
                mail.CC.Add("hsingh@ON1Call.com");
                mail.From = new MailAddress("hsingh@ON1Call.com");
                string Info = txtStationCode.Text;
                mail.Subject = "Rejected " + Info;
                mail.IsBodyHtml = false;
                string detail = "Dear Member," + Environment.NewLine +
                     Environment.NewLine +
                "This email is to verify that the IP address:" + ip1 + " and User: " + host1 + " belongs to your department/company and has requested to update the information on NIF Form of: " + Info + "" + Environment.NewLine +
                "Information provided by Member to be updated: " + txtReject.Text + "" 
                + Environment.NewLine +
                "If you are unaware of any changes performed by the above IP address or the user, please contact the Member Services from Ontario One Call." + Environment.NewLine +
                 Environment.NewLine +
                "Sincerely," + Environment.NewLine +
                "Member Services.";
                mail.Body = detail;
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
                //string connect = "INSERT INTO on1call.tbl_sys_emailqueue(tbl_sys_emailqueuecol_FROM, tbl_sys_emailqueue_TO, tbl_sys_emailqueuecol_CC, tbl_sys_emailqueuecol_SUBJECT,tbl_sys_emailqueuecol_BODY) VALUES ('"+ mail.From+ "', '" + mail.To + "', '" + mail.CC + "', '" + mail.Subject + "', '" + detail + "')";
                //MySqlCommand cm = new MySqlCommand(connect, myConn.connection);
                //cm.ExecuteNonQuery();
            }
            myConn.CloseConnection();
            Response.Write("<script>alert('Send');</script>");
        }
    }
}