using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADProj.BLL;
using EADProj.DLL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Data.Common;

namespace EADProj
{
    public partial class forum_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ForumPost thispost = new ForumPost();
            // thispost.GetPostByID(Session["PostIDNo"].ToString()).post_description;

            LabelPostHeader.Text = Session["PostTitle"].ToString();
            // LabelPostDesc.Text = Session["PostDesc"].ToString();
            LabelPostDesc.Text = thispost.GetPostByID(Session["PostIDNo"].ToString()).post_description.ToString();
            Session["PostDesc"] = LabelPostDesc.Text.ToString();
            LabelPostUserID.Text = Session["PostUserID"].ToString();
            LabelViews.Text = Session["PostViews"].ToString();

            RepeaterData();
            if(RepeaterAnswer.Items.Count < 1)
            {
                LabelNoAnswer.Visible = true;
            }

            if (Session["id"] != null)
            {
                UserDAO u1 = new UserDAO();
                ImageUser.ImageUrl = u1.getImage(Convert.ToInt16(Session["id"]));
            }
            else
            {
                ImageUser.ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQE_0p3sdt4wuD5X2ZnKrT5pOCmDJ1N73Y5lfSJNU1f_W-hpQ41";
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
                fcomment.img = ImageUser.ImageUrl.ToString();

                fcomment.InsertFComment(fcomment.user_id.ToString(), fcomment.comment, Convert.ToInt16(fcomment.votes), fcomment.post_id, fcomment.img);

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
            string sqlStmt = "Select top 3 * from Fcomment where post_id = "+ Session["PostIDNo"].ToString() + " order by votes desc";
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

        protected void LinkButtonAskLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("forum_ask.aspx");
        }

        protected void ButtonUpvoteComment_Click(object sender, EventArgs e)
        {
            int updViews;
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            FComment fcomment = new FComment();
            
            updViews = fcomment.UpdVotes(Convert.ToInt16((item.FindControl("LabelCommentID") as Label).Text.ToString()), Convert.ToInt16((item.FindControl("LabelCommentVotes") as Label).Text.ToString() + 1));

            Response.Redirect("forum_post.aspx");
        }

        protected void LinkButtonDelete_Click1(object sender, EventArgs e)
        {
            int delPost;

            ForumPost post = new ForumPost();
            delPost = post.DelPost(Convert.ToInt16(Session["PostIDNo"].ToString()));
            Response.Redirect("forum_home.aspx");
        }

        //[WebMethod]

    }
}