using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Visits : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ServicesData_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Visit")
        {
            DataClassesDataContext DB = new DataClassesDataContext();
            Booking book = DB.Bookings.Single(p => p.BookingID == int.Parse(e.CommandArgument.ToString()));
            Patient aspmem = DB.Patients.Single(p => p.PatientID == book.PatientID);
            var client = new SmtpClient("smtp-relay.brevo.com", 587)
            {
                Credentials = new NetworkCredential("74e04d002@smtp-brevo.com", "PGgyqJbSLrZpNBjA"),
                EnableSsl = true
            };
            client.Send("finddoctor@gmail.com", aspmem.Email, "Find Doctor", "Hi," + aspmem.PatientName + "<br/> you come to clinic on " + DateTime.Now.ToString("MM/dd/yyyy ", new System.Globalization.CultureInfo("en-US")) + DateTime.Now.ToString("HH:mm:ss ", new System.Globalization.CultureInfo("en-US")));
            System.Console.WriteLine("Sent");

        }
    }

    protected void ServicesData_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void dttime_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
    {

    }
}