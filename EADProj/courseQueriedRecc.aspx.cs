using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADProj.BLL;

namespace EADProj
{
    public partial class courseQueriedRecc : System.Web.UI.Page
    {
        protected IList<Lesson> lesson;

        protected void Page_Load(object sender, EventArgs e)
        {
            var courseReccQS = "";

            try
            {
                courseReccQS = Request.QueryString["courseRecc"].ToString();
            } catch
            {
                courseReccQS = "";
            }

            if (Request.QueryString["courseRecc"] != null)
            {
                List<String> cQS = courseReccQS.Split(',').ToList();
                System.Diagnostics.Debug.WriteLine(cQS.Count());
                lesson = new List<Lesson>();


                for (var i = 0; i < cQS.Count(); i++)
                {
                    System.Diagnostics.Debug.WriteLine(cQS[i]);
                    var l1 = new Lesson();
                    l1 = l1.GetLessonById(cQS[i]);
                    lesson.Add(l1);
                }
            }
        }
    }
}