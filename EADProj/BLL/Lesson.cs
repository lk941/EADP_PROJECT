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
        public string image_url { get; set; }
        public string difficulty { get; set; }
        public string duration { get; set; }
        public string overview { get; set; }
        public string category { get; set; }
        public string topic { get; set; }
        public string rating_1 { get; set; }
        public string rating_2 { get; set; }
        public string rating_3 { get; set; }
        public string rating_4 { get; set; }
        public string rating_5 { get; set; }

        public Lesson()
        {

        }

        public Lesson(string id, string title, string price, string image_url, string difficulty, string duration, string overview, string category, string topic, string rating_1, string rating_2, string rating_3, string rating_4, string rating_5)
        {
            this.id = id;
            this.title = title;
            this.price = price;
            this.image_url = image_url;
            this.difficulty = difficulty;
            this.duration = duration;
            this.overview = overview;
            this.category = category;
            this.topic = topic;
            this.rating_1 = rating_1;
            this.rating_2 = rating_2;
            this.rating_3 = rating_3;
            this.rating_4 = rating_4;
            this.rating_5 = rating_5;
        }


        public Lesson(string id, string title, string price, string image_url, string difficulty, string duration)
        {
            this.id = id;
            this.title = title;
            this.price = price;
            this.image_url = image_url;
            this.difficulty = difficulty;
            this.duration = duration;
        }

        public Lesson(string title, string price, string image_url, string difficulty, string duration)
        {
            this.title = title;
            this.price = price;
            this.image_url = image_url;
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