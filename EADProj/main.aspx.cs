using System;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web;
using EADProj.BLL;
using EADProj.DLL;
using System.Collections.Generic;

namespace EADProj
{
    public partial class main : System.Web.UI.Page
    {
        protected IList<Lesson> lesson;


        protected void Page_Load(object sender, EventArgs e)
        {
            List<int> lessonId = new List<int>();
            lesson = new List<Lesson>();
            Lesson l1 = new Lesson();

            for (var j = 0; j < 4; j++)
            {
                //System.Diagnostics.Debug.WriteLine("Starting While Loop");
                while (true)
                {
                    int rando = RandomNumber(1, l1.GetLengthOfDB());
                    l1 = l1.GetLessonById(rando.ToString());

                    //System.Diagnostics.Debug.WriteLine("Random Number " + rando);

                    if (lessonId.Contains(rando) == false)
                    {
                        //System.Diagnostics.Debug.WriteLine("Lesson contain" + lesson.Contains(l1));
                        var lesson_rating = (double.Parse(l1.rating_1) * 1 + double.Parse(l1.rating_2) * 2 + double.Parse(l1.rating_3) * 3 + double.Parse(l1.rating_4) * 4 + double.Parse(l1.rating_5) * 5) / (double.Parse(l1.rating_1) + double.Parse(l1.rating_2) + double.Parse(l1.rating_3) + double.Parse(l1.rating_4) + double.Parse(l1.rating_5));

                        lesson.Add(new Lesson()
                        {
                            title = l1.title,
                            price = l1.price,
                            image_url = l1.image_url,
                            difficulty = l1.difficulty,
                            duration = l1.duration,
                            rating_1 = lesson_rating.ToString(),
                        });
                        lessonId.Add(rando);

                        break;
                    }
                }

            }
        }

        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
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