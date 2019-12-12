using System;
using System.Collections.Generic;
using EADProj.BLL;
using EADProj.DLL;
using StrongGrid.Models;

namespace EADProj
{
    public partial class productGrid : System.Web.UI.Page
    {
        protected IList<Lesson> lesson;

        protected void Page_Load(object sender, EventArgs e)
        {
            lesson = new List<Lesson>();
            Lesson l1 = new Lesson();
            l1 = l1.GetLessonById("1");
            lesson.Add(new Lesson()
            {
                title = l1.title,
                price = l1.price,
                rating = l1.rating,
                difficulty = l1.difficulty,
                duration = l1.duration
            });
        
        }
    }
}