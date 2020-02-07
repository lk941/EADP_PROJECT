using System;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using EADProj.Search;
using EADProj.BLL;
using System.Collections.Generic;

namespace EADProj
{
    public partial class courseRecc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        [ScriptMethod]
        public static List<string> reccQuery(string topic, string familiar)
        {
            List<string> lessonlistid = new List<string>();
            Search.Search s = new Search.Search();
            var l1 = new Lesson();
            var lList = l1.RetrieveAllLessons();
            var reccList = s.reccQuery(lList, topic, familiar);

            for (var i = 0; i < reccList.Count; i++)
            {
                lessonlistid.Add(reccList[i].id);
                System.Diagnostics.Debug.WriteLine("id = " + reccList[i].id);

            }

            return lessonlistid;

        }
    }
}