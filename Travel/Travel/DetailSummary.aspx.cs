using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travel
{
    public partial class DetailSummary : System.Web.UI.Page
    {
        public MySqlConnection connection;
        MysqlConn myConn = new MysqlConn();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                detailInfo();
            }
        }

        public void detailInfo()
        {
            DataTable dt = new DataTable();
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                //MySqlCommand cmd = new MySqlCommand("SELECT hotel.userName,hotel.hotel_CONGrandTotal,(hotel.hotel_CONGrandTotal) AS `GrandTotal`,SUBSTRING(hotel_date_requested, 1, 2) AS Month FROM tms.travel_summary_hotel hotel WHERE hotel.date_completed IS NOT NULL AND hotel_CONGrandTotal >= 1 GROUP BY hotel.userName", myConn.connection);
                MySqlCommand cmd = new MySqlCommand("SELECT SUBSTRING(hotel.date_completed, 9, 2) AS File_Number,sum.userName, GREATEST(hotel.date_completed, car.date_completed,flight.date_completed, airport.date_completed) AS Recent_Date FROM tms.travel_summary sum JOIN tms.travel_summary_hotel hotel ON hotel.userName = sum.userName JOIN tms.travel_summary_car car ON car.userName = sum.userName JOIN tms.travel_summary_flight flight ON flight.userName = sum.userName JOIN tms.travel_summary_airport airport ON airport.userName = sum.userName WHERE hotel.date_completed != 'Not Entered' AND car.date_completed != 'Not Entered' AND flight.date_completed != 'Not Entered' AND airport.date_completed != 'Not Entered' GROUP by sum.userName, Recent_Date; ", myConn.connection);
                MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                adpt.Fill(dt);
            }
            myConn.CloseConnection();
            CreateDetailedTable(dt);
        }

        public void CreateDetailedTable(DataTable dataDt)
        {
            DataTable gridDt = new DataTable();
            gridDt.Columns.Add("File_Number");
            gridDt.Columns.Add("userName");
            gridDt.Columns.Add("Recent_Date");

            //Dictionary<int, Dictionary<string, decimal>> dict = new Dictionary<int, Dictionary<string, decimal>>();
            int j = 001;
            foreach (DataRow dr in dataDt.Rows)
            {
                if(dr["File_Number"] != "")
                {
                    string temp = "";
                    if (j <= 9)
                    {
                        temp = dr["File_Number"].ToString() + "-00" + j;
                    }
                    else if(j <= 99)
                    {
                        temp = dr["File_Number"].ToString() + "-0" + j;
                    }
                    else
                    {
                        temp = dr["File_Number"].ToString() + "-" + j;
                    }
                    j++;
                    gridDt.Rows.Add(new object[] { temp, dr["userName"], dr["Recent_Date"] });
                }
            }
            GridView1.DataSource = gridDt;
            GridView1.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserInfo.aspx");
        }
    }
}