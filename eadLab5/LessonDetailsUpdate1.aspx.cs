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
    public partial class LessonDetailsUpdate1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TbCode.Text = (string)Session["SSId"];
                TbName.Text = (string)Session["SSName"];
                TbTiming.Text = (string)Session["SSTiming"];
                DdlSubj.SelectedItem.Text = (string)Session["SSSubj"];
                TbTeacher.Text = (string)Session["SSTeacher"];
            }
        }



        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LessonDetailsView1.aspx");
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (ValidateInput())
            {

                Lesson les = new Lesson(TbCode.Text, TbName.Text, TbTiming.Text, DdlSubj.Text, TbTeacher.Text);
                int result = les.UpdateLesson();
                if (result == 1)
                {
                    LblMsg.Text = "Record updated successfully!";
                    LblMsg.ForeColor = Color.Green;
                }
                else
                {
                    LblMsg.Text = "Error in adding record! Inform System Administrator!";
                    LblMsg.ForeColor = Color.Red;
                }
            }
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
    }
}