using System;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using EADProj.DLL;

namespace EADProj
{
    public partial class menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                
                string currentName = Session["name"].ToString();


                loginBtn.Visible = false;
                registerBtn.Visible = false;
                ProfileIcon.Visible = true;
                Logout.Visible = true;
                currentUser.Text = "Welcome " + currentName;
            }
            else
            {
                loginBtn.Visible = true;
                registerBtn.Visible = true;
                ProfileIcon.Visible = false;
                Logout.Visible = false;
            }
        }
        
        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("main.aspx");
        }

        protected void shopAllBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("productGrid.aspx");
        }

        protected void redirectLogin(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void redirectRegister(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void ProfileIcon_Click(object sender, EventArgs e)
        {
            Response.Redirect("session_user.aspx");
        }
    }
}