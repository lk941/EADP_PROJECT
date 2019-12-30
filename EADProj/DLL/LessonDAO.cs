using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using EADProj.BLL;

namespace EADProj.DLL
{
    public class LessonDAO
    {
        public Lesson GetLessonById(string id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from Lesson where id = @paraId";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraId", id);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            Lesson l1 = new Lesson();

            if (rec_cnt == 0)
            {
                return null;
            }
            else
            {
                DataRow row = ds.Tables[0].Rows[0];
                l1.id = row["id"].ToString();
                l1.title = row["title"].ToString();
                l1.price = row["price"].ToString();
                l1.rating = row["rating"].ToString();
                l1.difficulty = row["difficulty"].ToString();
                l1.duration = row["duration"].ToString();
                return l1;
            }
        }

        public int GetLengthOfDB()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from Lesson";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            return rec_cnt;
        }
    }
}