using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADProj.BLL;
using EADProj.DLL;

namespace EADProj
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel panel1 = (Panel)Master.FindControl("menuPanel");
            panel1.Visible = false;
        }

        protected void cfmPasswordValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (passwordTB.Text == cfmPasswordTB.Text)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            errLabel.Text = "";
            if (Page.IsValid)
            {
                User user = new User();
                if (user.InsertUser(nameTB.Text, emailTB.Text, passwordTB.Text))
                {
                    user.InsertUser(nameTB.Text, emailTB.Text, passwordTB.Text);
                    errLabel.Visible = false;
                    string url = "login.aspx?registered=False";
                    Response.Redirect(url);
                }
                else
                {
                    errLabel.Visible = true;
                    errLabel.Text = "User already exist";
                }
            }
            else
            {
                errLabel.Visible = false;
            }
        }
    }
}