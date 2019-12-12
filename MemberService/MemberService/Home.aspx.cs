using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using MySql.Data.MySqlClient;
using System.Data;

namespace MemberSignature
{
    //1329, 1290
    public partial class Home : System.Web.UI.Page
    {
        public MySqlConnection connection;
        Random R = new Random();
        public static string Ran = "";
        public static string Code = "";

        MysqlConn myConn = new MysqlConn();
        public static string Member = Global.ImportantData;
        public static string MemberID;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string StationCode = txtStation.Text;
            MemberID = txtMemberID.Text;
            Member = StationCode;
            Global.ImportantData = Member;
            if (Member == "" || MemberID == "")
            {
                Response.Write("Please enter the Name and Description for the Campaign");
                return;
            }
            else
            {
                Response.Write("Thank you for providing the detail");
            }

            //btnSearch.Attributes.Add("onclick", "return confirm('Are you sure you want to do this');");
            string Ran = Request.QueryString["Ran"];
            Ran = Random.link;
            var ran1 = "?" + Ran;
            txtFormUrl.Text = "http://" + Request.Url.Authority + "/Form.aspx/" + "" + ran1;



            var dt = SelectMember(MemberID);
            var dtUrl = SearchUrlInformation(dt);
            if (dt.Rows.Count > 0)
            {
                if (dtUrl.Rows.Count <= 0)
                {
                    insertUrlString(dt, ran1);
                }
                else
                {
                    updateUrlString(dt, ran1);
                }
            }
            else
            {
                //TODO;
            }
            Response.Write("<script>alert('Received');</script>");
        }

        protected DataTable SearchUrlInformation(DataTable member)
        {
            string idTBL_Members = "";
            string tbl_members_stationcodesUID = "";
            string idtbl_Members_StationCode = "";
            foreach (DataRow dr in member.Rows)
            {
                idTBL_Members = dr["idTBL_Members"].ToString();
                tbl_members_stationcodesUID = dr["tbl_members_stationcodesUID"].ToString();
                idtbl_Members_StationCode = dr["idtbl_Members_StationCode"].ToString();

            }

            DataTable dt = new DataTable();
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string query = "SELECT * FROM on1call.test_onlinenif WHERE idTBL_Members = '" + idTBL_Members + "'";
                MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(query, myConn.connection);
                mySqlDataAdapter.Fill(dt);
            }
            return dt;
        }

        protected DataTable SelectMember(string memberId)
        {
            DataTable dt = new DataTable();
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string query = "SELECT *FROM on1call.tbl_members_stationcodes WHERE tbl_members_stationcodesUID = '" + memberId + "'";
                MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(query, myConn.connection);
                mySqlDataAdapter.Fill(dt);
            }
            return dt;
        }

        public void insertUrlString(DataTable dt, string ran)
        {
            string idTBL_Members = "";
            string tbl_members_stationcodesUID = "";
            string idtbl_Members_StationCode = "";
            Code = Random.randomNumber;
            txtCode.Text = Code.ToString();

            cal.Text = Calendar1.TodaysDate.AddDays(2).ToString("yyyy-MM-dd hh:mm:ss");
            cal.Visible = false;
            string date = cal.Text;

            string current = Calendar1.TodaysDate.ToString("yyyy-MM-dd hh:mm:ss");

            foreach (DataRow dr in dt.Rows)
            {
                idTBL_Members = dr["idTBL_Members"].ToString();
                tbl_members_stationcodesUID = dr["tbl_members_stationcodesUID"].ToString();
                idtbl_Members_StationCode = dr["idtbl_Members_StationCode"].ToString();
            }

            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string insert = "INSERT INTO on1call.test_onlinenif (idTBL_Members, tbl_members_stationcodesUID, idtbl_Members_StationCode,validity_from,validity_end,nif_URL,code) Values('" + idTBL_Members + "', '" + tbl_members_stationcodesUID + "', '" + idtbl_Members_StationCode + "','" + current + "','" + date + "', '" + ran + "','" + Code + "')";
                MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
                cmd.ExecuteNonQuery();
            }
            myConn.CloseConnection();
        }

        private void updateUrlString(DataTable dt, string ran)
        {
            string idTBL_Members = "";
            string tbl_members_stationcodesUID = "";
            string idtbl_Members_StationCode = "";
            Code = Random.randomNumber;
            txtCode.Text = Code.ToString();

            foreach (DataRow dr in dt.Rows)
            {
                idTBL_Members = dr["idTBL_Members"].ToString();
                tbl_members_stationcodesUID = dr["tbl_members_stationcodesUID"].ToString();
                idtbl_Members_StationCode = dr["idtbl_Members_StationCode"].ToString();
            }
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                string insert = "UPDATE on1call.test_onlinenif SET nif_URL = '" + ran + "', code ='" + Code + "' WHERE idTBL_Members = '" + idTBL_Members + "'";
                MySqlCommand cmd = new MySqlCommand(insert, myConn.connection);
                cmd.ExecuteNonQuery();
            }
            myConn.CloseConnection();
        }
    }
}