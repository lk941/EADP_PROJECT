using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using eadp_forum.DLL;

namespace eadp_forum.BLL
{
    public class ForumPost
    {
        // public string post_id { get; set; }
        public string user_id { get; set; }
        public string post_title { get; set; }
        public string post_description { get; set; }
        public string post_image { get; set; }
        public string post_tags { get; set; }
        public string post_subject { get; set; }
        public int post_views { get; set; }
        public int post_votes { get; set; }

        public ForumPost()
        {

        }

        public ForumPost( string User_id, string Post_title, string Post_description, string Post_image, string Post_tags, string Post_subject, int Post_views, int Post_votes)
        {
            //this.post_id = Post_id;
            this.user_id = User_id;
            this.post_title = Post_title;
            this.post_description = Post_description;
            this.post_image = Post_image;
            this.post_tags = Post_tags;
            this.post_subject = Post_subject;
            this.post_views = Post_views;
            this.post_votes = Post_votes;
        }

        public bool InsertForumPost(string user_id, string post_title, string post_description, string post_image, string post_tags, string post_subject, int post_views, int post_votes)
        {
            ForumPost post1 = new ForumPost(user_id, post_title, post_description, post_image, post_tags, post_subject, post_views, post_votes);
            ForumPostDAO dao = new ForumPostDAO();

            dao.Insert(post1);
            return true;

        }

        public ForumPost GetPostByID(string post_id)
        {
            ForumPostDAO dao = new ForumPostDAO();
            return dao.GetPostByID(post_id);
        }

        public int UpdPostDetails(int post_id, string post_title, string post_desc, string post_subject, string post_tags)
        {
            ForumPostDAO dao = new ForumPostDAO();
            return dao.UpdatePostDetails(post_id, post_title, post_desc, post_subject, post_tags);
        }

        public int UpdPostViews(int post_id, int post_views)
        {
            ForumPostDAO dao = new ForumPostDAO();
            return dao.UpdatePostViews(post_id, post_views);
        }

        public int DelPost(int post_id)
        {
            ForumPostDAO dao = new ForumPostDAO();
            return dao.DeletePost(post_id);
        }
    }
}