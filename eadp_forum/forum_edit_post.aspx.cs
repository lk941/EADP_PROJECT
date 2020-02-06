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
    public partial class forum_edit_post : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            TextBoxFTitle.Text = Session["EditTitle"].ToString();
            TextBoxFBody.Text = Session["EditDesc"].ToString();
            TextBoxFTags.Text = Session["EditTags"].ToString();

            DDLSubject.SelectedIndex = DDLSubject.Items.IndexOf(DDLSubject.Items.FindByValue(Session["EditSubj"].ToString()));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ButtonFSubmit_Click(object sender, EventArgs e)
        {
            if (TextBoxFTitle != null && TextBoxFBody != null && TextBoxFTags != null)
            {

                ForumPost forumPost = new ForumPost();

                forumPost.user_id = "test";
                forumPost.post_title = TextBoxFTitle.Text;
                forumPost.post_description = TextBoxFBody.Text;
                forumPost.post_image = "test";
                forumPost.post_tags = TextBoxFTags.Text;
                forumPost.post_subject = DDLSubject.SelectedValue;

                forumPost.UpdPostDetails(Convert.ToInt16(Session["PostID"]), forumPost.post_title, forumPost.post_description, forumPost.post_subject, forumPost.post_tags);

                // forumPost.InsertForumPost(forumPost.user_id, forumPost.post_title, forumPost.post_description, forumPost.post_image, forumPost.post_tags, forumPost.post_subject, forumPost.post_views, forumPost.post_votes);

                Response.Redirect("forum_home.aspx");
            }
        }
    }
}