using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_bookingfrm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (User.Identity.Name.ToLower() != "admin" && User.IsInRole("Pateint") == false)
            {
                DataClassesDataContext DB = new DataClassesDataContext();
               // Response.Redirect("~/Manage/bookingfrm.aspx");
                MembershipUser newUser = Membership.GetUser(User.Identity.Name);
                try {
                    DoctorCMB.SelectedValue = DB.Doctors.Single(p => p.UserID == Guid.Parse(newUser.ProviderUserKey.ToString())).DoctorID.ToString();
                    DoctorCMB.Enabled = false;
                }
                catch
                {
                    DoctorCMB.Enabled = false;
                }
            }
            else if (User.IsInRole("Pateint") == true)
            {
                Response.Redirect("~/Manage/PatientBooking.aspx");
            }

            Response.Redirect("~/Manage/Doctorsfrm.aspx");
        }
    }
}