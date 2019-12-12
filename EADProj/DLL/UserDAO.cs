using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADProj.BLL;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;
using EADProj.Email;

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
            // Create random hash value for for DB
            string randHash = Randomize();

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmtInsert = "INSERT INTO [User] (name, password, email, hash) VALUES (@paraName, @paraPassword, @paraEmail, @paraHash)";
            SqlCommand sqlCmd = new SqlCommand(sqlStmtInsert, myConn);

            sqlCmd.Parameters.AddWithValue("@paraName", user.name);
            sqlCmd.Parameters.AddWithValue("@paraEmail", user.email);
            sqlCmd.Parameters.AddWithValue("@paraHash", randHash);

            // Send Email Verification
            SendGridEmail email = new SendGridEmail();
            string hrefLink = "http://localhost:5000/emailVerify.aspx?hash=" + randHash;
            string content = $"<strong>Click <a href=\"{hrefLink}\">here</a> to get verified.</strong>";
            System.Diagnostics.Debug.WriteLine(content);
            email.sendEmail(user.email, user.name, content);

            // SHA256 HASHING USER PASSWORD
            string hashedPw = ComputeSha256Hash(user.password);
            sqlCmd.Parameters.AddWithValue("@paraPassword", hashedPw);

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

            string hashedPw = ComputeSha256Hash(password);

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                return false;
            }
            else
            {
                DataRow row = ds.Tables[0].Rows[0];
                if (hashedPw == row["password"].ToString())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public User GetUserByHash(string hash)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from [User] where hash = @paraHash";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraHash", hash);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];
                User u1 = new User(row["id"].ToString(), row["name"].ToString(), "", row["email"].ToString(), bool.Parse(row["emailVerified"].ToString()), row["hash"].ToString());
                return u1;
            }
            else
            {
                return null;
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
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];
                User u1 = new User(row["id"].ToString(), row["name"].ToString(), "", email);
                return u1;
            }
            else
            {
                return null;
            }
        }

        public void VerifyUser(string email)
        {

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmtInsert = "UPDATE [User] SET emailVerified = @paraVerify WHERE email = @paraEmail";
            SqlCommand sqlCmd = new SqlCommand(sqlStmtInsert, myConn);

            sqlCmd.Parameters.AddWithValue("@paraVerify", true);
            sqlCmd.Parameters.AddWithValue("@paraEmail", email);

            myConn.Open();

            int k = sqlCmd.ExecuteNonQuery();

            if (k != 0)
            {
                System.Diagnostics.Debug.WriteLine(email + " has been verified.");

            }

            myConn.Close();

        }

        static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }


        // Generate a random password  
        public string Randomize()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(RandomString(64, true));
            builder.Append(RandomNumber(1000, 9999));
            builder.Append(RandomString(2, false));
            return builder.ToString();
        }

        // Generate a random number between two numbers  
        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }

        // Generate a random string with a given size  
        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }
    }
}