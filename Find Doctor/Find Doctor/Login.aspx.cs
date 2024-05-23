using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (User.IsInRole("Pateint") == true || User.IsInRole("Doctor") == true)
            {
                Response.Redirect("~/Manage/PatientBooking.aspx");
            }

            Response.Redirect("~/Manage/bookingfrm.aspx");
        }
    }
    protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
    {



        if (User.Identity.IsAuthenticated)
        {
            if (User.Identity.Name.ToLower() != "admin" && User.IsInRole("Pateint") == false)
            {
                Response.Redirect("~/Manage/bookingfrm.aspx");
            }
            else if (User.IsInRole("Pateint") == true)
            {
                Response.Redirect("~/Manage/bookingfrm.aspx");
            }

            Response.Redirect("~/Manage/PatientBooking.aspx");
        }
    }
    protected void LoginUser_LoggingIn(object sender, LoginCancelEventArgs e)
    {
    }
}