using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class appointmentData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(User.Identity.IsAuthenticated)
        {
            if (User.IsInRole("Pateint"))
            {

            }
            else
                Response.Redirect("~/Login.aspx");
        }
        else
            Response.Redirect("~/Login.aspx");

        if (!IsPostBack)
        {
            MembershipUser newUser = Membership.GetUser(User.Identity.Name);
            DataClassesDataContext DB = new DataClassesDataContext();
            Patient pa = DB.Patients.Single(p => p.UserID.Value == Guid.Parse(newUser.ProviderUserKey.ToString()));
            username.Text = pa.PatientName;
            Tel.Text = pa.Mobile;
        }

    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {

        MembershipUser newUser = Membership.GetUser(User.Identity.Name);
        DataClassesDataContext DB = new DataClassesDataContext();
        Patient pa = DB.Patients.Single(p => p.UserID == Guid.Parse(newUser.ProviderUserKey.ToString()));
        Booking book = new Booking();
        book.HospitalID = int.Parse(HosptalIDCMB.SelectedValue);
        book.DoctorID = int.Parse(DropDownList1.SelectedValue);
        book.BookingDate = DateTime.Parse(dttime.SelectedDate.Value.ToString("MM/dd/yyyy ", new System.Globalization.CultureInfo("en-US")) + " " + hidTime.SelectedValue, new System.Globalization.CultureInfo("en-US"));
        book.PatientID = pa.PatientID;
        DB.Bookings.InsertOnSubmit(book);
        DB.SubmitChanges();



        var client = new SmtpClient("smtp-relay.brevo.com", 587)
        {
            Credentials = new NetworkCredential("74e04d002@smtp-brevo.com", "PGgyqJbSLrZpNBjA"),
            EnableSsl = true
        };
        client.Send("finddoctor@gmail.com", email.Text, "Find Doctor", "Hi,"+ pa.PatientName + "<br/> Your Booking on "+ dttime.SelectedDate.Value.ToString("MM/dd/yyyy ", new System.Globalization.CultureInfo("en-US")) + hidTime.SelectedValue);
        System.Console.WriteLine("Sent");

        

        MV.ActiveViewIndex = 1;

    }

    protected void dttime_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
    {
        SqlDataSource5.SelectParameters[0].DefaultValue = dttime.SelectedDate.Value.ToString("MM/dd/yyyy", new System.Globalization.CultureInfo("en-US"));
        SqlDataSource5.SelectParameters[1].DefaultValue = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt", new System.Globalization.CultureInfo("en-US"));
        SqlDataSource5.DataBind();
    }

    protected void hidTime_DataBinding(object sender, EventArgs e)
    {
        hidTime.Items.Clear();
        hidTime.Items.Add(new ListItem("Select Time", "0"));
    }
}