﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using eadp_forum.DLL;
using eadp_forum.BLL;
using System.Security.Policy;
using System.Web.UI.HtmlControls;

namespace eadp_forum
{
    public partial class forum_home : System.Web.UI.Page
    {

        protected IList<String> topTags;

        protected void Page_Load(object sender, EventArgs e)
        {
            
           
            
            if (!IsPostBack)
            {
                RepeaterData();
                string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                SqlConnection myConn = new SqlConnection(DBConnect);
                string sqlStmt = "Select * from forum_post";
                SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
                // da.SelectCommand.Parameters.AddWithValue("@paraPostID", post_id);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string[] taglist = dt.Rows[i]["post_tags"].ToString().Split(',');
                        foreach (var word in taglist)
                        {
                            if (taglist.Contains(word))
                            {
                                continue;
                            }
                            else
                            {
                                topTags.Add(word);
                                HtmlGenericControl p = new HtmlGenericControl("p");
                                p.InnerText = word.ToString().ToUpper();
                                forum_tags.Controls.Add(p);
                            }
                        }
                    }
                }
                generate_tags();
                foreach (var word in topTags)
                {
                    HtmlGenericControl p = new HtmlGenericControl("p");
                    p.InnerText = word.ToString().ToUpper();
                    forum_tags.Controls.Add(p);
                }

                /* foreach(var word in topTags)
                {
                    forum_tags.InnerHtml += "<p>" + word.ToUpper() + " </p>";
                } */
            }

        }

        public ForumPost TopPosts()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select top (3) with ties post_views, count from forum_post order by count desc";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            // da.SelectCommand.Parameters.AddWithValue("@paraPostID", post_id);
            DataSet ds = new DataSet();
            da.Fill(ds);

            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 0)
            {
                return null;
            }
            else
            {
                return null;
            }
        }

        protected void GridViewTopPosts_SelectedIndexChanged(object sender, EventArgs e)
        {

            /* int updViews;
            GridViewRow row = GridViewTopPosts.SelectedRow;

            Session["PostIDNo"] = row.Cells[0].Text;
            Session["PostUserID"] = row.Cells[1].Text;
            Session["PostTitle"] = row.Cells[2].Text;
            Session["PostDesc"] = row.Cells[3].Text;
            Session["PostTags"] = row.Cells[5].Text;
            Session["PostSubj"] = row.Cells[6].Text;
            Session["PostViews"] = (Convert.ToInt16(row.Cells[7].Text)+1).ToString();
            Session["PostVotes"] = row.Cells[8].Text;

            ForumPost fpost = new ForumPost();
            updViews = fpost.UpdPostViews(Convert.ToInt16(row.Cells[0].Text), Convert.ToInt16(Session["PostViews"]));

            Response.Redirect("forum_post.aspx"); */


        }

        public void RepeaterData()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select top 3 * from forum_post order by post_views desc";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            // da.SelectCommand.Parameters.AddWithValue("@paraPostID", post_id);
            DataSet ds = new DataSet();
            da.Fill(ds);

            RepeaterTopPosts.DataSource = ds;
            RepeaterTopPosts.DataBind();


        }

        public void ButtonPostTitle_Click(object sender, EventArgs e)
        {
            int updViews;

            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;

            Session["PostIDNo"] = (item.FindControl("LabelPostID") as Label).Text.ToString();
            Session["PostUserID"] = (item.FindControl("LabelUser") as Label).Text.ToString();
            Session["PostTitle"] = (item.FindControl("ButtonPostTitle") as Button).Text.ToString();
            
            Session["PostTags"] = (item.FindControl("LabelPostTags") as Label).Text.ToString();
            Session["PostSubj"] = (item.FindControl("LabelSubj") as Label).Text.ToString();
            Session["PostViews"] = (Convert.ToInt16((item.FindControl("LabelViews") as Label).Text) + 1).ToString();
            Session["PostVotes"] = (item.FindControl("LabelVotes") as Label).Text.ToString();

            ForumPost fpost = new ForumPost();
            fpost.GetPostByID((item.FindControl("LabelPostID") as Label).Text.ToString());
            Session["PostDesc"] = fpost.post_description;
            updViews = fpost.UpdPostViews(Convert.ToInt16((item.FindControl("LabelPostID") as Label).Text), Convert.ToInt16((item.FindControl("LabelViews") as Label).Text) + 1);

            Server.Transfer("forum_post.aspx");
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

            ForumPost fpost = new ForumPost();
            fpost.GetPostByID(LPostID.Text.ToString());
            Session["PostDesc"] = fpost.post_description;

            Session["PostTags"] = LTags.Text.ToString();
            Session["PostSubj"] = LSubj.Text.ToString();
            Session["PostViews"] = (Convert.ToInt16(LViews.Text) + 1).ToString();
            Session["PostVotes"] = LVotes.Text.ToString(); 

            Response.Redirect("forum_post.aspx"); 
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            var search = TextBoxSearch.Text.ToString();

            Session["search_query"] = search;
            Response.Redirect("forum_search_results.aspx");

        }

        public void generate_tags()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string st = "SELECT post_tags FROM forum_post";
            var cmd = new SqlCommand(st, myConn);
            cmd.Connection.Open();
            SqlDataReader sqlread = cmd.ExecuteReader();
            
            while (sqlread.Read())
            {
                string[] word = sqlread["post_tags"].ToString().Split(',');
                for (int count = 0; count <= word.Length; count++)
                {
                    if (topTags.Contains(word[count].ToString())) {
                        continue;
                    }
                    else
                    {
                        topTags.Add(word[count].ToString());
                    }
                }
            }
            cmd.Connection.Close();

        }


    }

}