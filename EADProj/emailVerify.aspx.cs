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
    public partial class emailVerify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    User u1 = new User();
                    string hash = Request.QueryString["hash"];
                    System.Diagnostics.Debug.WriteLine("Hash = " + hash);

                    u1 = u1.GetUserByHash(hash);

                    System.Diagnostics.Debug.WriteLine("u1.hash = " + u1.hash);

                    if (u1.hash == hash)
                    {
                        System.Diagnostics.Debug.WriteLine("User Verified");
                        u1.VerifyUser(u1.email);
                        responseLbl.Text = "Successfully Verified. Close this page to continue";
                        /*
                        if (!IsPostBack)
                        {
                            string url = "localhost:5000/login.aspx?registered=True";
                            Response.Redirect(url);
                        }
                        */
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("Wrong Link");

                        responseLbl.Text = "Error Verifying User. User will be redirected in 5 seconds.";
                        System.Threading.Thread.Sleep(5000);
                        Response.Redirect("localhost:5000/login.aspx");
                    }
                }
            }
            catch
            {
                Response.Redirect("main.aspx");
            }
            
        }
    }
}