using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADProj.BLL;

namespace EADProj
{
    public partial class map : System.Web.UI.Page
    {
        protected User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            var userQS = "";
            try
            {
                userQS = Request.QueryString["teacherID"].ToString();
                //System.Diagnostics.Debug.WriteLine(userQS);
            }
            catch
            {
                userQS = null;
            }

            if (userQS != null)
            {
                User u1 = new User();
                user = u1.GetTeacherLocationById(userQS);
            }

        }
    }
}