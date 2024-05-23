<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalhistoryMasterPage.master" AutoEventWireup="true" CodeFile="bookingfrm.aspx.cs" Inherits="Manage_bookingfrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="row">
        <div class="col-md-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb pl-0">
              <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Home</a></li>
              <li class="breadcrumb-item"><a href="#">Booking</a></li>
              <li class="breadcrumb-item active" aria-current="page">Booking</li>
            </ol>
          </nav>
        </div>

        <div class="col-xl-12 col-md-12">
          <div class="ms-panel">
            <div class="ms-panel-header ms-panel-custome">
              <%--<h6>Add Specialist</h6>
              <a href="SpecForm.aspx" class="ms-text-primary  ">Specialist List</a>--%>
            </div>
            <div class="ms-panel-body">
              <form class="needs-validation" novalidate runat="server">
                <div class="form-row">

                 



                


                     <div class="col-md-4 mb-3">
                    <label for="validationCustom002">Doctor Name</label>
                    <div class="input-group">
                        <asp:DropDownList runat="server" class="form-control" ID="DoctorCMB" required DataSourceID="SqlDataSource1" DataTextField="DoctorName" DataValueField="DoctorID"></asp:DropDownList>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT [DoctorID], [DoctorName] FROM [Doctors]"></asp:SqlDataSource>
                    </div>
                  </div>

                  <div class="col-md-12 mb-3">
          
                    <div class="input-group">
                        <div id='calendar1'></div>
                    </div>
                  </div>

                </div>


              

               
               
              </form>

            </div>
          </div>
        </div>
      </div>
</asp:Content>

