using eadLab5.BLL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace eadLab5.DAL
{
    public class LessonDAO
    {
        public List<Lesson> SelectAll()
        {
            //Step 1 -  Define a connection to the database by getting
            //          the connection string from web.config
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            //Step 2 -  Create a DataAdapter to retrieve data from the database table
            string sqlStmt = "Select * from Lesson";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            //Step 3 -  Create a DataSet to store the data to be retrieved
            DataSet ds = new DataSet();

            //Step 4 -  Use the DataAdapter to fill the DataSet with data retrieved
            da.Fill(ds);

            //Step 5 -  Read data from DataSet to List
            List<Lesson> lesList = new List<Lesson>();
            int rec_cnt = ds.Tables[0].Rows.Count;
            for (int i=0; i<rec_cnt; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];  // Sql command returns only one record
                string code = row["code"].ToString();
                string name = row["name"].ToString();
                string timing = row["timing"].ToString();
                string subj = row["subj"].ToString();
                string teacher = row["teacher"].ToString();

                Lesson obj = new Lesson(code, name, timing, subj, teacher);
                lesList.Add(obj);
            }

            return lesList;
        }
        public Lesson SelectById(string code)
        {
            //Step 1 -  Define a connection to the database by getting
            //          the connection string from web.config
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            //Step 2 -  Create a DataAdapter to retrieve data from the database table
            string sqlStmt = "Select * from Lesson where code = @paraCode";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraCode", code);

            //Step 3 -  Create a DataSet to store the data to be retrieved
            DataSet ds = new DataSet();

            //Step 4 -  Use the DataAdapter to fill the DataSet with data retrieved
            da.Fill(ds);

            //Step 5 -  Read data from DataSet.
            Lesson les = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];  // Sql command returns only one record
                string name = row["name"].ToString();
                string timing = row["timing"].ToString();
                string subj = row["subj"].ToString();
                string teacher = row["teacher"].ToString();



             les = new Lesson(code, name, timing, subj, teacher);
            }
            else
            {
                les = null;
            }

            return les;
        }

        public int Insert(Lesson les)
        {
            // Execute NonQuery return an integer value
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            //Step 1 -  Define a connection to the database by getting
            //          the connection string from web.config
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // Step 2 - Instantiate SqlCommand instance to add record 
            //          with INSERT statement
            string sqlStmt = "INSERT INTO Lesson (code, name, timing, subj, teacher) " +
                "VALUES (@paraCode,@paraName, @paraTiming, @paraSubj, @paraTeacher)";
            sqlCmd = new SqlCommand(sqlStmt, myConn);

            // Step 3 : Add each parameterised variable with value
            sqlCmd.Parameters.AddWithValue("@paraCode", les.Code);
            sqlCmd.Parameters.AddWithValue("@paraName", les.Name);
            sqlCmd.Parameters.AddWithValue("@paraTiming", les.Timing);
            sqlCmd.Parameters.AddWithValue("@paraSubj", les.Subj);
            sqlCmd.Parameters.AddWithValue("@paraTeacher", les.Teacher);

            // Step 4 Open connection the execute NonQuery of sql command   
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }
        public int Update(Lesson les)
        {
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // Step 2 - Instantiate SqlCommand instance to add record 
            //          with INSERT statement
            string sqlStmt = "UPDATE Lesson SET name = @paraName, timing = @paraTiming, " +
                "subj = @paraSubj, teacher = @paraTeacher where code = @paraCode ";

            sqlCmd = new SqlCommand(sqlStmt, myConn);

            // Step 3 : Add each parameterised variable with value
            sqlCmd.Parameters.AddWithValue("@paraCode", les.Code);
            sqlCmd.Parameters.AddWithValue("@paraName", les.Name);
            sqlCmd.Parameters.AddWithValue("@paraTiming", les.Timing);
            sqlCmd.Parameters.AddWithValue("@paraSubj", les.Subj);
            sqlCmd.Parameters.AddWithValue("@paraTeacher", les.Teacher);

            // Step 4 Open connection the execute NonQuery of sql command   
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }
    }
}