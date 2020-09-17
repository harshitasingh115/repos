using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travel
{
    public partial class TestUserInfo : System.Web.UI.Page
    {
        public MySqlConnection connection;
        MysqlConn myConn = new MysqlConn();
        string userInfo;
        string userFileReference;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //detailInfo();
                sumInfor();
                Infor();
            }
        }

        public void sumInfor()
        {
            DataTable dataTable = new DataTable();
            myConn.Conn();
            if(myConn.OpenConnection() == true)
            {
                //MySqlCommand cmd = new MySqlCommand("SELECT sum.userName, GREATEST(hotel.date_completed, car.date_completed,flight.date_completed, airport.date_completed) AS date_completed FROM tms.travel_summary sum JOIN tms.travel_summary_hotel hotel ON hotel.userName = sum.userName JOIN tms.travel_summary_car car ON car.userName = sum.userName JOIN tms.travel_summary_flight flight ON flight.userName = sum.userName JOIN tms.travel_summary_airport airport ON airport.userName = sum.userName WHERE hotel.date_completed = 'Not Entered' AND car.date_completed = 'Not Entered' AND flight.date_completed = 'Not Entered' AND airport.date_completed = 'Not Entered'", myConn.connection);
                MySqlCommand cmd = new MySqlCommand("SELECT userName, date_completed, file_refer FROM tms.travel_summary_airport WHERE file_refer IS NOT NULL and date_completed = 'Not Entered' UNION SELECT userName, date_completed, file_refer  FROM tms.travel_summary_car  WHERE file_refer IS NOT NULL and date_completed = 'Not Entered' UNION SELECT userName, date_completed, file_refer  from tms.travel_summary_flight WHERE file_refer IS NOT NULL and date_completed = 'Not Entered' UNION SELECT userName, date_completed, file_refer FROM tms.travel_summary_hotel  WHERE file_refer IS NOT NULL and date_completed = 'Not Entered' ORDER BY 3", myConn.connection);
                MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                adpt.Fill(dataTable);
                GridView2.DataSource = dataTable;
                GridView2.DataBind();
            }
            myConn.CloseConnection();
        }

        public void Infor()
        {
            DataTable dt1 = new DataTable();
            myConn.Conn();
            if (myConn.OpenConnection() == true)
            {
                //MySqlCommand sqlCommand = new MySqlCommand("");
                //MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(sqlCommand);
                //mySqlDataAdapter.Fill();
                //GrdModify.DataSource = ;
                //GrdModify.DataBind();
                if (ddTravelOption.SelectedValue == "Airport")
                {
                    MySqlCommand cmd = new MySqlCommand("SELECT userName, date_completed, file_refer FROM tms.travel_summary_airport WHERE date_completed ='Not Entered' ORDER BY 3", myConn.connection);
                    MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                    adpt.Fill(dt1);
                    GridView2.DataSource = dt1;
                    GridView2.DataBind();

                    detailInfo("Airport");
                }
                else if (ddTravelOption.SelectedValue == "Car")
                {
                    MySqlCommand cmd = new MySqlCommand("SELECT userName, date_completed, file_refer FROM tms.travel_summary_car WHERE date_completed ='Not Entered' ORDER BY 3", myConn.connection);
                    MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                    adpt.Fill(dt1);
                    GridView2.DataSource = dt1;
                    GridView2.DataBind();
                    detailInfo("Car");
                }
                else if (ddTravelOption.SelectedValue == "Flight")
                {
                    MySqlCommand cmd = new MySqlCommand("SELECT userName, date_completed, file_refer FROM tms.travel_summary_flight WHERE date_completed ='Not Entered' ORDER BY 3", myConn.connection);
                    MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                    adpt.Fill(dt1);
                    GridView2.DataSource = dt1;
                    GridView2.DataBind();
                    detailInfo("Flight");
                }
                else if (ddTravelOption.SelectedValue == "Hotel")
                {
                    MySqlCommand cmd = new MySqlCommand("SELECT userName, date_completed, file_refer FROM tms.travel_summary_hotel WHERE date_completed ='Not Entered' ORDER BY 3", myConn.connection);
                    MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                    adpt.Fill(dt1);
                    GridView2.DataSource = dt1;
                    GridView2.DataBind();
                    detailInfo("Hotel");
                }
                else
                {
                    //MySqlCommand cmd = new MySqlCommand("SELECT idtravel_summary_hotel,userName, date_completed, file_refer FROM tms.travel_summary_hotel WHERE date_completed ='Not Entered'", myConn.connection);
                    MySqlCommand cmd = new MySqlCommand("SELECT userName, date_completed, file_refer FROM tms.travel_summary_airport WHERE file_refer IS NOT NULL and date_completed = 'Not Entered' UNION SELECT userName, date_completed, file_refer  FROM tms.travel_summary_car  WHERE file_refer IS NOT NULL and date_completed = 'Not Entered' UNION SELECT userName, date_completed, file_refer  from tms.travel_summary_flight WHERE file_refer IS NOT NULL and date_completed = 'Not Entered' UNION SELECT userName, date_completed, file_refer FROM tms.travel_summary_hotel  WHERE file_refer IS NOT NULL and date_completed = 'Not Entered' ORDER BY 3", myConn.connection);
                    MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                    adpt.Fill(dt1);
                    GridView2.DataSource = dt1;
                    GridView2.DataBind();
                    detailInfo("");
                }
            }
            myConn.CloseConnection();
        }


        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell statusCell = e.Row.Cells[1];
                if (statusCell.Text == "")
                {
                    statusCell.Text = "Recently Entered";
                }
                TableCell cell = e.Row.Cells[0];
                userInfo = cell.Text;
                TableCell cellRef = e.Row.Cells[2];
                userFileReference = cellRef.Text;
            }
        }

        protected void OnRowDataBoundModify(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell statusCell = e.Row.Cells[1];
                if (statusCell.Text == "")
                {
                    statusCell.Text = "Recently Entered";
                }
                TableCell cell = e.Row.Cells[0];
                userInfo = cell.Text;
                TableCell cellRef = e.Row.Cells[2];
                userFileReference = cellRef.Text;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Review.aspx?userInfo={0}" + userInfo);
            //Response.Redirect("Review.aspx?userFileReference = userFileReference");
            //Response.Redirect("Review.aspx?userFileReference=" + userFileReference);
        }

        protected void ddTravelOption_SelectedIndexChanged(object sender, EventArgs e)
        {
            Infor();
        }


        public void detailInfo(string condition)
        {
            DataTable dt = new DataTable();

            if(condition == "Airport")
            {
                MySqlCommand cmd = new MySqlCommand("SELECT sum.userName, airport.airport_CONGrandTotal AS `GrandTotal`, SUBSTRING(airport.date_completed, 1, 2) AS Month FROM tms.travel_summary sum JOIN tms.travel_summary_airport airport ON airport.userName = sum.userName WHERE airport.date_completed != 'Not Entered' GROUP BY sum.userName, airport.date_completed", myConn.connection);
                MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                adpt.Fill(dt);
            }
            else if (condition == "Car")
            {
                MySqlCommand cmd = new MySqlCommand("SELECT sum.userName, car.car_CONGrandTotal AS `GrandTotal`, SUBSTRING(car.date_completed, 1, 2) AS Month FROM tms.travel_summary sum JOIN tms.travel_summary_car car ON car.userName = sum.userName WHERE car.date_completed != 'Not Entered' GROUP BY sum.userName, car.date_completed", myConn.connection);
                MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                adpt.Fill(dt);
            }
            else if (condition == "Flight")
            {
                MySqlCommand cmd = new MySqlCommand("SELECT sum.userName, flight.flight_CONGrandTotal AS `GrandTotal`, SUBSTRING(flight.date_completed, 1, 2) AS Month FROM tms.travel_summary sum JOIN tms.travel_summary_flight flight ON flight.userName = sum.userName WHERE flight.date_completed != 'Not Entered' GROUP BY sum.userName, flight.date_completed", myConn.connection);
                MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                adpt.Fill(dt);
            }
            else if (condition == "Hotel")
            {
                MySqlCommand cmd = new MySqlCommand("SELECT sum.userName, hotel.hotel_CONGrandTotal AS `GrandTotal`, SUBSTRING(hotel.date_completed, 1, 2) AS Month FROM tms.travel_summary sum JOIN tms.travel_summary_hotel hotel ON hotel.userName = sum.userName WHERE hotel.date_completed != 'Not Entered' GROUP BY sum.userName, hotel.date_completed", myConn.connection);
                MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                adpt.Fill(dt);
            }
            else
            {
                MySqlCommand cmd = new MySqlCommand("SELECT sum.userName, SUM(hotel.hotel_CONGrandTotal + car.car_CONGrandTotal + flight.flight_CONGrandTotal + airport.airport_CONGrandTotal) AS `GrandTotal`, SUBSTRING(hotel.date_completed, 1, 2) AS Month FROM tms.travel_summary sum JOIN tms.travel_summary_hotel hotel ON hotel.userName = sum.userName JOIN tms.travel_summary_car car ON car.userName = sum.userName JOIN tms.travel_summary_flight flight ON flight.userName = sum.userName JOIN tms.travel_summary_airport airport ON airport.userName = sum.userName WHERE hotel.date_completed != 'Not Entered' AND car.date_completed != 'Not Entered' AND flight.date_completed != 'Not Entered' AND airport.date_completed != 'Not Entered' GROUP BY sum.userName, hotel.date_completed", myConn.connection);
                MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
                adpt.Fill(dt);
            }

            //myConn.Conn();
            //if (myConn.OpenConnection() == true)
            //{
            //    //MySqlCommand cmd = new MySqlCommand("SELECT hotel.userName,hotel.hotel_CONGrandTotal,(hotel.hotel_CONGrandTotal) AS `GrandTotal`,SUBSTRING(hotel_date_requested, 1, 2) AS Month FROM tms.travel_summary_hotel hotel WHERE hotel.date_completed IS NOT NULL AND hotel_CONGrandTotal >= 1 GROUP BY hotel.userName", myConn.connection);
            //    MySqlCommand cmd = new MySqlCommand("SELECT sum.userName, SUM(hotel.hotel_CONGrandTotal + car.car_CONGrandTotal + flight.flight_CONGrandTotal + airport.airport_CONGrandTotal) AS `GrandTotal`, SUBSTRING(hotel.date_completed, 1, 2) AS Month FROM tms.travel_summary sum JOIN tms.travel_summary_hotel hotel ON hotel.userName = sum.userName JOIN tms.travel_summary_car car ON car.userName = sum.userName JOIN tms.travel_summary_flight flight ON flight.userName = sum.userName JOIN tms.travel_summary_airport airport ON airport.userName = sum.userName WHERE hotel.date_completed != 'Not Entered' AND car.date_completed != 'Not Entered' AND flight.date_completed != 'Not Entered' AND airport.date_completed != 'Not Entered' GROUP BY sum.userName, hotel.date_completed", myConn.connection);
            //    MySqlDataAdapter adpt = new MySqlDataAdapter(cmd);
            //    adpt.Fill(dt);
            //}
            //myConn.CloseConnection();
            CreateDetailedTable(dt);
        }


        public void CreateDetailedTable(DataTable dataDt)
        {
            DataTable gridDt = new DataTable();
            gridDt.Columns.Add("Employee");
            gridDt.Columns.Add("January");
            gridDt.Columns.Add("February");
            gridDt.Columns.Add("March");
            gridDt.Columns.Add("April");
            gridDt.Columns.Add("May");
            gridDt.Columns.Add("June");
            gridDt.Columns.Add("July");
            gridDt.Columns.Add("August");
            gridDt.Columns.Add("September");
            gridDt.Columns.Add("October");
            gridDt.Columns.Add("November");
            gridDt.Columns.Add("December");
            gridDt.Columns.Add("Total by Employee");

            Dictionary<string, Dictionary<int, decimal>> dict = new Dictionary<string, Dictionary<int, decimal>>();

            foreach (DataRow dr in dataDt.Rows)
            {
                Dictionary<int, decimal> listDict = new Dictionary<int, decimal>();

                if (dr["GrandTotal"].GetType().GetProperties().Any())
                {
                    listDict.Add(Convert.ToInt16(dr["Month"]), Convert.ToDecimal(dr["GrandTotal"]));
                }
                else
                {
                    listDict.Add(Convert.ToInt16(dr["Month"]), 0);
                }

                if (dict.ContainsKey(dr["userName"].ToString()))
                {

                    var existingUser = dataDt.AsEnumerable().Where(x => x.Field<string>("userName") == dr["userName"].ToString());

                    foreach (var dr1 in existingUser.ToList())
                    {
                        var month1 = Convert.ToInt16(dr1.Field<string>("Month").ToString());
                        var gTotal = dr1["GrandTotal"];
                        if (gTotal.GetType().GetProperties().Any())
                        {
                            var grandTotal1 = Convert.ToDecimal(gTotal.ToString());
                            if (!listDict.ContainsKey(month1))
                            {
                                listDict.Add(month1, grandTotal1);
                            }
                        }
                        else
                        {
                            //var grandTotal1 = Convert.ToDecimal(gTotal.ToString());
                            if (!listDict.ContainsKey(month1))
                            {
                                listDict.Add(month1, 0);
                            }
                        }
                    }
                    dict[dr["userName"].ToString()] = listDict;
                }
                else
                {
                    dict.Add(dr["userName"].ToString(), listDict);
                }
            }
            foreach(var dictData in dict)
            {
                string jan = "";
                string feb = "";
                string mar = "";
                string apr = "";
                string may = "";
                string jun = "";
                string jul = "";
                string aug = "";
                string sep = "";
                string oct = "";
                string nov = "";
                string dec = "";

                foreach(var data in dictData.Value)
                {
                    if(data.Key == 1)
                    {
                        jan = data.Value.ToString();
                    }
                    else if(data.Key == 2)
                    {
                        feb = data.Value.ToString();
                    }
                    else if (data.Key == 3)
                    {
                        mar = data.Value.ToString();
                    }
                    else if (data.Key == 4)
                    {
                        apr = data.Value.ToString();
                    }
                    else if (data.Key == 5)
                    {
                        may = data.Value.ToString();
                    }
                    else if (data.Key == 6)
                    {
                        jun = data.Value.ToString();
                    }
                    else if (data.Key == 7)
                    {
                        jul = data.Value.ToString();
                    }
                    else if (data.Key == 8)
                    {
                        aug = data.Value.ToString();
                    }
                    else if (data.Key == 9)
                    {
                        sep = data.Value.ToString();
                    }
                    else if (data.Key == 10)
                    {
                        oct = data.Value.ToString();
                    }
                    else if (data.Key == 11)
                    {
                        nov = data.Value.ToString();
                    }
                    else if (data.Key == 12)
                    {
                        dec = data.Value.ToString();
                    }
                }

                var gTotal = Convert.ToDecimal(jan != "" ? jan : "0") +
                             Convert.ToDecimal(feb != "" ? feb : "0") +
                             Convert.ToDecimal(mar != "" ? mar : "0") +
                             Convert.ToDecimal(apr != "" ? apr : "0") +
                             Convert.ToDecimal(may != "" ? may : "0") +
                             Convert.ToDecimal(jun != "" ? jun : "0") +
                             Convert.ToDecimal(jul != "" ? jul : "0") +
                             Convert.ToDecimal(aug != "" ? aug : "0") +
                             Convert.ToDecimal(sep != "" ? sep : "0") +
                             Convert.ToDecimal(oct != "" ? oct : "0") +
                             Convert.ToDecimal(nov != "" ? nov : "0") +
                             Convert.ToDecimal(dec != "" ? dec : "0");

                var newDr = new object[] { dictData.Key, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec, gTotal };
                gridDt.Rows.Add(newDr);
            }
            GridView3.DataSource = gridDt;
            GridView3.DataBind();
        }

        //protected void OnRowDataBound1(object sender, GridViewRowEventArgs e)
        //{
        //    //if (e.Row.RowType == DataControlRowType.DataRow)
        //    //{
        //    //    for (int i = 0; i < e.Row.Cells.Count; i++)
        //    //    {
        //    //        TextBox text = new TextBox();
        //    //        text.Text = e.Row.Cells[i].Text;
        //    //        e.Row.Cells[i].Text = "$";
        //    //        e.Row.Cells[i].Controls.Add(text);
        //    //    }
        //    //}
        //}

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "TravelSummary" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView3.GridLines = GridLines.Both;
            GridView3.HeaderStyle.Font.Bold = true;
            GridView3.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void GridViewOnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Check if the row is datarow or not
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Loop through each cells in a row
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].Text = "$" + e.Row.Cells[i].Text;
                    string userName = e.Row.Cells[0].Text;
                    string amount = e.Row.Cells[2].Text;
                    string amountRef = amount.TrimStart('$');
                    string nameRef = userName.TrimStart('$');
                    e.Row.Cells[0].Text = nameRef;
                    //if (amount == "$&nbsp;")
                    //{
                    //    for (int i = 1; i < e.Row.Cells.Count; i++)
                    //    {
                    //        e.Row.Cells[2].Text = amountRef;
                    //    }
                    //}
                }
            }
        }

        protected void btnCompleted_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailSummary.aspx");
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyList.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Summary.aspx");
        }
    }
}