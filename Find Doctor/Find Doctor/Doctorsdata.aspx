<%@ Page Title="" Language="C#" MasterPageFile="~/FindDoctorMasterPage.master" AutoEventWireup="true" CodeFile="Doctorsdata.aspx.cs" Inherits="Doctorsdata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="breadcrumbs overlay">
<div class="container">
<div class="bread-inner">
<div class="row">
<div class="col-12">
<h2>Meet Our Qualified Doctors</h2>
<ul class="bread-list">
<li><a href="Default.aspx">Home</a></li>
<li><i class="icofont-simple-right"></i></li>
<li class="active">Doctors</li>
</ul>
</div>
</div>
</div>
</div>
</div>

    <section id="team" class="team section single-page">
<div class="container">
<div class="row">


    <asp:Repeater runat="server" ID="repeaterDoctors" DataSourceID="SqlDataSource1">
        <ItemTemplate>
          <div class="col-lg-4 col-md-6 col-12">

<div class="single-team">
<div class="t-head">
<img runat="server" src='<%# "~/Upload/Doctors/" + Eval("Image") %>' alt="#">
<div class="t-icon">
<a href='appointmentData.aspx?ID=<%# Eval("DoctorID")  %>' class="btn">Get Appointment</a>
</div>
</div>
<div class="t-bottom">
<p><%# Eval("SpecialistName") %></p>
<h2><a href='doctordetails.aspx?ID=<%# Eval("DoctorID")  %>'><%# Eval("DoctorName") %></a></h2>
</div>
</div>

</div>
</ItemTemplate>
    </asp:Repeater>

        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT Doctors.DoctorID, Doctors.DoctorName, Doctors.Image, Specialists.SpecialistName FROM Doctors INNER JOIN Specialists ON Doctors.DoctorSpecialisID = Specialists.SpecialistID WHERE (Doctors.HospialID = @HospialID) AND (Doctors.DoctorSpecialisID = @DoctorSpecialisID)">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="HOSPID" DefaultValue="0" Name="HospialID" Type="Int32"></asp:QueryStringParameter>
                <asp:QueryStringParameter QueryStringField="SPECID" DefaultValue="0" Name="DoctorSpecialisID" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>
      

</div>
</div>
</section>

</asp:Content>

