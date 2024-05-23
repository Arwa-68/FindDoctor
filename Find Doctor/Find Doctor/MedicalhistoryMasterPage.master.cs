using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MedicalhistoryMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!HttpContext.Current.User.Identity.IsAuthenticated)
        //    Response.Redirect("~/login.aspx");



        string MENI = "";
        string[] EI;
       
            EI = Context.Request.Url.ToString().Split(new char[] { '/' });

            try
            {
            MENI = EI[EI.Length - 1].Replace("#", "").Replace(" ", "");
            MENI = MENI.Substring(0, MENI.IndexOf("aspx") + 4);
            }
            catch { }


        if (this.Context.User.IsInRole("Staff"))
        {
            approv.Visible = false;
            doc.Visible = false;
            if (MENI.ToLower() != "ApprovedPatientList.aspx".ToLower() && MENI.ToLower() != "AddPatientRecord.aspx".ToLower() && MENI.ToLower() != "changePassword.aspx".ToLower() && MENI.ToLower() != "ChangePasswordSuccess.aspx".ToLower())
                Response.Redirect("ApprovedPatientList.aspx");
        }else if (this.Context.User.IsInRole("Patient"))
        {
            approv.Visible = false;
            doc.Visible = false;
            Ptnt.Visible = false;
            if (MENI.ToLower() != "PatientRecords.aspx".ToLower()  && MENI.ToLower() != "changePassword.aspx".ToLower() && MENI.ToLower() != "ChangePasswordSuccess.aspx".ToLower())
                Response.Redirect("PatientRecords.aspx");
        }



    }
}
