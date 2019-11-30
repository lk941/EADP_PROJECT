using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADProj
{
    public partial class menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                loginBtn.Visible = false;
                registerBtn.Visible = false;
                ProfileIcon.Visible = true;
            }
            else
            {
                loginBtn.Visible = true;
                registerBtn.Visible = true;
                ProfileIcon.Visible = false;
            }
        }
        
        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("main.aspx");
        }

        protected void shopAllBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("productPage.aspx");
        }

        protected void redirectLogin(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void redirectRegister(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}