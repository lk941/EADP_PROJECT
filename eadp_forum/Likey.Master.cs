using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadp_forum
{
    public partial class Likey : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["id"] = "test";

            if (Session["id"] != null)
            {
                loginBtn.Visible = false;
                registerBtn.Visible = false;
                ProfileIcon.Visible = true;
                Logout.Visible = true;
                PanelForYouMenu.Visible = true;
            }
            else
            {
                loginBtn.Visible = true;
                registerBtn.Visible = true;
                ProfileIcon.Visible = false;
                Logout.Visible = false;
                PanelForYouMenu.Visible = false;
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

        protected void linkButtonAsk(object sender, EventArgs e)
        {
            Response.Redirect("forum_ask.aspx");
        }

        protected void ProfileIcon_Click(object sender, EventArgs e)
        {
            Response.Redirect("session_user.aspx");
        }
    }
}