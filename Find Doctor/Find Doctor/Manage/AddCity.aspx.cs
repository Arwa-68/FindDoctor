using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Manage_AddCity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                DirCity(int.Parse(Request.QueryString["ID"]));
            }
        }


        if (User.Identity.IsAuthenticated == false)
            Response.Redirect("~/login.aspx");

        if (User.Identity.Name.ToLower() != "admin")
            Response.Redirect("~/login.aspx");
    }

    private void DirCity(int ID)
    {
        DataClassesDataContext DB = new DataClassesDataContext();
        City city = DB.Cities.Single(p => p.CityID == ID);
        CityName.Text = city.CityName;
        Loc.Text = city.Location;
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {

        DataClassesDataContext DB = new DataClassesDataContext();
        City city = new City();
        if (Request.QueryString["ID"] != null)
            city = DB.Cities.Single(p => p.CityID == int.Parse(Request.QueryString["ID"]));

        city.CityName = CityName.Text;
        city.Location = Loc.Text;

        foreach (UploadedFile file in Upload1.UploadedFiles)
        {

            string gi = Guid.NewGuid().ToString();
            file.SaveAs(Server.MapPath("..") + @"\Upload\Cities\" + gi + file.GetExtension());
            gi = gi + file.GetExtension();
            city.Image = gi;
        }


        if (Request.QueryString["ID"] == null)
            DB.Cities.InsertOnSubmit(city);
        DB.SubmitChanges();
        Response.Redirect("CityForm.aspx");
    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("CityForm.aspx");
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {

    }
}