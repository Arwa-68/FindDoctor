<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalhistoryMasterPage.master" AutoEventWireup="true" CodeFile="Visits.aspx.cs" Inherits="Manage_Visits" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


     <div class="row">
        <div class="col-md-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb pl-0">
              <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Home</a></li>
              <li class="breadcrumb-item"><a href="#">Patient</a></li>
              <li class="breadcrumb-item active" aria-current="page">Patients List</li>
            </ol>
          </nav>
        </div>

        <div class="col-xl-12 col-md-12">
          <div class="ms-panel">
            <div class="ms-panel-header ms-panel-custome">
              <h6>Patients List</h6>
              <%--<a href="AddDoctor.aspx" class="ms-text-primary  ">Add Doctor</a>--%>
            </div>
            <div class="ms-panel-body">
              <form class="needs-validation" novalidate runat="server">
                  <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
                <div class="form-row">

                 <telerik:RadDatePicker AutoPostBack="true" OnSelectedDateChanged="dttime_SelectedDateChanged" DateInput-Culture="en-US"  Calendar-CultureInfo="en-US" ID="dttime" Width="100%" runat="server" DateInput-DateFormat="MM/dd/yyyy" DateInput-DisplayDateFormat="MM/dd/yyyy">
    <Calendar CultureInfo="en-US" runat="server">
        
    </Calendar>
  
</telerik:RadDatePicker>

                  <div class="col-md-12 mb-3">
            
                       <telerik:RadGrid ID="ServicesData" runat="server"
                                   AllowPaging="True" AllowSorting="True" CellSpacing="0" GridLines="None" 
                                   AutoGenerateColumns="False"
                                   OnItemCommand="ServicesData_ItemCommand" OnSelectedIndexChanged="ServicesData_SelectedIndexChanged"
                                   meta:resourcekey="RadGrid1Resource1" DataSourceID="SqlCashDataSource" Skin="Vista">
                           <MasterTableView CommandItemDisplay="Top" DataKeyNames="BookingID" DataSourceID="SqlCashDataSource">
                               <CommandItemSettings ExportToPdfText="Export to PDF" AddNewRecordText="" ShowAddNewRecordButton="false"></CommandItemSettings>
                               <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                               </RowIndicatorColumn>
                               <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                               </ExpandCollapseColumn>
                               <Columns>
                                   <telerik:GridBoundColumn  DataField="PatientName" HeaderText="Patient Name" SortExpression="PatientName" UniqueName="PatientName" FilterControlAltText="Filter PatientName column"></telerik:GridBoundColumn>
                                   <telerik:GridBoundColumn Visible="false" DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID" UniqueName="BookingID" FilterControlAltText="Filter BookingID column" DataType="System.Int32" ReadOnly="True"></telerik:GridBoundColumn>
                                   <telerik:GridBoundColumn DataField="BookingDate" HeaderText="Booking Date" SortExpression="BookingDate" UniqueName="BookingDate" DataType="System.DateTime" FilterControlAltText="Filter BookingDate column"></telerik:GridBoundColumn>
                                   <telerik:GridBoundColumn DataField="HospitalName" HeaderText="Hospital Name" SortExpression="HospitalName" UniqueName="HospitalName" FilterControlAltText="Filter HospitalName column"></telerik:GridBoundColumn>
                               <telerik:GridTemplateColumn>
                                       <ItemTemplate>
                                           <asp:Button runat="server" Text="Send Mail" CommandName="Visit" CommandArgument='<%# Eval("BookingID") %>' />
                                       </ItemTemplate>
                                   </telerik:GridTemplateColumn>
                               
                               </Columns>

                                       <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
            <FilterMenu EnableImageSprites="false">
            </FilterMenu>
            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </telerik:RadGrid>


                      <asp:SqlDataSource ID="SqlCashDataSource" runat="server"
                          ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>'
                          SelectCommand="SELECT Patients.PatientName, Bookings.BookingID, Bookings.BookingDate, Hosptials.HospitalName FROM Patients INNER JOIN Bookings ON Patients.PatientID = Bookings.PatientID INNER JOIN Hosptials ON Bookings.HospitalID = Hosptials.HospitalID WHERE (CAST(Bookings.BookingDate AS Date) = @date)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="dttime" PropertyName="SelectedDate" Name="date"></asp:ControlParameter>

                          </SelectParameters>
                      </asp:SqlDataSource>



                  </div>

                </div>


              

               
               
              </form>

            </div>
          </div>
        </div>
      </div>

   
</asp:Content>

