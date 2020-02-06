using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using System.Text.Encodings.Web;
using eadp_forum.BLL;
using eadp_forum.DLL;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace eadp_forum.Controllers
{
    public class ForumSearchController : ApiController
    {

        public DataSet DBPostsBySearch(string search_query)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "Select * from forum_post where post_title like '%search_query%'";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);
            // da.SelectCommand.Parameters.AddWithValue("@paraPostID", post_id);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        public IEnumerable<ForumPost> GetPostsBySearch(string search_query)
        {
            return DBPostsBySearch(search_query).Tables[0].AsEnumerable().Select(dataRow => new ForumPost
            {
                user_id = dataRow.Field<string>("user_id")

            }).ToList();
        }



    }


}
