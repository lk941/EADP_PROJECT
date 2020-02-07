using System;
using System.Collections.Generic;
using EADProj.BLL;
using EADProj.DLL;
using StrongGrid.Models;
using Microsoft.ML;
using Microsoft.ML.Trainers;
using System.IO;
using System.Reflection;
using EADProj.Search;
using System.Web.Services;
using System.Web.Script.Services;
using System.Linq;

namespace EADProj
{
    public partial class productGrid : System.Web.UI.Page
    {
        protected IList<Lesson> lesson;
        protected IList<User> user;


        protected void Page_Load(object sender, EventArgs e)
        {

            lesson = new List<Lesson>();
            Lesson l1 = new Lesson();
            user = new List<User>();
            User u1 = new User();
            var searchQS = "";
            var filterQS = "";
            var lvlQS = "";
            var priceQS = "";
            var ratingQS = "";
            var categoryQS = "";

            user = u1.Get4RandomTeachers();

            try
            {
                searchQS = Request.QueryString["search"].ToString();

            } catch
            {
                searchQS = null;
            }

            try
            {
                filterQS = Request.QueryString["filter"].ToString();
                lvlQS = Request.QueryString["lvlFilter"].ToString();
                priceQS = Request.QueryString["priceFilter"].ToString();
                ratingQS = Request.QueryString["ratingFilter"].ToString();
                //System.Diagnostics.Debug.WriteLine(categoryQS);

            }
            catch
            {
                filterQS = null;
                lvlQS = null;
                priceQS = null;
                ratingQS = null;
            }

            try
            {
                categoryQS = Request.QueryString["cate"].ToString();
                System.Diagnostics.Debug.WriteLine(categoryQS);
            } catch
            {
                categoryQS = null;
            }

            if (searchQS == null)
            {
                headerText.Text = "Showing: Shop";
                //System.Diagnostics.Debug.WriteLine("SEARCH IS NULL");
                // if user didnt search anything, itll check if user is logged in
                // if user is logged in and has data saved for him, he will have his recc lessons shown else itll be random
                if (Session["id"] != null)
                {
                    try
                    {
                        //Find the top 5 using machine learning
                        MLContext mlContext = new MLContext();
                        (IDataView trainingDataView, IDataView testDataView) = LoadData(mlContext);
                        ITransformer model = BuildAndTrainModel(mlContext, trainingDataView);
                        EvaluateModel(mlContext, testDataView, model);
                        //UseModelForSinglePrediction(mlContext, model);
                        var top5recc = UseModelForBest5Prediction(mlContext, model);
                        SaveModel(mlContext, trainingDataView.Schema, model);

                        for (var i = 0; i < top5recc.Count; i++)
                        {
                            System.Diagnostics.Debug.WriteLine(top5recc[i].ToString());
                            l1 = l1.GetLessonById(top5recc[i].ToString());
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
                        }
                    }
                    catch
                    {
                        List<int> lessonId = new List<int>();
                        l1 = new Lesson();
                        for (var j = 0; j < 8; j++)
                        {
                            //System.Diagnostics.Debug.WriteLine("Starting While Loop");
                            while (true)
                            {
                                int rando = RandomNumber(1, l1.GetLengthOfDB());
                                l1 = l1.GetLessonById(rando.ToString());
                                var lesson_rating = (double.Parse(l1.rating_1) * 1 + double.Parse(l1.rating_2) * 2 + double.Parse(l1.rating_3) * 3 + double.Parse(l1.rating_4) * 4 + double.Parse(l1.rating_5) * 5) / (double.Parse(l1.rating_1) + double.Parse(l1.rating_2) + double.Parse(l1.rating_3) + double.Parse(l1.rating_4) + double.Parse(l1.rating_5));

                                //System.Diagnostics.Debug.WriteLine("Random Number " + rando);

                                if (lessonId.Contains(rando) == false)
                                {
                                    //System.Diagnostics.Debug.WriteLine("Lesson contain" + lesson.Contains(l1));
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

                } else if (filterQS != null || lvlQS != null || priceQS != null || ratingQS != null)
                {
                    List<String> fQS = filterQS.Split(',').ToList();
                    List<String> levelQS = lvlQS.Split(',').ToList();
                    List<String> pQS = priceQS.Split(',').ToList();
                    List<String> rQS = ratingQS.Split(',').ToList();

                    List<String> rfQS = new List<String>();

                    for (var i = 0; i < fQS.Count; i++)
                    {
                        rfQS.Add(fQS[i].Replace("%", " "));
                    }

                    Search.Search filterRet = new Search.Search();
                    Lesson tempLesson = new Lesson();
                    List<Lesson> lList = new List<Lesson>();
                    lList = tempLesson.RetrieveAllLessons();

                    for (var i = 0; i < lList.Count; i++)
                    {
                        System.Diagnostics.Debug.WriteLine("========= " + lList[i].id + " ========");

                    }

                    lesson = filterRet.filterQuery(lList, rfQS, levelQS, pQS, rQS);

                } else if (categoryQS != null) 
                {
                    Search.Search categoryRet = new Search.Search();
                    Lesson tempLesson = new Lesson();
                    List<Lesson> lList = new List<Lesson>();
                    lList = tempLesson.RetrieveAllLessons();
                    System.Diagnostics.Debug.WriteLine("========= CATEGORY: " + categoryQS + " ========");

                    categoryQS = categoryQS.Replace("%", " ");
                    categoryQS = categoryQS.Replace("AND", "&");

                    headerText.Text = categoryQS;

                    lesson = categoryRet.retCategories(lList, categoryQS);


                }
                else
                {
                    List<int> lessonId = new List<int>();
                    l1 = new Lesson();
                    for (var j = 0; j < 8; j++)
                    {
                        //System.Diagnostics.Debug.WriteLine("Starting While Loop");
                        while (true)
                        {
                            int rando = RandomNumber(1, l1.GetLengthOfDB());
                            l1 = l1.GetLessonById(rando.ToString());

                            System.Diagnostics.Debug.WriteLine("Random Number " + rando);

                            if (lessonId.Contains(rando) == false)
                            {
                                System.Diagnostics.Debug.WriteLine("Lesson contain" + lesson.Contains(l1));
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
            }
            else
            {
                var query = searchQS;
                //System.Diagnostics.Debug.WriteLine("SEARCH IS NOT NULL");
                //System.Diagnostics.Debug.WriteLine(Session["search"]);
                headerText.Text = "Showing: " + query;
                Search.Search searchRet = new Search.Search();
                Lesson tempLesson = new Lesson();
                List<Lesson> lList = new List<Lesson>();

                lList = tempLesson.RetrieveAllLessons();

                for (var i = 0; i < lList.Count; i++)
                {
                    System.Diagnostics.Debug.WriteLine("=========" + lList[i].id + "========");

                }

                lesson = searchRet.searchQuery(lList, query);

                if (lesson.Count == 0)
                {
                    notFoundLbl.Visible = true;
                }



            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string queryFilter(List<String> filter, List<String> lvlFilter, List<String> priceFilter, List<String> ratingFilter)
        {
            //System.Diagnostics.Debug.WriteLine(search);
            var fFilter = new List<String>();

            for (var i =0; i < filter.Count; i++)
            {
                System.Diagnostics.Debug.WriteLine(filter[i].Replace(" ", "%"));
                var fFilterItem = filter[i].Replace(" ", "%");
                fFilter.Add(fFilterItem);
                
            }
            System.Diagnostics.Debug.WriteLine("productGrid.aspx?filter=" + String.Join(",", fFilter) + "&lvlFilter=" + String.Join(",", lvlFilter) + "&priceFilter=" + String.Join(",", priceFilter) + "&ratingFilter=" + String.Join(",", ratingFilter));

            return "productGrid.aspx?filter=" + String.Join(",", fFilter) + "&lvlFilter=" + String.Join(",", lvlFilter) + "&priceFilter=" + String.Join(",", priceFilter) + "&ratingFilter=" + String.Join(",", ratingFilter);

        }

        protected (IDataView training, IDataView test) LoadData(MLContext mlContext)
        {
            // gets the test and train data
            var trainingDataPath = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "APP_Data", "recommendationTrain.csv");
            var testDataPath = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "APP_Data", "recommendationTest.csv");

            IDataView trainingDataView = mlContext.Data.LoadFromTextFile<LessonRating>(trainingDataPath, hasHeader: true, separatorChar: ',');
            IDataView testDataView = mlContext.Data.LoadFromTextFile<LessonRating>(testDataPath, hasHeader: true, separatorChar: ',');

            return (trainingDataView, testDataView);
        }

        protected ITransformer BuildAndTrainModel(MLContext mlContext, IDataView trainingDataView)
        {
            IEstimator<ITransformer> estimator = mlContext.Transforms.Conversion.MapValueToKey(outputColumnName: "userIdEncoded", inputColumnName: "userId")
            .Append(mlContext.Transforms.Conversion.MapValueToKey(outputColumnName: "lessonIdEncoded", inputColumnName: "lessonId"));

            var options = new MatrixFactorizationTrainer.Options
            {
                MatrixColumnIndexColumnName = "userIdEncoded",
                MatrixRowIndexColumnName = "lessonIdEncoded",
                LabelColumnName = "Label",
                NumberOfIterations = 20,
                ApproximationRank = 100
            };

            var trainerEstimator = estimator.Append(mlContext.Recommendation().Trainers.MatrixFactorization(options));

            System.Diagnostics.Debug.WriteLine("=============== Training the model ===============");
            ITransformer model = trainerEstimator.Fit(trainingDataView);

            return model;
        }


        protected void EvaluateModel(MLContext mlContext, IDataView testDataView, ITransformer model)
        {
            System.Diagnostics.Debug.WriteLine("=============== Evaluating the model ===============");
            var prediction = model.Transform(testDataView);
            var metrics = mlContext.Regression.Evaluate(prediction, labelColumnName: "Label", scoreColumnName: "Score");
            System.Diagnostics.Debug.WriteLine("Root Mean Squared Error : " + metrics.RootMeanSquaredError.ToString());
            System.Diagnostics.Debug.WriteLine("RSquared: " + metrics.RSquared.ToString());
        }


        protected List<int> UseModelForBest5Prediction(MLContext mlContext, ITransformer model)
        {
            var top5List = new List<int> { 0, 0, 0, 0, 0, 0};
            var top5ListScore = new List<int> { 0, 0, 0, 0, 0, 0};
            var numberofLessons = new Lesson();

            var predictionEngine = mlContext.Model.CreatePredictionEngine<LessonRating, LessonRatingPrediction>(model);
            for (var i = 0; i < numberofLessons.GetLengthOfDB(); i++)
            {
                var testInput = new LessonRating { userId = Convert.ToInt64(Session["id"]), lessonId = i };
                var lessonRatingPrediction = predictionEngine.Predict(testInput);
                var lowestIndex = IndexOfMin(top5ListScore);
                if (lessonRatingPrediction.Score > top5ListScore[lowestIndex])
                {
                    top5List[lowestIndex] = i;
                    top5ListScore[lowestIndex] = (int)lessonRatingPrediction.Score;
                }
            }

            top5List.Sort();
            System.Diagnostics.Debug.WriteLine("HERE ARE THE TOP 5");


            for (var j = 0; j < 6; j++)
            {
                System.Diagnostics.Debug.WriteLine(top5List[j] + " " + Environment.NewLine);
            }

            return top5List;

        }

        public int IndexOfMin(IList<int> self)
        {
            if (self == null)
            {
                throw new ArgumentNullException("self");
            }

            if (self.Count == 0)
            {
                throw new ArgumentException("List is empty.", "self");
            }

            int min = self[0];
            int minIndex = 0;

            for (int i = 1; i < self.Count; ++i)
            {
                if (self[i] < min)
                {
                    min = self[i];
                    minIndex = i;
                }
            }

            return minIndex;
        }


        protected void SaveModel(MLContext mlContext, DataViewSchema trainingDataViewSchema, ITransformer model)
        {
            var modelPath = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "APP_Data", "LessonRecommenderModel.zip");

            System.Diagnostics.Debug.WriteLine("=============== Saving the model to a file ===============");
            mlContext.Model.Save(model, trainingDataViewSchema, modelPath);
        }

        // Generate a random number between two numbers  
        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }

        /* Reference to predict a user to one movie
        public static void UseModelForSinglePrediction(MLContext mlContext, ITransformer model)
        {
            Console.WriteLine("=============== Making a prediction ===============");
            var predictionEngine = mlContext.Model.CreatePredictionEngine<LessonRating, LessonRatingPrediction>(model);
            var testInput = new LessonRating { userId = 6, movieId = 10 };

            var movieRatingPrediction = predictionEngine.Predict(testInput);
            if (Math.Round(movieRatingPrediction.Score, 1) > 3.5)
            {
                Console.WriteLine("Movie " + testInput.movieId + " is recommended for user " + testInput.userId);
                //System.Diagnostics.Debug.WriteLine();
            }
            else
            {
                Console.WriteLine("Movie " + testInput.movieId + " is not recommended for user " + testInput.userId);
            }
        }
        */

    }

}