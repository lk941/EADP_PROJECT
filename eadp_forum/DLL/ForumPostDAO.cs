using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eadp_forum.BLL;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace eadp_forum.DLL
{
    public class ForumPostDAO
    {

        public void Insert(ForumPost forum)
        {

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmtInsert = "INSERT INTO [forum_post] (user_id, post_title, post_description, post_image, post_tags, post_subject, post_views, post_votes) VALUES (@paraUserID , @paraPost_title, @paraPost_description, @paraPost_image, @paraPost_tags, @paraPost_subject, @paraPost_views, @paraPost_votes)";
            SqlCommand sqlCmd = new SqlCommand(sqlStmtInsert, myConn);

            // sqlCmd.Parameters.AddWithValue("@paraPostID", forum.post_id);
            sqlCmd.Parameters.AddWithValue("@paraUserID", forum.user_id);
            sqlCmd.Parameters.AddWithValue("@paraPost_title", forum.post_title);
            sqlCmd.Parameters.AddWithValue("@paraPost_description", forum.post_description);
            sqlCmd.Parameters.AddWithValue("@paraPost_image", forum.post_image);
            sqlCmd.Parameters.AddWithValue("@paraPost_tags", forum.post_tags);
            sqlCmd.Parameters.AddWithValue("@paraPost_subject", forum.post_subject);
            sqlCmd.Parameters.AddWithValue("@paraPost_views", forum.post_views);
            sqlCmd.Parameters.AddWithValue("@paraPost_votes", forum.post_votes);

            myConn.Open();

            int k = sqlCmd.ExecuteNonQuery();

            if (k != 0)
            {
                System.Diagnostics.Debug.WriteLine("Forum Post inserted into database");

            }

            myConn.Close();

        }

        public ForumPost GetPostByID(string post_id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from [forum_post] where post_id = @paraPostID";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraPostID", post_id);
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
                ForumPost post1 = new ForumPost(row["user_id"].ToString(), row["post_title"].ToString(), row["post_description"].ToString(), row["post_image"].ToString(), row["post_tags"].ToString(), row["post_subject"].ToString(), Convert.ToInt16(row["post_views"]), Convert.ToInt16(row["post_votes"]));
                return post1;
            }
        }

        public int UpdatePostDetails(int post_id, string post_title, string post_desc, string post_subject, string post_tags)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "UPDATE forum_post SET post_title = @paraPostTitle, post_description = @paraPostDesc, post_subject = @paraPostSubj, post_tags = @paraPostTags WHERE post_id = @paraPostID";

            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);


            sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@paraPostTitle", post_title);
            sqlCmd.Parameters.AddWithValue("@paraPostDesc", post_desc);
            sqlCmd.Parameters.AddWithValue("@paraPostSubj", post_subject);
            sqlCmd.Parameters.AddWithValue("@paraPostTags", post_tags);
            sqlCmd.Parameters.AddWithValue("@paraPostID", post_id);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();

            return result;
        }

        public int UpdatePostViews(int post_id, int post_views)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "UPDATE forum_post SET post_views = @paraPostViews where post_id = @paraPostID";

            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);


            sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@paraPostViews", post_views);
            sqlCmd.Parameters.AddWithValue("@paraPostID", post_id);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();

            return result;
        }

        public int DeletePost(int post_id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "DELETE FROM forum_post WHERE post_id = @paraPostID";

            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);


            sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@paraPostID", post_id);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();

            return result;
        }

    }
}