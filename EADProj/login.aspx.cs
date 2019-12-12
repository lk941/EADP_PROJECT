using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADProj.BLL;
using EADProj.DLL;
using EADProj.Email;
using StrongGrid;


namespace EADProj
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["registered"] == "False")
            {
                errLabel.Text = "Email Sent. Please verify email before logging in.";
            }
            else if (Request.QueryString["registered"] == "False")
            {
                errLabel.Text = "Email Verified. Please log in to your account.";
            }

            Panel panel1 = (Panel)Master.FindControl("menuPanel");
            panel1.Visible = false;

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            errLabel.Text = "";
            if (Page.IsValid)
            {
                User user = new User();
                if (user.loginUserCheck(emailTB.Text, passwordTB.Text))
                {
                    errLabel.Visible = false;
                    User u1 = user.GetUserByEmail(emailTB.Text);
                    Session["id"] = u1.id;
                    Session["name"] = u1.name;
                    Response.Redirect("main.aspx");

                }
                else
                {
                    errLabel.Visible = true;
                    errLabel.Text = "Error logging in.";
                }
            }
        }
        

        protected void GoogleBtn_Click(object sender, EventArgs e)
        {

        }
    }
}