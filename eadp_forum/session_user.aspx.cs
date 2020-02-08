using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eadp_forum.BLL;
using eadp_forum.DLL;

namespace eadp_forum
{
    public partial class session_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* User sessionUser = new User();

            sessionUser.name = "test";
            sessionUser.password = "testing";
            sessionUser.email = "testing@gmail.com";

            sessionUser.InsertUser(sessionUser.name, sessionUser.password, sessionUser.email);

            //Response.Redirect("session_user.aspx"); */
            Session["id"] = "test";
            LabelUsername.Text = Session["id"].ToString();
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

        }

        protected void LinkButtonSchool_Click(object sender, EventArgs e)
        {
            PanelEditSchool.Visible = true;
            PanelSchoolAttended.Visible = false;
        }
    }
}