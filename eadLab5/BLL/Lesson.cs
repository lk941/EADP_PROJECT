
using eadLab5.DAL;
using System;
using System.Collections.Generic;

namespace eadLab5.BLL
{
    public class Lesson
    {
        // Define class properties
        public string Code { get; set; }
        public string Name { get; set; }
        public string Timing { get; set; }
        public string Subj { get; set; }
        public string Teacher { get; set; }
        
        // Default constructor
        public Lesson()
        {

        }
        // Define a constructor to initialize all the properties
        public Lesson(string code, string name, string timing, string subj, string teacher)
        {
            Code = code;
            Name = name;
            Timing = timing;
            Subj = subj;
            Teacher = teacher;
            //EmployeeCPF = ComputeEeCPF();
            //EmployerCPF = ComputeErCPF();
        }

        /*public int ComputeAge()
        {
            DateTime now = DateTime.Today;
            int age = DateTime.Today.Year - Birthdate.Year;
            if (now.Month < Birthdate.Month)
            {
                age--;
            }
            else
            {
                if (now.Month == Birthdate.Month && now.Day < Birthdate.Day)
                {
                    age--;
                }
            }
            return age;
        }

        public double ComputeEeCPF()
        {
            double contribute = 0;
            double payCap = MthlyWage;
            if (MthlyWage > 6000)
                payCap = 6000;

            int age = ComputeAge();
            if (age <= 55)
            {
                contribute = payCap * 0.2;
            }
            else if (age <= 60)
            {
                contribute = payCap * 0.13;
            }
            else if (age <= 65)
            {
                contribute = payCap * 0.075;
            }
            else
                contribute = payCap * 0.05;
            return Math.Round(contribute, 2);
        }

        public double ComputeErCPF()
        {
            double contribute = 0;
            double payCap = MthlyWage;
            if (MthlyWage > 6000)
            {
                payCap = 6000;
            }

            int age = ComputeAge();
            if (age <= 55)
            {
                contribute = payCap * 0.17;
            }
            else if (age <= 60)
            {
                contribute = payCap * 0.13;
            }
            else if (age <= 65)
            {
                contribute = payCap * 0.09;
            }
            else
                contribute = payCap * 0.075;
            return Math.Round(contribute, 2);
        }*/

        public int AddLesson()
        {
            LessonDAO dao = new LessonDAO();
            int result = dao.Insert(this);
            return result;
        }
        public int UpdateLesson()
        {
            LessonDAO dao = new LessonDAO();
            int result = dao.Update(this);
            return result;
        }
        public List<Lesson> GetAllLesson()
        {
            LessonDAO dao = new LessonDAO();
            return dao.SelectAll();
        }

        public Lesson GetLessonById(string code)
        {
            LessonDAO dao = new LessonDAO();
            return dao.SelectById(code);
        }

    }
}