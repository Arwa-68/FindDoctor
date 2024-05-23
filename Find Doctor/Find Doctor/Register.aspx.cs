using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        MembershipCreateStatus createStatus;
        MembershipProvider MemCustom;
        MemCustom = Membership.Providers["AspNetSqlMembershipProvider"];
        object ProviderUserKey = null;
        MembershipUser newUser = MemCustom.CreateUser(userName.Text, Password.Text, "mm@mm.com", Password.Text, Password.Text, true, ProviderUserKey, out createStatus);
        switch (createStatus)
        {
            case MembershipCreateStatus.Success:

                Roles.AddUserToRole(userName.Text, "Pateint");

                DataClassesDataContext DB = new DataClassesDataContext();
                Patient p = new Patient();
                p.PatientName = pname.Text;
                p.Mobile = Pmobile.Text;
                p.UserID = (Guid)newUser.ProviderUserKey;
                DB.Patients.InsertOnSubmit(p);
                DB.SubmitChanges();
                Response.Redirect("~/appointmentData.aspx");
                break;
            case MembershipCreateStatus.DuplicateUserName:
                MessageBox.Text= "There already exists a user with this username.";
                break;

            case MembershipCreateStatus.DuplicateEmail:
                MessageBox.Text =  "There already exists a user with this email address.";
                break;
            case MembershipCreateStatus.InvalidEmail:
                MessageBox.Text = "There email address you provided in invalid.";
                break;
            case MembershipCreateStatus.InvalidAnswer:
                MessageBox.Text = "There security answer was invalid.";
                break;
            case MembershipCreateStatus.InvalidPassword:
                MessageBox.Text = "The password you provided is invalid. It must be seven characters long and have at least one non-alphanumeric character.";

                break;
            default:
                break;
        }
    }
}