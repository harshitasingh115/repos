using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;


namespace MemberSignature
{
    public class MysqlConn
    {
        public MySqlConnection connection;

        public void Conn()
        {
            string server = "sql.on1call.local";
            string database = "on1call";
            string uname = "hsingh";
            string password = "8Qca2M4Q";
            string connectionString;
            connectionString = "SERVER=" + server + ";" + "DATABASE=" + database + ";" + "USERNAME=" + uname + ";" + "PASSWORD=" + password + ";" + "SslMode=" + "none" + ";";

            connection = new MySqlConnection(connectionString);
        }

        public bool OpenConnection()
        {
            try
            {
                connection.Open();
                return true;
            }
            catch (MySqlException ex)
            {
                //MessageBox.Show(ex.Message);
                switch (ex.Number)
                {
                    case 0:
                        Console.WriteLine("Cannot connect to server. Contact administrator");
                        break;

                    case 1045:
                        Console.WriteLine("Invalid username/password, please try again");
                        break;
                }
                return false;
            }
        }

        public bool CloseConnection()
        {
            try
            {
                connection.Close();
                return true;
            }
#pragma warning disable CS0168 // The variable 'ex' is declared but never used
            catch (MySqlException ex)
#pragma warning restore CS0168 // The variable 'ex' is declared but never used
            {
                //MessageBox.Show(ex.Message);
                //Console.WriteLine(ex.Message);
                return false;
            }
        }
    }
}