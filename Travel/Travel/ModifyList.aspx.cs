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
    public partial class ModifyList : System.Web.UI.Page
    {
        public MySqlConnection connection;
        MysqlConn myConn = new MysqlConn();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                Init();
            }
        }

        public void Init()
        {
            DataTable dataTable = new DataTable();
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                //MySqlCommand cmd = new MySqlCommand("SELECT file_refer AS `Reference Number`, userName AS `User Name`, airport_date_requested AS `Date Requested` FROM tms.travel_summary_airport WHERE file_refer IS NOT NULL UNION SELECT  file_refer, userName, car_date_requested FROM tms.travel_summary_car  WHERE file_refer IS NOT NULL UNION SELECT  file_refer, userName, flight_date_requested from tms.travel_summary_flight WHERE file_refer IS NOT NULL UNION SELECT  file_refer, userName, hotel_date_requested FROM tms.travel_summary_hotel  WHERE file_refer IS NOT NULL ORDER BY 1", myConn.connection);
                MySqlCommand cmd = new MySqlCommand("SELECT file_refer AS `Reference Number`, userName AS `User Name`, date_completed AS `Date Completed` FROM tms.travel_summary_airport WHERE file_refer IS NOT NULL and date_completed != 'Not Entered' UNION SELECT  file_refer, userName, date_completed FROM tms.travel_summary_car  WHERE file_refer IS NOT NULL and date_completed != 'Not Entered' UNION SELECT  file_refer, userName, date_completed from tms.travel_summary_flight WHERE file_refer IS NOT NULL and date_completed != 'Not Entered'  UNION SELECT  file_refer, userName, date_completed FROM tms.travel_summary_hotel  WHERE file_refer IS NOT NULL and date_completed != 'Not Entered' ORDER BY 1", myConn.connection);
                MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                adpt.Fill(dataTable);
                grdModify.DataSource = dataTable;
                grdModify.DataBind();
            }
            myConn.CloseConnection();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserInfo.aspx");
        }
    }
}