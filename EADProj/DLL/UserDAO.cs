using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADProj.BLL;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EADProj.DLL
{
    public class UserDAO
    {

        public bool CheckByEmail(string email)
        {
            SqlCommand sqlCmd = new SqlCommand();
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from [User] where email = @paraEmail";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraEmail", email);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public void Insert(User user)
        {

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmtInsert = "INSERT INTO [User] (name, password, email) VALUES (@paraName, @paraPassword, @paraEmail)";
            SqlCommand sqlCmd = new SqlCommand(sqlStmtInsert, myConn);

            sqlCmd.Parameters.AddWithValue("@paraName", user.name);
            sqlCmd.Parameters.AddWithValue("@paraPassword", user.password);
            sqlCmd.Parameters.AddWithValue("@paraEmail", user.email);

            myConn.Open();

            int k = sqlCmd.ExecuteNonQuery();

            if (k != 0)
            {
                System.Diagnostics.Debug.WriteLine("User inserted into database");

            }
            
            myConn.Close();

        }

        public bool CheckUserLogin(string email, string password)
        {
            SqlCommand sqlCmd = new SqlCommand();
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from [User] where email = @paraEmail";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraEmail", email);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                return false;
            }
            else
            {
                DataRow row = ds.Tables[0].Rows[0];
                if (password == row["password"].ToString())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public User GetUserByEmail(string email)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from [User] where email = @paraEmail";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraEmail", email);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                return null;
            }
            else
            {
                DataRow row = ds.Tables[0].Rows[0];
                User u1 = new User(row["id"].ToString(),row["name"].ToString(), "", email);
                return u1;
            }
        }
    }
}