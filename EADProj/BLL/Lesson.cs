using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADProj.DLL;
using Microsoft.ML;

namespace EADProj.BLL
{
    public class Lesson
    {
        public string id { get; set; }
        public string title { get; set; }
        public string price { get; set; }
        public string rating { get; set; }
        public string difficulty { get; set; }
        public string duration { get; set; }
        public string overview { get; set; }

        public Lesson()
        {

        }

        public Lesson(string id, string title, string price, string rating, string difficulty, string duration)
        {
            this.id = id;
            this.title = title;
            this.price = price;
            this.rating = rating;
            this.difficulty = difficulty;
            this.duration = duration;
        }

        public Lesson(string title, string price, string rating, string difficulty, string duration)
        {
            this.title = title;
            this.price = price;
            this.rating = rating;
            this.difficulty = difficulty;
            this.duration = duration;
        }

        public Lesson GetLessonById(string id)
        {
            LessonDAO dao = new LessonDAO();
            return dao.GetLessonById(id);
        }

        public int GetLengthOfDB()
        {
            LessonDAO dao = new LessonDAO();
            return dao.GetLengthOfDB();
        }

        public List<Lesson> RetrieveAllLessons()
        {
            LessonDAO dao = new LessonDAO();
            return dao.RetrieveAllLessons();
        }
    }
}