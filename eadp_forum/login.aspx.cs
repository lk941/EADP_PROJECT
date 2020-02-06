using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using eadp_forum.BLL;
using eadp_forum.DLL;
using eadp_forum.Email;
using StrongGrid;
using Google.Apis.Auth;
using Google.Apis;
using Google.Apis.Gmail.v1;
using System.Threading;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Util.Store;
using System.Web.Script.Services;
using System.Web.Security;

namespace eadp_forum
{
    public partial class login : System.Web.UI.Page
    {
        public static string ApplicationName = "Likey";

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

        string ClientId = "YOUR_CLIENTID";
        string ClientSecret = "YOUR_CLIENTSECRET";

        Panel panel1 = (Panel)Master.FindControl("menuPanel");
        panel1.Visible = false;
    }

        [WebMethod]
        [ScriptMethod]
        public static string googleLogin(string name, string email, string imageURL)
        {
            try
            {
                User u1 = new User();
                u1.OAuthLogin(name, email, imageURL);

                User loggedInUser = new User();
                loggedInUser = loggedInUser.GetUserByEmail(email);
                HttpContext.Current.Session["id"] = loggedInUser.id;
                HttpContext.Current.Session["name"] = loggedInUser.name;
                //HttpContext.Current.Response.Redirect("main.aspx");

                return "Worked";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
                return ex.ToString();
            }

        }

        [WebMethod]
        [ScriptMethod]
        public static void logout()
        {
            try
            {
                HttpContext.Current.Session.Abandon();
                FormsAuthentication.SignOut();
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Buffer = true;
                HttpContext.Current.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                HttpContext.Current.Response.Expires = -1000;
                HttpContext.Current.Response.CacheControl = "no-cache";
                //Response.Redirect("login.aspx", true);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            errLabel.Text = "";
            if (Page.IsValid)
            {
                User user = new User();
                if (user.checkOauthUser(emailTB.Text) == false)
                {
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
                        errLabel.Text = "Email does not match password!";
                    }

                }
                else
                {
                    errLabel.Visible = true;
                    errLabel.Text = "Email already signed in using social media login!";
                }
            }
        }
    }
}