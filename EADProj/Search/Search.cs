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

        public IList<Lesson> reccQuery(IList<Lesson> lessons, string topic, string difficulty)
        {
            List<Lesson> ILessonList = new List<Lesson>();
            System.Diagnostics.Debug.WriteLine(lessons.Count());

            for (var i = 0; i < lessons.Count(); i++)
            {
                System.Diagnostics.Debug.WriteLine("Lesson Topic " + lessons[i].topic.ToLower());
                System.Diagnostics.Debug.WriteLine("Topic " + topic.ToLower());

                if (lessons[i].topic.ToLower() == topic.ToLower())
                {
                    System.Diagnostics.Debug.WriteLine("Matched for topic lesson topic is: " + lessons[i].topic.ToLower());
                    if (ILessonList.Contains(lessons[i]) != true)
                    {
                        ILessonList.Add(lessons[i]);
                    }
                }
            }

            for (var i = 0; i < ILessonList.Count(); i++)
            {

                if (ILessonList[i].difficulty.ToLower() != difficulty.ToLower())
                {
                    ILessonList.RemoveAt(i);
                }
            }

            var lCount = ILessonList.Count();
            System.Diagnostics.Debug.WriteLine(lCount);

            if (lCount <= 8)
            {
                return ILessonList;
            } else
            {
                for (var i = 0; i < ILessonList.Count(); i++)
                {
                    Double meanRating = (double.Parse(ILessonList[i].rating_1) * 1 + double.Parse(ILessonList[i].rating_2) * 2 + double.Parse(ILessonList[i].rating_3) * 3 + double.Parse(ILessonList[i].rating_4) * 4 + double.Parse(ILessonList[i].rating_5) * 5) / (double.Parse(ILessonList[i].rating_1) + double.Parse(ILessonList[i].rating_2) + double.Parse(ILessonList[i].rating_3) + double.Parse(ILessonList[i].rating_4) + double.Parse(ILessonList[i].rating_5));
                    if (meanRating < 4)
                    {
                        ILessonList.RemoveAt(i);
                    }
                }

                if (ILessonList.Count() <= 8)
                {
                    return ILessonList;
                } else
                {
                    var l1 = new Lesson();
                    List<int> lessonId = new List<int>();
                    var lesson = new List<Lesson>();

                    for (var j = 0; j < 8; j++)
                    {
                        //System.Diagnostics.Debug.WriteLine("Starting While Loop");
                        int rando = RandomNumber(1, ILessonList.Count());
                        lesson.Add(ILessonList[rando]);
                        ILessonList.RemoveAt(rando);

                    }

                    return lesson;
                }

            }
        }

        public IList<Lesson> filterQuery(IList<Lesson> lessons, List<String> filter, List<String> lvlFilter, List<String> priceFilter, List<String> ratingFilter)
        {
            List<Lesson> ILessonList = new List<Lesson>();


            for (var i = 0; i < lessons.Count(); i++)
            {
                for (var j = 0; j < filter.Count(); j++)
                {
                    if (lessons[i].topic.ToLower() == filter[j].ToLower())
                    {
                        System.Diagnostics.Debug.WriteLine("Matched for topic lesson topic is: " + lessons[i].topic.ToLower());
                        if (ILessonList.Contains(lessons[i]) != true)
                        {
                            ILessonList.Add(lessons[i]);
                            break;
                        }
                    }
                }

                for (var j = 0; j < lvlFilter.Count(); j++)
                {
                    if (lessons[i].difficulty.ToLower() == lvlFilter[j].ToLower())
                    {
                        System.Diagnostics.Debug.WriteLine("Matched for lesson level is: " + lessons[i].difficulty.ToLower());
                        if (ILessonList.Contains(lessons[i]) != true)
                        {
                            ILessonList.Add(lessons[i]);
                            break;
                        }
                    }
                }

                for (var j = 0; j < priceFilter.Count(); j++)
                {
                    System.Diagnostics.Debug.WriteLine("Price filter " + priceFilter[j].ToLower());

                    if ((Double.Parse(lessons[i].price) > 0) && (priceFilter[j].ToLower() == "paid"))
                    {
                        System.Diagnostics.Debug.WriteLine("Matched for paid lesson");
                        if (ILessonList.Contains(lessons[i]) != true)
                        {
                            ILessonList.Add(lessons[i]);
                            break;
                        }
                    } else if ((Double.Parse(lessons[i].price) == 0) && (priceFilter[j].ToLower() == "free"))
                    {
                        System.Diagnostics.Debug.WriteLine("Matched for free lesson");
                        if (ILessonList.Contains(lessons[i]) != true)
                        {
                            ILessonList.Add(lessons[i]);
                            break;
                        }
                    }
                }

                for (var j = 0; j < ratingFilter.Count(); j++)
                {
                    Double value;
                    if (Double.TryParse(ratingFilter[j], out value))
                    {
                        Double meanRating = (double.Parse(lessons[i].rating_1) * 1 + double.Parse(lessons[i].rating_2) * 2 + double.Parse(lessons[i].rating_3) * 3 + double.Parse(lessons[i].rating_4) * 4 + double.Parse(lessons[i].rating_5) * 5) / (double.Parse(lessons[i].rating_1) + double.Parse(lessons[i].rating_2) + double.Parse(lessons[i].rating_3) + double.Parse(lessons[i].rating_4) + double.Parse(lessons[i].rating_5));
                        System.Diagnostics.Debug.WriteLine((double.Parse(lessons[i].rating_1) * 1 + double.Parse(lessons[i].rating_2) * 2 + double.Parse(lessons[i].rating_3) * 3 + double.Parse(lessons[i].rating_4) * 4 + double.Parse(lessons[i].rating_5) * 5) + "/" + (double.Parse(lessons[i].rating_1) + double.Parse(lessons[i].rating_2) + double.Parse(lessons[i].rating_3) + double.Parse(lessons[i].rating_4) + double.Parse(lessons[i].rating_5)));
                        System.Diagnostics.Debug.WriteLine("Mean Rating: " + meanRating);
                        if (meanRating >= Double.Parse(ratingFilter[j]))
                        {
                            System.Diagnostics.Debug.WriteLine("Matched for rating lesson");
                            if (ILessonList.Contains(lessons[i]) != true)
                            {
                                ILessonList.Add(lessons[i]);
                                break;
                            }
                        }
                    }

                }


            }

            return ILessonList;

        }

        public IList<Lesson> retCategories(IList<Lesson> lessons, string cat)
        {
            List<Lesson> sLessons = new List<Lesson>();

            for (var i = 0; i < lessons.Count; i++)
            {
                if(lessons[i].category.ToLower() == cat.ToLower())
                {
                    sLessons.Add(lessons[i]);
                }
                    
            }
            return sLessons;
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
                var lesson_title = lessons[i].title.ToLower();
                var lesson_overview = lessons[i].overview.ToLower();

                System.Diagnostics.Debug.WriteLine("=========" + "WE AT INDEX " + i + "========");



                for (var j = 0; j < querySplit.Count(); j++)
                {
                    if(lesson_title.Contains(querySplit[j].ToLower()))
                    {
                        containsWordLessons.Add(lessons[i]);
                        System.Diagnostics.Debug.WriteLine("=========ADDING INDEX " + i + "========");
                        break;
                    } else if(lesson_overview.Contains(querySplit[j].ToLower()))
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

                var lesson_title = lessons[i].title.ToLower();
                var lesson_overview = lessons[i].overview.ToLower();
                var lesson_rating = (double.Parse(lessons[i].rating_1) * 1 + double.Parse(lessons[i].rating_2) * 2 + double.Parse(lessons[i].rating_3) * 3 + double.Parse(lessons[i].rating_4) * 4 + double.Parse(lessons[i].rating_5) * 5) / (double.Parse(lessons[i].rating_1) + double.Parse(lessons[i].rating_2) + double.Parse(lessons[i].rating_3) + double.Parse(lessons[i].rating_4) + double.Parse(lessons[i].rating_5));

                System.Diagnostics.Debug.WriteLine("=========TITLE: " + lesson_title + "========");


                Double points = 0;
                for (var j = 0; j < querySplit.Count(); j++)
                {
                    if (lesson_title.Contains(querySplit[j].ToLower()))
                    {
                        points += 1.5;
                    }


                    var match = Regex.Matches(lesson_overview, querySplit[j].ToLower()).Count;

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

        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }

    }
}