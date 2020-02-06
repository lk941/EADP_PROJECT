using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eadp_forum.BLL;
using eadp_forum.DLL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Data.Common;

namespace eadp_forum
{
    public partial class forum_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelPostHeader.Text = Session["PostTitle"].ToString();
            LabelPostDesc.Text = Session["PostDesc"].ToString();
            LabelPostUserID.Text = Session["PostUserID"].ToString();
            LabelViews.Text = Session["PostViews"].ToString();

            RepeaterData();
            if(RepeaterAnswer.Items.Count < 1)
            {
                LabelNoAnswer.Visible = true;
            }
           

        }

        protected void LinkButtonEdit_Click(object sender, EventArgs e)
        {
            Session["PostID"] = Session["PostIDNo"].ToString();
            Session["EditTitle"] = Session["PostTitle"].ToString();
            Session["EditDesc"] = Session["PostDesc"].ToString();
            Session["EditSubj"] = Session["PostSubj"].ToString();
            Session["EditTags"] = Session["PostTags"].ToString();
            Response.Redirect("forum_edit_post.aspx");
        }

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {

            int delPost;
            ClientScriptManager CSM = Page.ClientScript;
            string strconfirm = "<script>if(!window.confirm('Are you sure?')){window.location.href='forum_home.aspx'}</script>";
            CSM.RegisterClientScriptBlock(this.GetType(), "Confirm", strconfirm, false);

            ForumPost post = new ForumPost();
            delPost = post.DelPost(Convert.ToInt16(Session["PostIDNo"]));
            Response.Redirect("forum_home.aspx");
        }

        protected void ButtonSubmitComment_Click(object sender, EventArgs e)
        {
            FComment fcomment = new FComment();

            if (Page.IsValid)
            {
                fcomment.user_id = "test";
                fcomment.comment = TextBoxComment.Text.ToString();
                fcomment.votes = 0;
                fcomment.post_id = Convert.ToInt16(Session["PostIDNo"]);

                fcomment.InsertFComment(fcomment.user_id.ToString(), fcomment.comment, Convert.ToInt16(fcomment.votes), fcomment.post_id);

                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {

            } 
        }


        public void RepeaterData()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select top 3 * from Fcomment order by votes desc";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            // da.SelectCommand.Parameters.AddWithValue("@paraPostID", post_id);
            DataSet ds = new DataSet();
            da.Fill(ds);

            RepeaterAnswer.DataSource = ds;
            RepeaterAnswer.DataBind();


        }

        protected void LinkButtonDeleteComment_Click(object sender, EventArgs e)
        {

            /* RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;

            int delComment;

            FComment post = new FComment();
            delComment = post.DelComment(int.Parse((item.FindControl("LabelCommentID") as Label).Text));
            RepeaterAnswer.DataBind(); */

            int commentId = int.Parse(((sender as LinkButton).NamingContainer.FindControl("LabelCommentID") as Label).Text);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Fcomment WHERE fcomment_id = @paraFComment_id", con))
                {
                    cmd.Parameters.AddWithValue("@paraFComment_id", commentId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.RepeaterData();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            
        }

        protected void RepeaterAnswer_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label LabelCommentID = (Label)e.Item.FindControl("LabelCommentID");
        }

        //[WebMethod]

    }
}