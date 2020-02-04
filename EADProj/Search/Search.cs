using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADProj.DLL;
using EADProj.BLL;
using System.Text.RegularExpressions;

namespace EADProj.Search
{
    public class Search
    {
        public Search()
        {

        }

        public IList<Lesson> searchQuery(IList<Lesson> lessons, string query)
        {
            if (query == null)
            {
                System.Diagnostics.Debug.WriteLine("=========QUERY IS NULL========");

                return new List<Lesson>();
            }
            var sLessons = retLessonContain(lessons, query);
            sLessons = rankLessons(sLessons, query);
            System.Diagnostics.Debug.WriteLine("=========QUERY SEARCHING========");


            return sLessons;

        }
        

            // Filter out the lessons that are irrelevent by checking if the lesson title contains the query
        private IList<Lesson> retLessonContain(IList<Lesson> lessons, string query)
        {
            List<Lesson> containsWordLessons = new List<Lesson>();
            List<String> querySplit = query.Split(' ').ToList();

            System.Diagnostics.Debug.WriteLine("=========STARTING THIS ONE========");


            for (var i = 0; i < lessons.Count; i++)
            {
                // Check if any of the query words are in the lesson title
                var lesson_title = lessons[i].title;
                var lesson_overview = lessons[i].overview;

                System.Diagnostics.Debug.WriteLine("=========" + "WE AT INDEX " + i + "========");



                for (var j = 0; j < querySplit.Count(); j++)
                {
                    if(lesson_title.Contains(querySplit[j]))
                    {
                        containsWordLessons.Add(lessons[i]);
                        System.Diagnostics.Debug.WriteLine("=========ADDING INDEX " + i + "========");
                        break;
                    } else if(lesson_overview.Contains(querySplit[j]))
                    {
                        containsWordLessons.Add(lessons[i]);
                        System.Diagnostics.Debug.WriteLine("=========ADDING INDEX " + i + "========");
                        break;
                    }
                }

            }

            return containsWordLessons;
        }

        // Rank the lessons based on how similar it is to the search query
        private IList<Lesson> rankLessons(IList<Lesson> lessons, string query)
        {
            List<Lesson> lessonList = new List<Lesson>();
            List<Double> pointList = new List<Double>();

            List<String> querySplit = query.Split(' ').ToList();


            for (var i =0; i< lessons.Count; i++)
            {

                System.Diagnostics.Debug.WriteLine("WE AT INDEX " + i);

                var lesson_title = lessons[i].title;
                var lesson_overview = lessons[i].overview;
                var lesson_rating = Double.Parse(lessons[i].rating);
                System.Diagnostics.Debug.WriteLine("=========TITLE: " + lesson_title + "========");


                Double points = 0;
                for (var j = 0; j < querySplit.Count(); j++)
                {
                    if (lesson_title.Contains(querySplit[j]))
                    {
                        points += 1.5;
                    }


                    var match = Regex.Matches(lesson_overview, querySplit[j]).Count;

                    if (match > 6)
                    {
                        points += 2.5;
                    } else if (match > 3)
                    {
                        points += 1.75;
                    } else if (match >= 1)
                    {
                        points += 0.5;
                    }

                    if (lesson_rating == 5)
                    {
                        points += 4;
                    } else if (lesson_rating > 3)
                    {
                        points += 2;
                    } else if (lesson_rating > 0)
                    {
                        points += 0.25;
                    }
                }

                if(pointList.Count > 0) 
                {
                    for(var c = 0; c < lessons.Count; c++)
                    {
                        try
                        {
                            System.Diagnostics.Debug.WriteLine("CURRENT POINTS " + points + " CHECKING WITH " + pointList[c]);

                            if (points > pointList[c])
                            {
                                System.Diagnostics.Debug.WriteLine("ADDING TO THE LIST");

                                pointList.Insert(c, points);
                                lessonList.Insert(c, lessons[i]);
                                break;

                            } else if (points == pointList[c])
                            {
                                continue;
                            } else
                            {
                                continue;
                            }
                        } catch
                        {
                            pointList.Add(points);
                            lessonList.Add(lessons[i]);
                            break;
                        
                        }

                            
                    }
                } else
                {
                    System.Diagnostics.Debug.WriteLine("POINTLIST IS EMPTY");

                    pointList.Add(points);
                    lessonList.Add(lessons[i]);
                }


            }

            return lessonList;
        }





    }
}