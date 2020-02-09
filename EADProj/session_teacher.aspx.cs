using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADProj.BLL;
using EADProj.DLL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace EADProj
{
    public partial class session_teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserDAO u1 = new UserDAO();
            LabelUsername.Text = Session["name"].ToString();
            LabelEmail.Text = u1.getEmail(Convert.ToInt16(Session["id"]));
            Session["bio"] = u1.getBio(Convert.ToInt16(Session["id"]));
            Session["imageURL"] = u1.getImage(Convert.ToInt16(Session["id"]));
            LabelSchoolAttended.Text = u1.getSchool(Convert.ToInt16(Session["id"]));

            if (Session["bio"] != null)
            {
                LabelBio.Text = Session["bio"].ToString();
            }
            else
            {
                LabelBio.Text = "Hello, I am a new user! ";
            }

            if (Session["imageURL"] != null)
            {
                Image1.ImageUrl = Session["imageURL"].ToString();
            }
            else
            {
                Image1.ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQE_0p3sdt4wuD5X2ZnKrT5pOCmDJ1N73Y5lfSJNU1f_W-hpQ41";
            }
        }

        protected void LinkButtonBio_Click(object sender, EventArgs e)
        {
            PanelDisplayBio.Visible = false;
            PanelEditBio.Visible = true;

            // Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void LinkButtonCancelBio_Click(object sender, EventArgs e)
        {
            PanelDisplayBio.Visible = true;
            PanelEditBio.Visible = false;

            PanelEditSchool.Visible = false;
            PanelSchoolAttended.Visible = true;

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void LinkButtonWork_Click(object sender, EventArgs e)
        {
            PanelEditWork.Visible = true;
            PanelWorkedAt.Visible = false;
        }

        protected void LinkButtonSchool_Click(object sender, EventArgs e)
        {
            PanelEditSchool.Visible = true;
            PanelSchoolAttended.Visible = false;
        }

        /* protected void FileUploadComplete(object sender, EventArgs e)
        {
            try
            {
                string filename = System.IO.Path.GetFileName(AsyncFileUploadProfilePic.FileName);
                AsyncFileUploadProfilePic.SaveAs(Server.MapPath("images/") + filename);
                string Imagepath = "~/images/" + filename;

                string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                SqlConnection myConn = new SqlConnection(DBConnect);
                string sqlStmt = "UPDATE User SET imageURL = @paraImageURL where Id = @paraID";
                SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
                SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);
                sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

                da.SelectCommand.Parameters.AddWithValue("@paraImageURL", Imagepath);
                da.SelectCommand.Parameters.AddWithValue("@paraID", Convert.ToInt16(Session["id"]));

                DataSet ds = new DataSet();
                da.Fill(ds);
                // Opening the Connection for SQL Injection

                myConn.Open();
                sqlCmd.ExecuteNonQuery();
                myConn.Close();

                
            } catch (Exception ex)
            {

            }
        } */

        protected void LinkButtonSubmitBio_Click(object sender, EventArgs e)
        {
            string bio = TextBoxEditBio.Text.ToString();
            User user = new User();

            user.UpdBio(bio, Convert.ToInt16(Session["id"].ToString()));

            PanelDisplayBio.Visible = true;
            PanelEditBio.Visible = false;

            Response.Redirect("session_user.aspx");

        }

        protected void UploadFile(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Images/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

            //Display the Picture in Image control.
            Image1.ImageUrl = "~/Images/" + Path.GetFileName(FileUpload1.FileName);

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "UPDATE [User] SET imageURL = @paraImageURL WHERE Id = @paraID";

            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);


            sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@paraImageURL", "~/Images/" + Path.GetFileName(FileUpload1.FileName));
            sqlCmd.Parameters.AddWithValue("@paraID", Session["id"].ToString());

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "UPDATE [User] SET school = @paraSchool WHERE Id = @paraID";

            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);


            sqlCmd = new SqlCommand(sqlStmt.ToString(), myConn);

            sqlCmd.Parameters.AddWithValue("@paraSchool", TextBoxSchoolAttended.Text);
            sqlCmd.Parameters.AddWithValue("@paraID", Session["id"].ToString());

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();

            PanelEditSchool.Visible = false;
            PanelSchoolAttended.Visible = true;
        }
    }

}