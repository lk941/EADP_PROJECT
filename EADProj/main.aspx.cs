using System;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web;

namespace EADProj
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        [ScriptMethod]
        public static string queryFind(string search)
        {
            //System.Diagnostics.Debug.WriteLine(search);
            if (search.Length > 0)
            {
                //HttpContext.Current.Session["search"] = search;
                return "not empty";
           
            } else if (search.Length == 0)
            {
                return "empty";
            
            } else
            {
                return "error";
            }

        }
    }
}