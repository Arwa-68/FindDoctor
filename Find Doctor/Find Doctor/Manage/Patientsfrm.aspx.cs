using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Patientsfrm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ServicesData_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if(e.CommandName== "Lock")
        {
            DataClassesDataContext DB = new DataClassesDataContext();
            Patient patint = DB.Patients.Single(p => p.PatientID == int.Parse(e.CommandArgument.ToString()));
            aspnet_Membership aspmem = DB.aspnet_Memberships.Single(p => p.UserId == patint.UserID);
            aspmem.IsLockedOut = true;
            aspmem.FailedPasswordAttemptCount = 0;
            DB.SubmitChanges();
        }
        else if (e.CommandName == "UnLock")
        {
            DataClassesDataContext DB = new DataClassesDataContext();
            Patient patint = DB.Patients.Single(p => p.PatientID == int.Parse(e.CommandArgument.ToString()));
            aspnet_Membership aspmem = DB.aspnet_Memberships.Single(p => p.UserId == patint.UserID);
            aspmem.IsLockedOut = false;
            aspmem.FailedPasswordAttemptCount = 0;
            DB.SubmitChanges();
        }
    }

    protected void ServicesData_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}