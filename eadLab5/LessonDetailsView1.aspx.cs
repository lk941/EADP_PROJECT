using eadLab5.BLL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web.UI.WebControls;

namespace eadLab5
{
    public partial class LessonDetailsView1 : System.Web.UI.Page
    {
        List<Lesson> eList;

        protected void Page_Load(object sender, EventArgs e)
        {
            RefreshGridView();
        }

        private void RefreshGridView()
        {
            Lesson les = new Lesson();
            eList = les.GetAllLesson();

            // using gridview to bind to the list of employee objects
            GvEmployee.Visible = true;
            GvEmployee.DataSource = eList;
            GvEmployee.DataBind();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("LessonDetails1.aspx");
        }

        protected void GvEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GvEmployee.SelectedRow;
            Session["SSId"] = row.Cells[0].Text;
            Session["SSName"] = row.Cells[1].Text;
            Session["SSTiming"] = row.Cells[2].Text;
            Session["SSSubj"] = row.Cells[3].Text;
            Session["SSTeacher"] = row.Cells[4].Text;
            Response.Redirect("LessonDetailsUpdate1.aspx");

        }
    }
}