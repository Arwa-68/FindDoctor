<%@ Page Title="" Language="C#" MasterPageFile="~/FindDoctorMasterPage.master" AutoEventWireup="true" CodeFile="appointmentData.aspx.cs" Inherits="appointmentData" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

     <!-- Breadcrumbs -->
		<div class="breadcrumbs overlay">
			<div class="container">
				<div class="bread-inner">
					<div class="row">
						<div class="col-12">
							<h2>Get Your Appointment</h2>
							<ul class="bread-list">
								<li><a href="Default.aspx#">Home</a></li>
								<li><i class="icofont-simple-right"></i></li>
								<li class="active">Appointment</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->

    
    <section class="appointment single-page">
<div class="container">
<div class="row">
    <asp:MultiView ID="MV" runat="server" ActiveViewIndex="0">
        <asp:View runat="server">
            <div class="col-lg-7 col-md-12 col-12">
<div class="appointment-inner">
<div class="title">
<h3>Book your appointment</h3>
<p>We will confirm your appointment within 2 hours</p>
</div>
<form runat="server" class="form" action="#">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
<div class="row">
<div class="col-lg-6 col-md-6 col-12">
<div class="form-group">
    <label>Patient Name</label>
<asp:Label ID="username" runat="server"></asp:Label>
</div>
</div>
<div class="col-lg-6 col-md-6 col-12">
<div class="form-group">
     <label>Patient Tel</label>
<asp:Label runat="server" ID="Tel"></asp:Label>
</div>
</div>
    <div class="col-lg-12 col-md-12 col-12">
<div class="form-group">
     <label>Email</label>
<asp:TextBox CssClass="form-control" TextMode="Email" runat="server" ID="email"></asp:TextBox>
</div>
</div>
<div class="col-lg-6 col-md-6 col-12">
<div class="form-group">
<label>City</label>
<asp:DropDownList runat="server" ID="cityCMB" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityID" AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT [CityID], [CityName] FROM [Cities]"></asp:SqlDataSource>
    </div>
</div>
    <div class="col-lg-6 col-md-6 col-12">
<div class="form-group">
<label>Hospital</label>
<asp:DropDownList runat="server" ID="HosptalIDCMB" DataSourceID="SqlDataSource2" DataTextField="HospitalName" DataValueField="HospitalID" AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT [HospitalID], [HospitalName] FROM [Hosptials] WHERE ([CityID] = @CityID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cityCMB" PropertyName="SelectedValue" DefaultValue="0" Name="CityID" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</div>

     <div class="col-lg-6 col-md-6 col-12">
<div class="form-group">
<label>Specialist</label>
<asp:DropDownList runat="server" ID="SpecialistIDCMB" DataSourceID="SqlDataSource3" DataTextField="SpecialistName" DataValueField="SpecialistID" AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT Specialists.SpecialistName, Specialists.SpecialistID FROM Specialists INNER JOIN Doctors ON Specialists.SpecialistID = Doctors.DoctorSpecialisID INNER JOIN Hosptials ON Doctors.HospialID = Hosptials.HospitalID WHERE (Hosptials.HospitalID = @HospitalID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HosptalIDCMB" PropertyName="SelectedValue" DefaultValue="" Name="HospitalID"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</div>

     <div class="col-lg-6 col-md-6 col-12">
<div class="form-group">
<label>Doctor</label>
<asp:DropDownList runat="server" ID="DropDownList1" DataSourceID="SqlDataSource4" DataTextField="DoctorName" DataValueField="DoctorID" AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT Doctors.DoctorID, Doctors.DoctorName FROM Specialists INNER JOIN Doctors ON Specialists.SpecialistID = Doctors.DoctorSpecialisID INNER JOIN Hosptials ON Doctors.HospialID = Hosptials.HospitalID WHERE (Hosptials.HospitalID = @HospitalID) AND (Specialists.SpecialistID = @SpecialistID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HosptalIDCMB" PropertyName="SelectedValue" DefaultValue="" Name="HospitalID"></asp:ControlParameter>
                <asp:ControlParameter ControlID="SpecialistIDCMB" PropertyName="SelectedValue" Name="SpecialistID"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</div>


<div class="col-lg-6 col-md-6 col-12">
<div class="form-group">
<telerik:RadDatePicker AutoPostBack="true" OnSelectedDateChanged="dttime_SelectedDateChanged" DateInput-Culture="en-US"  Calendar-CultureInfo="en-US" ID="dttime" Width="100%" runat="server" DateInput-DateFormat="MM/dd/yyyy" DateInput-DisplayDateFormat="MM/dd/yyyy">
    <Calendar CultureInfo="en-US" runat="server">
        
    </Calendar>
  
</telerik:RadDatePicker>
</div>
</div>
<div class="col-lg-6 col-md-6 col-12">
<div class="form-group">
    <asp:DropDownList runat="server" AppendDataBoundItems="true" class="custom-select" ID="hidTime" DataSourceID="SqlDataSource5" DataTextField="time" DataValueField="tmvalue" OnDataBinding="hidTime_DataBinding"  data-error="Saat - الساعة">
                    <asp:ListItem Value="0">Select Time</asp:ListItem>
                </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="GetHours3" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DbType="String" Name="dte"></asp:Parameter>
                            <asp:Parameter Name="CurrentDteTime" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
    </div>
    </div>

<div class="col-lg-12 col-md-12 col-12">
<div class="form-group">
<textarea name="message" placeholder="Write Your Message Here....."></textarea>
</div>
</div>
</div>
<div class="row">
<div class="col-12">
<div class="form-group">
<div class="button">
<button runat="server" onserverclick="Unnamed_ServerClick" type="submit" class="btn">Book An Appointment</button>
</div>
</div>
</div>
</div>
</form>
</div>
</div>
        </asp:View>
        <asp:View runat="server">
             <div class="col-lg-7 col-md-12 col-12">
<div class="appointment-inner">
<div class="title">
<h3>Your reservation has been confirmed</h3>


    </div>
    </div></div>
        </asp:View>
    </asp:MultiView>

<div class="col-lg-5 col-md-12 ">
<div class="work-hour">
<h3>Working Hours</h3>
<ul class="time-sidual">
<li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
<li class="day">Saturday <span>9.00-18.30</span></li>
<li class="day">Monday - Thusday <span>9.00-15.00</span></li>
<li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
<li class="day">Saturday <span>9.00-18.30</span></li>
<li class="day">Monday - Thusday <span>9.00-15.00</span></li>
<li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
<li class="day">Saturday <span>9.00-18.30</span></li>
<li class="day">Monday - Thusday <span>9.00-15.00</span></li>
</ul>
</div>
</div>
</div>
</div>
</section>
</asp:Content>

