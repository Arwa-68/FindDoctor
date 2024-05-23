using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Manage_CityForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
            Response.Redirect("~/login.aspx");

        if (User.Identity.Name.ToLower() != "admin")
            Response.Redirect("~/login.aspx");
    }

    protected void Department_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCity.aspx");
    }

    protected void ServicesData_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {

        if (e.CommandName == "DeleteData")
        {
            GridEditableItem item = e.Item as GridEditableItem;
            TableCell tb = item["CityID"];

            DelCity(int.Parse(tb.Text));
            ServicesData.Rebind();
        }

    }



    protected void ServicesData_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("AddCity.aspx?ID=" + ServicesData.SelectedValue.ToString());
    }
    void DelCity(int ID)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        City city = db.Cities.Single(p => p.CityID == ID);
        db.Cities.DeleteOnSubmit(city);
        db.SubmitChanges();
    }
}