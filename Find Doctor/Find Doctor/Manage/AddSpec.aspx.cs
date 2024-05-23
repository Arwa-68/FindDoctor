using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_AddSubject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                DirDept(int.Parse(Request.QueryString["ID"]));
            }
        }
        if (User.Identity.IsAuthenticated == false)
            Response.Redirect("~/login.aspx");

        if (User.Identity.Name.ToLower() != "admin")
            Response.Redirect("~/login.aspx");
    }

    private void DirDept(int ID)
    {
        DataClassesDataContext DB = new DataClassesDataContext();
        Specialist subj = DB.Specialists.Single(p => p.SpecialistID == ID);
        SubjectName.Text = subj.SpecialistName;
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {

        DataClassesDataContext DB = new DataClassesDataContext();
        Specialist subj = new Specialist();
        if (Request.QueryString["ID"] != null)
            subj = DB.Specialists.Single(p => p.SpecialistID == int.Parse(Request.QueryString["ID"]));

        subj.SpecialistName = SubjectName.Text;

        if (Request.QueryString["ID"] == null)
            DB.Specialists.InsertOnSubmit(subj);
        DB.SubmitChanges();
        Response.Redirect("SpecForm.aspx");
    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("SpecForm.aspx");
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {

    }
}