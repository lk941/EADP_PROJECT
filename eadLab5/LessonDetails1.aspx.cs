using eadLab5.BLL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class LessonDetails1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private bool ValidateInput()
        {
            bool result;
            LblMsg.Text = String.Empty;

            if (TbCode.Text == "")
            {
                LblMsg.Text += "Lesson Code is required!" + "<br/>";
            }
            if (String.IsNullOrEmpty(TbName.Text))
            {
                LblMsg.Text += "Lesson Name is required!" + "<br/>";
            }

            if (TbTiming.Text == "")
            {
                LblMsg.Text += "Lesson Timings are required!" + "<br/>";
            }


            if (DdlSubj.SelectedIndex == 0)
            {
                LblMsg.Text += "Subject must be selected!" + "<br/>";
            }

            if (TbTeacher.Text == "")
            {
                LblMsg.Text += "Name of teacher is required!" + "<br/>";
            }
            if (String.IsNullOrEmpty(LblMsg.Text))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LessonDetailsView1.aspx");
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            Lesson les = new Lesson();

            if (les.GetLessonById(TbCode.Text) != null)
            {
                LblMsg.Text = "Record already exists!";
                LblMsg.ForeColor = Color.Red;
            }
            else
            {
                if (ValidateInput())
                {

                    les = new Lesson(TbCode.Text, TbName.Text, TbTiming.Text, DdlSubj.Text, TbTeacher.Text);
                    int result = les.AddLesson();
                    if (result == 1)
                    {
                        LblMsg.Text = "Record added successfully!";
                        LblMsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        LblMsg.Text = "Error in adding record! Inform System Administrator!";
                        LblMsg.ForeColor = Color.Red;
                    }
                }
            }
        }

        

        protected void TbTeacher_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
  
      
        