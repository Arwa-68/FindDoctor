using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Manage_AddHospital : System.Web.UI.Page
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
        Hosptial doc = DB.Hosptials.Single(p => p.HospitalID == ID);
        Departmenttxt.Text = doc.HospitalName;
        MobileNumber.Text = doc.Mobile;
        TelNumber.Text = doc.Tel;
        Address.Text = doc.Address.ToString();
        Loc.Text = doc.Location;
        CityID.SelectedValue = doc.CityID.ToString();
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {

        DataClassesDataContext DB = new DataClassesDataContext();
        Hosptial hospital = new Hosptial();
        if (Request.QueryString["ID"] != null)
            hospital = DB.Hosptials.Single(p => p.HospitalID == int.Parse(Request.QueryString["ID"]));

        hospital.HospitalName = Departmenttxt.Text;
        hospital.Mobile = MobileNumber.Text;
        hospital.Tel = TelNumber.Text;
        hospital.CityID = int.Parse(CityID.SelectedValue);
        hospital.Address = Address.Text;
        hospital.Location = Loc.Text;
        foreach (UploadedFile file in Upload1.UploadedFiles)
        {

            string gi = Guid.NewGuid().ToString();
            file.SaveAs(Server.MapPath("..") + @"\Upload\Hospitals\" + gi + file.GetExtension());
            gi = gi + file.GetExtension();
            hospital.Image = gi;
        }
        if (Request.QueryString["ID"] == null)
            DB.Hosptials.InsertOnSubmit(hospital);
        DB.SubmitChanges();
        Response.Redirect("Hospitalform.aspx");
    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Hospitalform.aspx");
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {

    }
}