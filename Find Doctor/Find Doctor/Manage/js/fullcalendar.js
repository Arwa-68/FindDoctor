	
/*---Selectable calendar---*/
var d = new Date();
var CalendarData;
var firstHour = new Date().getUTCHours() - 5;
$(document).ready(function () {

    var DayDateSelected;
    var PAID = $("#MainContent_PID").val();
    var DOCID = $("#MainContent_DID").val();
    $.ajax({
        url: "HotelSystem.svc/GetReservationData?frm=1/1/2000&to=1/1/2000&PatientID=" + PAID + "&DoctorID=" + DOCID, success: function (result2) {
            debugger;
            sources = result2.d;
            $(function () { // document ready
                var newIndex = 5;
                CalendarData =    $('#calendar1').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'list,month,agendaWeek,agendaDay'
                    },
                    allDaySlot: false,
                   // defaultDate: d,
                    defaultView: 'agendaWeek',
                    minTime: "09:00:00",
                    maxTime: "19:30:00",
                    navLinks: true, // can click day/week names to navigate views
                    selectable: true,
                    selectHelper: true,
                    //select: function (start, end) {
                    //    var title = prompt('Event Title:');
                    //    var eventData;
                    //    if (title) {
                    //        eventData = {
                    //            title: title,
                    //            start: start,
                    //            end: end
                    //        };
                    //        $('#calendar1').fullCalendar('renderEvent', eventData, true); // stick? = true
                    //    }
                    //    $('#calendar1').fullCalendar('unselect');
                    //},

                    navLinks: true,
                    navLinkDayClick: function(date, jsEvent) {
                        console.log('day', date.format()); // date is a moment
                        console.log('coords', jsEvent.pageX, jsEvent.pageY);
                        DayDateSelected = date;
                        //$('#calendar1').fullCalendar('changeView', 'agendaDay', date._i)
                        $('#calendar1').fullCalendar('gotoDate', date._i);
                        
                       // $('#calendar1').fullCalendar('changeView', 'agendaDay', date._i);
                    },

                    //dayClick: function(date, jsEvent, view) {

                    //    alert('Clicked on: ' + date.format());

                    //    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

                    //    alert('Current view: ' + view.name);

                    //    // change the day's background color just for fun
                    //    $(this).css('background-color', 'red');

                    //},

                    dateClick: function (date, jsEvent, view) {

                        alert('Clicked on: ' + date.format());

                        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

                        alert('Current view: ' + view.name);

                        // change the day's background color just for fun
                        $(this).css('background-color', 'red');

                    },
                    select: function (start, end, allDay, event, resourceId) {
                        debugger;
                        var title = ""
                        var eventData;
                        newIndex++;
                        eventData = {
                            id: 0,
                            resourceId: "",
                            title: title,
                            start: start,
                            end: end
                        };
                        //$('#calendar1').fullCalendar('renderEvent', eventData, true); // stick? = true
                        //$('#calendar1').fullCalendar('unselect');
                        //$("#roomNumber").html(resourceId.title);
                        //$("#start").val(formatMMDDYYYY(start._d));
                        //$("#end").val(formatMMDDYYYY(start._d.addDays(1)));
                        //$("#timestart").val("12:00");
                        //$("#timeend").val("13:00");
                        //$("#ctl00_title").val(eventData.title);
                        //$("#end").focus();

                        $(function () {
                            $("#dialog-confirm").find('.modal-body').html("    ");
                            $("#dialog-confirm").modal('show').find('.modal-body').load("LoadData.aspx?AppID=" + eventData.id + "&dte=" + formatDDMMYYYY(eventData.start._d) + "&tim=" + eventData.start.hour() + ":" + eventData.start.minute() + (eventData.start.minute().toString().length==2?"":"0"));

                            //    .dialog({
                            //    resizable: false,
                            //    height: 300,
                            //    width: 500,
                            //    modal: true,
                            //    buttons: {
                            //        "Ok": function () {

                            //            $(this).dialog("close");
                            //            AddEventdata(eventData);
                            //        },
                            //        Cancel: function () {
                            //            $(this).dialog("close");
                            //        }
                            //    }
                            //});
                        });


                        // refreshcalendar();
                        // $('#calendar').fullCalendar('unselect');
                    },
                    eventRender: function (info, element) {
                        element.find('.fc-title').html("<span style='font-size:1.5em !important'>" + element.find('.fc-title').text().replace('واكس', "<span style='color:red;'>واكس</span>").replace('بدكير - منكير', "<span style='color:red;'>بدكير - منكير</span>").replace('وجه', "<span style='color:red;'>وجه</span>").replace('تنظيف بشرة', "<span style='color:red;'>تنظيف بشرة</span>") + "</span>");
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        debugger;
                        //alert('Event: ' + calEvent.title);
                        //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                        //alert('View: ' + view.name);

                        // change the border color just for fun
                        //var eventData;
                        //eventData = {
                        //    id: calEvent.id,
                        //    resourceId: calEvent.resourceId,
                        //    title: calEvent.title,
                        //    start: calEvent.start,
                        //    end: calEvent.end
                        //};
                        DisplayEventData(calEvent);
                        $(function () {
                            $("#dialog-confirm").find('.modal-body').html("    ");
                            $("#dialog-confirm").modal('show').find('.modal-body').load("LoadData.aspx?AppID=" + calEvent.id + "&dte=" + formatDDMMYYYY(calEvent.start._d) + "&tim=" + calEvent.start.hour() + ":" + calEvent.start.minute() + (calEvent.start.minute().toString().length == 2 ? "" : "0"));

                            //    .dialog({
                            //    //resizable: false,
                            //    //height: 300,
                            //    //width: 300,
                            //    //modal: true,
                            //    position: 'bottom' ,
                            //    buttons: {
                            //        "Ok": function () {

                            //            $(this).dialog("close");
                            //            AddEventdata(calEvent);
                            //        },
                            //        Cancel: function () {
                            //            $(this).dialog("close");
                            //        }
                            //    }
                            //});

                            //$("#dialog-confirm").position({
                            //    my: "center",
                            //    at: "center",
                            //    of: window
                            //});
                        });


                    },
                        eventDrop: function (event, delta, revertFunc) {
                            debugger;
                            //alert(event.title + " was dropped on " + event.start.format());

                            //if (!confirm("Are you sure about this change?")) {
                            //  //  revertFunc();
                            //}
                            //var eventData;
                            //eventData = {
                            //    id: event.id,
                            //    resourceId: event.resourceId,
                            //    title: event.title,
                            //    start: event.start,
                            //    end: event.end
                            //};
                            //DisplayEventData(event);
                            $.ajax({
                                url: "HotelSystem.svc/UpdateReservation?AppointID=" + event.id + "&Dte=" + formatMMDDYYYY(event.start._d) + "&Tim=" + event.start.hour() + ":" + event.start.minute() + (event.start.minute().toString().length == 2 ? "" : "0"), success: function (result3) {
                                    debugger;
                                    DATA = result3.d;
                                    $('#calendar1').fullCalendar('updateEvent', DATA);
                                    if (event.id == "0")
                                        $('#calendar1').fullCalendar('renderEvent', DATA, true); // stick? = true
                                    else
                                        $('#calendar1').fullCalendar('updateEvent', DATA);
                                }
                            });

                        },
                    editable: false,
                    eventLimit: true, // allow "more" link when too many events
                    //dayRender: function (date, cell) {
                    //    debugger;
                    //    if (date < d) {
                    //        debugger
                    //        $(cell).addClass('disabled');
                    //    }
                    //},
                    viewRender: function (view) {
                        //if (view.start < d) {
                        //    $('#calendar1').fullCalendar('gotoDate', d);
                        //}
                        var frm;
                        var to
                        if (view.name != "agendaDay") {
                            frm = formatMMDDYYYY(view.start._d)
                            to = formatMMDDYYYY(view.end._d)
                        } else {
                            frm = formatMMDDYYYY(DayDateSelected._d)
                            to = formatMMDDYYYY(DayDateSelected._d)
                        }
                        $.ajax({
                            url: "HotelSystem.svc/GetReservationData?frm=" + frm + "&to=" + to + "&PatientID=" + PAID + "&DoctorID=" + DOCID, success: function (result2) {
                                debugger;
                                $('#calendar1').fullCalendar('removeEventSource', sources)
                                  //   .fullCalendar('refetchEvents');;
                                $('#calendar1').fullCalendar('addEventSource', result2.d)
                                //.fullCalendar('refetchEvents');;
                                sources = result2.d;
                            }
                        });
                    },

                    events: sources
                });
            });

        }
    });

 
});
  
  // list type
  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'listDay,listWeek,month'
      },

      // customize the button names,
      // otherwise they'd all just say "list"
      views: {
        listDay: { buttonText: 'list day' },
        listWeek: { buttonText: 'list week' }
      },

      defaultView: 'listWeek',
      defaultDate: '2019-5-12',
      start: '09:30',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2019-5-01'
        },
        {
          title: 'Long Event',
          start: '2019-5-07',
          end: '2019-5-5'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2019-5-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2019-5-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2019-5-11',
          end: '2019-5-13'
        },
        {
          title: 'Meeting',
          start: '2019-5-12T5:30:00',
          end: '2019-08-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2019-5-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2019-5-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2019-5-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2019-5-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2019-5-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2019-5-28'
        }
      ]
    });

  });

  function DisplayEventData(event) {
      debugger;
      $("#start").val(formatMMDDYYYY(event.start._d))
     // $("#end").val(formatMMDDYYYY(event.start._d))
      $("#timestart").val(event.start.hour() + ":" + event.start.minute() + (event.start.minute().toString().length == 2 ? "" : "0"))
     // $("#timeend").val(event.end._i.substr(11, 5))
      $("#ctl00_title").val(event.title);
      $("#ctl00_Tel").val(event.Tel);
     // $("#resType").val(event.color);
  }

  function SqlTime(dte) {
      var dd = dte.getDate();
      var mm = dte.getMonth() + 1;
      var yyyy = dte.getFullYear();

      if (dd < 10) {
          dd = '0' + dd
      }

      if (mm < 10) {
          mm = '0' + mm
      }

      return dte.toLocaleTimeString();
  }
  function SqlDateTime(dte) {
      var dd = dte.getDate();
      var mm = dte.getMonth() + 1;
      var yyyy = dte.getFullYear();

      if (dd < 10) {
          dd = '0' + dd
      }

      if (mm < 10) {
          mm = '0' + mm
      }

      return yyyy + '-' + mm + '-' + dd + ' ' + dte.toLocaleTimeString();
  }

  function formatDMY(dte) {
      var dd = dte.getDate();
      var mm = dte.getMonth() + 1;
      var yyyy = dte.getFullYear();

      return ((dd > 9) ? dd : '0' + dd) + '/' + ((mm > 9) ? mm : '0' + mm) + '/' + yyyy;
  }

  function formatDDMMYYYY(dte) {
      var dd = dte.getDate();
      var mm = dte.getMonth() + 1;
      var yyyy = dte.getFullYear();

      if (dd < 10) {
          dd = '0' + dd
      }

      if (mm < 10) {
          mm = '0' + mm
      }

      return dd + '/' + mm + '/' + yyyy;
  }

  function formatMMDDYYYY(dte) {
      var dd = dte.getDate();
      var mm = dte.getMonth() + 1;
      var yyyy = dte.getFullYear();

      if (dd < 10) {
          dd = '0' + dd
      }

      if (mm < 10) {
          mm = '0' + mm
      }

      return mm + '/' + dd + '/' + yyyy;
  }


  function formatYYYYMMDD(dte) {
      var dd = dte.getDate();
      var mm = dte.getMonth() + 1;
      var yyyy = dte.getFullYear();

      if (dd < 10) {
          dd = '0' + dd
      }

      if (mm < 10) {
          mm = '0' + mm
      }

      return yyyy + '-' + mm + '-' + dd;
  }

  //function formatDDMMYYYY(dte) {
  //    var dd = dte.getDate();
  //    var mm = dte.getMonth() + 1;
  //    var yyyy = dte.getFullYear();

  //    if (dd < 10) {
  //        dd = '0' + dd
  //    }

  //    if (mm < 10) {
  //        mm = '0' + mm
  //    }

  //    return dd + '-' + mm + '-' + yyyy;
  //}


  function ConvertToDate(input) {

      var out = "";
      out = input.substring(6, 10) + "/" + input.substring(3, 5) + "/" + input.substring(0, 2);
      var myDate = new Date(out);
      return myDate;
  }

  function convertDate(inputFormat) {
      function pad(s) { return (s < 10) ? '0' + s : s; }
      var d = new Date(inputFormat);
      return [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('/');
  }

  Date.prototype.addDays = function (days) {
      var dat = new Date(this.valueOf());
      dat.setDate(dat.getDate() + days);
      return dat;
  }

  function formatAMPM(date) {
      var hours = date.getHours();
      var minutes = date.getMinutes();
      //var ampm = hours >= 12 ? 'PM' : 'AM';
      //hours = hours % 12;
      //hours = hours ? hours : 12; // the hour '0' should be '12'
      minutes = minutes < 10 ? '0' + minutes : minutes;
      var strTime = hours + ':' + minutes;//+ ' ' + ampm;
      return strTime;
  }