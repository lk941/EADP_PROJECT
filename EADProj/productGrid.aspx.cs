using System;
using System.Collections.Generic;
using EADProj.BLL;
using EADProj.DLL;
using StrongGrid.Models;
using Microsoft.ML;
using Microsoft.ML.Trainers;
using System.IO;
using System.Reflection;

namespace EADProj
{
    public partial class productGrid : System.Web.UI.Page
    {
        protected IList<Lesson> lesson;

        protected void Page_Load(object sender, EventArgs e)
        {

            lesson = new List<Lesson>();
            Lesson l1 = new Lesson();

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
                        lesson.Add(new Lesson()
                        {
                            title = l1.title,
                            price = l1.price,
                            rating = l1.rating,
                            difficulty = l1.difficulty,
                            duration = l1.duration
                        });
                    }
                } catch
                {
                    List<int> lessonId = new List<int>();
                    l1 = new Lesson();
                    for (var j = 0; j < 5; j++)
                    {
                        System.Diagnostics.Debug.WriteLine("Starting While Loop");
                        while (true)
                        {
                            int rando = RandomNumber(1, l1.GetLengthOfDB());
                            l1 = l1.GetLessonById(rando.ToString());

                            System.Diagnostics.Debug.WriteLine("Random Number " + rando);

                            if (lessonId.Contains(rando) == false)
                            {
                                System.Diagnostics.Debug.WriteLine("Lesson contain" + lesson.Contains(l1));
                                lesson.Add(new Lesson()
                                {
                                    title = l1.title,
                                    price = l1.price,
                                    rating = l1.rating,
                                    difficulty = l1.difficulty,
                                    duration = l1.duration
                                });
                                lessonId.Add(rando);

                                break;
                            }
                        }

                    }
                }

            } else
            {
                List<int> lessonId = new List<int>();
                l1 = new Lesson();
                for (var j = 0; j < 5; j++)
                {
                    System.Diagnostics.Debug.WriteLine("Starting While Loop");
                    while (true)
                    {
                        int rando = RandomNumber(1, l1.GetLengthOfDB());
                        l1 = l1.GetLessonById(rando.ToString());

                        System.Diagnostics.Debug.WriteLine("Random Number " + rando);

                        if (lessonId.Contains(rando) == false)
                        {
                            System.Diagnostics.Debug.WriteLine("Lesson contain" + lesson.Contains(l1));
                            lesson.Add(new Lesson()
                            {
                                title = l1.title,
                                price = l1.price,
                                rating = l1.rating,
                                difficulty = l1.difficulty,
                                duration = l1.duration
                            });
                            lessonId.Add(rando);

                            break;
                        }
                    }

                }

            }


        
        }

        protected (IDataView training, IDataView test) LoadData(MLContext mlContext)
        {
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

            Console.WriteLine("=============== Training the model ===============");
            ITransformer model = trainerEstimator.Fit(trainingDataView);

            return model;
        }


        protected void EvaluateModel(MLContext mlContext, IDataView testDataView, ITransformer model)
        {
            Console.WriteLine("=============== Evaluating the model ===============");
            var prediction = model.Transform(testDataView);
            var metrics = mlContext.Regression.Evaluate(prediction, labelColumnName: "Label", scoreColumnName: "Score");
            Console.WriteLine("Root Mean Squared Error : " + metrics.RootMeanSquaredError.ToString());
            Console.WriteLine("RSquared: " + metrics.RSquared.ToString());
        }


        protected List<int> UseModelForBest5Prediction(MLContext mlContext, ITransformer model)
        {
            var top5List = new List<int> { 0, 0, 0, 0, 0 };
            var top5ListScore = new List<int> { 0, 0, 0, 0, 0 };
            var predictionEngine = mlContext.Model.CreatePredictionEngine<LessonRating, LessonRatingPrediction>(model);
            for (var i = 0; i < 193609; i++)
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


            for (var j = 0; j < 5; j++)
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

            Console.WriteLine("=============== Saving the model to a file ===============");
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