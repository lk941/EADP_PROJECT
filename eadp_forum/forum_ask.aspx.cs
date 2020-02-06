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
    public partial class forum_ask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonFSubmit_Click(object sender, EventArgs e)
        {
            ForumPost forumPost = new ForumPost();

            if (Page.IsValid)
            {
                forumPost.user_id = "test";
                forumPost.post_title = TextBoxFTitle.Text;
                forumPost.post_description = TextBoxFBody.Text;
                forumPost.post_image = "test";
                forumPost.post_tags = TextBoxFTags.Text;
                forumPost.post_subject = DDLSubject.SelectedValue;
                forumPost.post_views = 0;
                forumPost.post_votes = 0;

                forumPost.InsertForumPost(forumPost.user_id, forumPost.post_title, forumPost.post_description, forumPost.post_image, forumPost.post_tags, forumPost.post_subject, forumPost.post_views, forumPost.post_votes);

                Response.Redirect("forum_home.aspx");
            }
            else
            {

            }
        }
    }
}