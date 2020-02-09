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
                l1.image_url = row["image_url"].ToString();
                l1.difficulty = row["difficulty"].ToString();
                l1.duration = row["duration"].ToString();
                l1.overview = row["overview"].ToString();
                l1.category = row["category"].ToString();
                l1.topic = row["topic"].ToString();
                l1.rating_1 = row["rating_1"].ToString();
                l1.rating_2 = row["rating_2"].ToString();
                l1.rating_3 = row["rating_3"].ToString();
                l1.rating_4 = row["rating_4"].ToString();
                l1.rating_5 = row["rating_5"].ToString();


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

        public List<Lesson> RetrieveAllLessons()
        {
            List<Lesson> lessonList = new List<Lesson>();
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from Lesson";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            

            if (rec_cnt == 0)
            {
                return null;
            }
            else
            {
               
                for (var i = 0; i < rec_cnt; i++)
                {
                    Lesson l1 = new Lesson();
                    DataRow row = ds.Tables[0].Rows[i];
                    l1.id = row["id"].ToString();
                    l1.title = row["title"].ToString();
                    l1.price = row["price"].ToString();
                    l1.image_url = row["image_url"].ToString();
                    l1.difficulty = row["difficulty"].ToString();
                    l1.duration = row["duration"].ToString();
                    l1.overview = row["overview"].ToString();
                    l1.category = row["category"].ToString();
                    l1.topic = row["topic"].ToString();
                    l1.rating_1 = row["rating_1"].ToString();
                    l1.rating_2 = row["rating_2"].ToString();
                    l1.rating_3 = row["rating_3"].ToString();
                    l1.rating_4 = row["rating_4"].ToString();
                    l1.rating_5 = row["rating_5"].ToString();
                    lessonList.Add(l1);

                    //System.Diagnostics.Debug.WriteLine("=========" + l1.id+ "========");

                }

                return lessonList;
            }
        }
    }
}