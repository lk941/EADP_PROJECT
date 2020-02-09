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
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;

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

        public User oauthLogin(User user)
        {
            if (GetUserByEmail(user.email) == null)
            {
                string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                SqlConnection myConn = new SqlConnection(DBConnect);

                string sqlStmtInsert = "INSERT INTO [User] (name, email, imageURL, emailVerified) VALUES (@paraName, @paraEmail, @paraImage, @paraVerified)";
                SqlCommand sqlCmd = new SqlCommand(sqlStmtInsert, myConn);

                sqlCmd.Parameters.AddWithValue("@paraName", user.name);
                sqlCmd.Parameters.AddWithValue("@paraEmail", user.email);
                sqlCmd.Parameters.AddWithValue("@paraImage", user.imageURL);
                sqlCmd.Parameters.AddWithValue("@paraVerified", user.emailVerified);

                myConn.Open();

                int k = sqlCmd.ExecuteNonQuery();

                if (k != 0)
                {
                    System.Diagnostics.Debug.WriteLine("User inserted into database");

                }

                myConn.Close();

                var u1 = new User(user.name, user.email, user.imageURL);

                return u1;

            } else
            {
                var u1 = GetUserByEmail(user.email);

                return u1;
            }

        }

        public bool checkOauthUser(string email)
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
                string pw = row["password"].ToString();
                //System.Diagnostics.Debug.WriteLine(pw);
                if (pw.Length < 1)
                {
                    //System.Diagnostics.Debug.WriteLine("User is an oauth user");
                    return true;
                } else
                {
                    //System.Diagnostics.Debug.WriteLine("User is not an oauth user");
                    return false;
                }
            }
            else
            {
                //System.Diagnostics.Debug.WriteLine("User's Account doesnt exist");
                return false;
            }

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

        public User GetTeacherLocationById(string id)
        {
            //System.Diagnostics.Debug.WriteLine("THE ID OF THE TEACHER IS " + id);
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from [User] where id = @paraId";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraId", id);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];
                User u1 = new User(row["id"].ToString(), row["name"].ToString(), "", row["email"].ToString(), true, "", row["imageURL"].ToString(), row["role"].ToString(), row["rank"].ToString(), row["address"].ToString(), row["street"].ToString(), row["country"].ToString(), row["postalCode"].ToString(), row["unitNo"].ToString());
                return u1;
            }
            else
            {
                return null;
            }
        }

        public List<User> Get4RandomTeachers()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from [User] where role = 'Teacher'";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            var lUser = new List<User>();

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt > 0)
            {
                for (var i = 0; i < rec_cnt; i++)
                {
                    DataRow row = ds.Tables[0].Rows[i];
                    User u1 = new User(row["id"].ToString(), row["name"].ToString(), "", "", Convert.ToBoolean(row["emailVerified"].ToString()), "", row["imageURL"].ToString(), row["role"].ToString(), row["rank"].ToString());
                    lUser.Add(u1);
                }

                if (lUser.Count <= 4)
                {
                    return lUser;
                } else
                {
                    var newlUser = new List<User>();
                    for (var j = 0; j < 4; j++)
                    {
                        int rando = RandomNumber(1, lUser.Count);
                        newlUser.Add(lUser[rando]);
                        lUser.RemoveAt(rando);
                    }
                    return newlUser;
                }
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

        public User SelectUserById(string userId)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "Select * from [User] where id = @paraUserId";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraUserId", userId);
            DataSet ds = new DataSet();
            da.Fill(ds);
            User user = null;

            DataRow row = ds.Tables[0].Rows[0];
            string id = row["name"].ToString();
            string name = row["name"].ToString();
            string password = row["password"].ToString();
            string email = row["email"].ToString();
            bool emailVerified = Convert.ToBoolean(row["emailVerified"].ToString());
            string hash = row["hash"].ToString();
            string imageURL = row["imageURL"].ToString();
            string role = row["role"].ToString();
            string rank = row["rank"].ToString();
            string address = row["address"].ToString();
            string street = row["street"].ToString();
            string country = row["country"].ToString();
            string postalCode = row["postalCode"].ToString();
            string unitNo = row["unitNo"].ToString();
            user = new User(id, name, password, email, emailVerified, hash, imageURL, role, rank, address, street, country, postalCode, unitNo);

            return user;
        }

        public int updateBio(string bio, int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "UPDATE [User] SET bio = @paraBio WHERE Id = @paraID";

            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);


            sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@paraBio", bio);
            sqlCmd.Parameters.AddWithValue("@paraID", id);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();

            return result;
        }

        public string getBio(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select bio from [User] where Id = @paraID";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraID", id);
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

                string bio = row["bio"].ToString();
                return bio;
            }
        }

        public string getEmail(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select email from [User] where Id = @paraID";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraID", id);
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

                string email = row["email"].ToString();
                return email;
            }
        }

        public string getImage(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select imageURL from [User] where Id = @paraID";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraID", id);
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

                string bio = row["imageURL"].ToString();
                return bio;
            }
        }

        public string getSchool(int id)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select school from [User] where Id = @paraID";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            da.SelectCommand.Parameters.AddWithValue("@paraID", id);
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

                string bio = row["school"].ToString();
                return bio;
            }
        }
    }
}
