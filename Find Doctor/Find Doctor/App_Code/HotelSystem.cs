using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

[ServiceBehavior(IncludeExceptionDetailInFaults = true)]
[ServiceContract(Namespace = "HT")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class HotelSystem
{
    public DataClassesDataContext db = new DataClassesDataContext();

    //[OperationContract]
    //[WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
    //public Events AddUpdateEvent(eventData reservation)
    //{
    //    CultureInfo info = new CultureInfo("en-US");
    //    DateTime Start = Convert.ToDateTime(reservation.newCheckInDate,info);
    //    DateTime End = Start;
    //    bool found = false;
    //    Service sv = db.Services.Single(p => p.ServiceID == reservation.ServiceID);
    //    if (reservation.reservationID > 0)
    //    {
    //        if (db.Reservations.Count(p => p.ReservationID == reservation.reservationID && p.NewCheckInDate.Value == Start && p.NewCheckOutDate.Value ==End.AddHours(sv.ServiceDurationHours.Value).AddMinutes(sv.ServiceDurationMinutes.Value)) > 0)
    //        {
    //            found = true;
    //        }
    //    }

    //    if (found == false)
    //    {
    //        if (!db.CheckBooken(Start, Start).Value)
    //            throw new Exception("Not Available");

    //        if (db.CheckBookenFound(Start, End.AddHours(sv.ServiceDurationHours.Value).AddMinutes(sv.ServiceDurationMinutes.Value), reservation.reservationID).Value)
    //            throw new Exception("Not Available");
    //    }


    //     var Result = db.addUpdateReservation(reservation.reservationID, reservation.ServiceID, reservation.UserID,  Start, End, reservation.bookType).Select(p =>
    //        new Events
    //        {
    //            id = p.ReservationID.ToString(),
    //            start = p.NewCheckInDate,
    //            end = p.NewCheckOutDate,
    //            title="Aly Othman",
    //            color = p.color,
    //            resourceId=p.ServiceID.ToString()
    //        }).Single();

    //     try
    //     {
    //         var Data = db.GetReservationByID(int.Parse(Result.id)).Single();
    //         string message = "Terminbestätgung Ihres Aktiv-sporttherapie " + Data.NewCheckInDate.Split('T')[0] + " " + Data.NewCheckInDate.Split('T')[1] + " Ibrahim Elnomany";
    //         MessageBox.SendSMSMessage("codexhome", "CodexHomeP@$$w0rd", "sdyp16qdjkk52i0", Data.Telephone.Replace(" ", "").Trim(), db.Settings.First().SMSSenderID.ToString(), message);
    //     }
    //     catch { }
    //  return Result;
    //}



    //[OperationContract]
    //[WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json)]
    //public List<GetCustomerDataResult> GetCustomerData()
    //{
    //    return db.GetCustomerData().ToList();
    //}

    //[OperationContract]
    //[WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json)]
    //public List<resources> GetServicesData()
    //{
    //    return db.GetServicesData().ToList().Select(p =>
    //             new resources
    //             {
    //                 id = p.ServiceID.ToString(),
    //                 title = p.ServiceName.ToString()
    //             }
    //             ).ToList();
    //}

    [OperationContract]
    [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json)]
    public List<Events> GetReservationData(DateTime Frm, DateTime to, string PatientID, string DoctorID)
    {
        System.Globalization.CultureInfo cu = new System.Globalization.CultureInfo("en-US");
        List<Events> Ev = null;
            
           if(PatientID!="")
            Ev=  db.Bookings.Where(p => (p.BookingDate.Value >= Frm && p.BookingDate <= to) && p.PatientID== int.Parse (PatientID)).ToList().Select(p =>
                       new Events
                       {
                           id = p.BookingID.ToString(),
                           //  resourceId = "",
                           start = p.BookingDate.Value.ToString("yyyy-MM-ddTHH:mm:ss",cu),
                           end = p.BookingDate.Value.AddMinutes(30).ToString("yyyy-MM-ddTHH:mm:ss",cu),
                           title = db.Doctors.Single(pa=>pa.DoctorID==p.DoctorID).DoctorName,
                           Tel = ""
                       }
                 ).ToList();
        else if (DoctorID != "")
            Ev = db.Bookings.Where(p => (p.BookingDate.Value >= Frm && p.BookingDate <= to) && p.DoctorID == int.Parse(DoctorID)).ToList().Select(p =>
                      new Events
                      {
                          id = p.BookingID.ToString(),
                           //  resourceId = "",
                           start = p.BookingDate.Value.ToString("yyyy-MM-ddTHH:mm:ss", cu),
                          end = p.BookingDate.Value.AddMinutes(30).ToString("yyyy-MM-ddTHH:mm:ss", cu),
                          title = db.Patients.Single(pa => pa.PatientID == p.PatientID).PatientName,
                          Tel = ""
                      }
                ).ToList();

        return Ev;
    }


    [OperationContract]
    [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json)]
    public Events UpdateReservation(int AppointID, string Dte, string Tim)
    {
        //Appointment app = db.Appointments.Single(p => p.AppointmentsID == AppointID);
        //app.AppointmentDate = DateTime.Parse(Dte + " " + Tim);
        //db.SubmitChanges();
        //Events ev = new Events();

        //ev.id = app.AppointmentsID.ToString();
        //ev.start = app.AppointmentDate.Value.ToString("yyyy-M-ddTHH:mm:ss");
        //ev.end = app.AppointmentDate.Value.AddMinutes(30).ToString("yyyy-M-ddTHH:mm:ss");
        //ev.title = app.CustomerName.ToString() + db.GetServicsbyAppointmentID(app.AppointmentsID);
        //ev.Tel = app.Tel;



        return null;
    }

    public class Events
    {
        public string id;
        //   public string resourceId;
        public string start;
        public string end;
        public string title;
        public string Tel;
    }

}