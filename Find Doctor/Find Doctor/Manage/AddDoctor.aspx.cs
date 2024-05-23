using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Manage_AddDoctor : System.Web.UI.Page
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
        Doctor doc = DB.Doctors.Single(p => p.DoctorID == ID);
        Departmenttxt.Text = doc.DoctorName;
        MobileNumber.Text = doc.DoctorMobile;
        TelNumber.Text = doc.DoctorTel;
        spec.SelectedValue = doc.DoctorSpecialisID.ToString();
        HospitalID.SelectedValue = doc.HospialID.ToString();

        if (doc.UserID != null)
        {
            u1.Visible = u2.Visible = false;
        }

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        DataClassesDataContext DB = new DataClassesDataContext();
        bool UserSuccess = false;
        Doctor dept = new Doctor();
        if (Request.QueryString["ID"] != null)
            dept = DB.Doctors.Single(p => p.DoctorID == int.Parse(Request.QueryString["ID"]));

        if (dept.UserID != null)
        {
            UserSuccess = true;
            goto update;
        }
        MembershipCreateStatus createStatus;
        MembershipProvider MemCustom;
        MemCustom = Membership.Providers["AspNetSqlMembershipProvider"];
        object ProviderUserKey = null;
        MembershipUser newUser = MemCustom.CreateUser(userName.Text, Password.Text, "mm@mm.com", Password.Text, Password.Text, true, ProviderUserKey, out createStatus);
        switch (createStatus)
        {
            case MembershipCreateStatus.Success:

                Roles.AddUserToRole(userName.Text, "Doctor");
                dept.UserID = (Guid)newUser.ProviderUserKey;
                MessageBox.Text = "";
                UserSuccess = true;
                break;
            case MembershipCreateStatus.DuplicateUserName:
                MessageBox.Text = "There already exists a user with this username.";
                break;

            case MembershipCreateStatus.DuplicateEmail:
                MessageBox.Text = "There already exists a user with this email address.";
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

        if (UserSuccess == false)
            return;

        update:

        dept.DoctorName = Departmenttxt.Text;
        dept.DoctorMobile = MobileNumber.Text;
        dept.DoctorTel = TelNumber.Text;
        dept.DoctorSpecialisID = int.Parse(spec.SelectedValue);
        dept.HospialID = int.Parse(HospitalID.SelectedValue);
        foreach (UploadedFile file in Upload1.UploadedFiles)
        {

            string gi = Guid.NewGuid().ToString();
            file.SaveAs(Server.MapPath("..") + @"\Upload\Doctors\" + gi + file.GetExtension());
            gi = gi + file.GetExtension();
            dept.Image = gi;
        }
        if (Request.QueryString["ID"] == null)
        {
            
            DB.Doctors.InsertOnSubmit(dept);
           
        }
       


            DB.SubmitChanges();
        Response.Redirect("Doctorsfrm.aspx");
    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Doctorsfrm.aspx");
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {

    }
}