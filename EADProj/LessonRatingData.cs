using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.ML.Data;

namespace EADProj.BLL
{
    class LessonRatingData
    {

    }

    class LessonRating
    {
        [LoadColumn(0)]
        public float userId;
        [LoadColumn(1)]
        public float lessonId;
        [LoadColumn(2)]
        public float Label;
    }

    class LessonRatingPrediction
    {
        public float Label;
        public float Score;
    }


}