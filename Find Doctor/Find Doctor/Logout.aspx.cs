using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Net.Security;
using System.Web.Security;
public partial class Logout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        //FormsAuthentication.Authenticate(Membership.GetUser().UserName, false);
        Response.Redirect("~/Login.aspx");
    }
}