using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_PatientBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (User.IsInRole("Pateint") == true)
            {
                DataClassesDataContext DB = new DataClassesDataContext();
                MembershipUser newUser = Membership.GetUser(User.Identity.Name);
                Patient pa = DB.Patients.Single(p => p.UserID.Value == Guid.Parse(newUser.ProviderUserKey.ToString()));
                PID.Value = pa.PatientID.ToString();
            }
            else if (User.IsInRole("Doctor") == true)
            {
                DataClassesDataContext DB = new DataClassesDataContext();
                MembershipUser newUser = Membership.GetUser(User.Identity.Name);
                Doctor pa = DB.Doctors.Single(p => p.UserID.Value == Guid.Parse(newUser.ProviderUserKey.ToString()));
                DID.Value = pa.DoctorID.ToString();
            }
            else
                Response.Redirect("~/login.aspx");

        }
        else
            Response.Redirect("~/login.aspx");
    }
}