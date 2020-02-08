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
    public class FCommentDAO
    {

        public void Insert(FComment fcomment)
        {

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmtInsert = "INSERT INTO [Fcomment] (user_id, comment, votes, post_id) VALUES (@paraUser_ID, @paraComment, @paraVotes, @paraPost_ID)";
            SqlCommand sqlCmd = new SqlCommand(sqlStmtInsert, myConn);

            // sqlCmd.Parameters.AddWithValue("@paraPostID", forum.post_id);
            // sqlCmd.Parameters.AddWithValue("@paraFCommentID", fcomment.fcomment_id);
            sqlCmd.Parameters.AddWithValue("@paraUser_ID", fcomment.user_id);
            sqlCmd.Parameters.AddWithValue("@paraComment", fcomment.comment);
            sqlCmd.Parameters.AddWithValue("@paraVotes", fcomment.votes);
            sqlCmd.Parameters.AddWithValue("@paraPost_ID", fcomment.post_id);

            myConn.Open();

            int k = sqlCmd.ExecuteNonQuery();

            if (k != 0)
            {
                System.Diagnostics.Debug.WriteLine("Forum Comment inserted into database");

            }

            myConn.Close();

        }

        public FComment GetCommentByID(string comment_id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from [Fcomment] where comment_id = @paraFCommentID";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraFCommentID", comment_id);
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
                FComment comment1 = new FComment(row["user_id"].ToString(), row["comment"].ToString(), Convert.ToInt16(row["votes"]), Convert.ToInt16(row["post_id"]));
                return comment1;
            }
        }

        public int DeleteComment(int fcomment_id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "DELETE FROM Fcomment WHERE fcomment_id = @paraFCommentID";

            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);


            sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@paraFCommentID", fcomment_id);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();

            return result;
        }

        public int UpdateVotes(int fcomment_id, int votes)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "UPDATE Fcomment SET votes = @paraVotes where fcomment_id = @paraFCommentID";

            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);


            sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@paraVotes", votes);
            sqlCmd.Parameters.AddWithValue("@paraFCommentID", fcomment_id);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();

            return result;
        }

    }
}