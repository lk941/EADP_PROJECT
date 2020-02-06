using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Sdk.Sfc;
using Microsoft.SqlServer.Management.Common;

namespace eadp_forum
{
    public partial class forum_search_results : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeaterData();
            }

            LabelQuery.Text = Session["search_query"].ToString();
            LabelNoOfResults.Text = "Number of search results: " + Convert.ToString(RepeaterSearchResults.Items.Count);
        }

        public void RepeaterData()
        {
            var search_query = Session["search_query"];

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from forum_post where post_title like '%"+ search_query + "%'";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            // da.SelectCommand.Parameters.AddWithValue("@paraPostID", post_id);
            DataSet ds = new DataSet();
            da.Fill(ds);

            RepeaterSearchResults.DataSource = ds;
            RepeaterSearchResults.DataBind();


        }

        protected void RepeaterTop_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            Label LPostID = (Label)e.Item.FindControl("LabelPostID");
            LinkButton LTitle = (LinkButton)e.Item.FindControl("ButtonPostTitle");
            Label LUserID = (Label)e.Item.FindControl("LabelUser");
            Label LDesc = (Label)e.Item.FindControl("LabelDesc");
            Label LTags = (Label)e.Item.FindControl("LabelPostTags");
            Label LSubj = (Label)e.Item.FindControl("LabelSubj");
            Label LViews = (Label)e.Item.FindControl("LabelViews");
            Label LVotes = (Label)e.Item.FindControl("LabelVotes");

            Session["PostTitle"] = LTitle.Text.ToString();
            Session["PostIDNo"] = LPostID.Text.ToString();
            Session["PostUserID"] = LUserID.Text.ToString();
            Session["PostDesc"] = LDesc.Text.ToString();
            Session["PostTags"] = LTags.Text.ToString();
            Session["PostSubj"] = LSubj.Text.ToString();
            Session["PostViews"] = (Convert.ToInt16(LViews.Text) + 1).ToString();
            Session["PostVotes"] = LVotes.Text.ToString();

            Response.Redirect("forum_post.aspx");
        }
    }
}