<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalhistoryMasterPage.master" AutoEventWireup="true" CodeFile="Patientsfrm.aspx.cs" Inherits="Manage_Patientsfrm" %>
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

                 

                  <div class="col-md-12 mb-3">
            
                       <telerik:RadGrid ID="ServicesData" runat="server"
                                   AllowPaging="True" AllowSorting="True" CellSpacing="0" GridLines="None" 
                                   AutoGenerateColumns="False"
                                   OnItemCommand="ServicesData_ItemCommand" OnSelectedIndexChanged="ServicesData_SelectedIndexChanged"
                                   meta:resourcekey="RadGrid1Resource1" DataSourceID="SqlCashDataSource" Skin="Vista">
                           <MasterTableView CommandItemDisplay="Top" DataKeyNames="PatientID" DataSourceID="SqlCashDataSource">
                               <CommandItemSettings ExportToPdfText="Export to PDF" AddNewRecordText="" ShowAddNewRecordButton="false"></CommandItemSettings>
                               <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                               </RowIndicatorColumn>
                               <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                               </ExpandCollapseColumn>
                               <Columns>
                                   <telerik:GridBoundColumn Visible="false" DataField="PatientID" ReadOnly="True" HeaderText="PatientID" SortExpression="PatientID" UniqueName="PatientID" DataType="System.Int32" FilterControlAltText="Filter PatientID column"></telerik:GridBoundColumn>
                                   <telerik:GridBoundColumn DataField="PatientName" HeaderText="Patient Name" SortExpression="PatientName" UniqueName="PatientName" FilterControlAltText="Filter PatientName column"></telerik:GridBoundColumn>
                                   <telerik:GridBoundColumn DataField="BirthDate" HeaderText="Birth Date" SortExpression="BirthDate" UniqueName="BirthDate" DataType="System.DateTime" FilterControlAltText="Filter BirthDate column"></telerik:GridBoundColumn>
                                   <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" UniqueName="Mobile" FilterControlAltText="Filter Mobile column"></telerik:GridBoundColumn>
                                   <telerik:GridTemplateColumn>
                                       <ItemTemplate>
                                           <asp:Button runat="server" Text="Lock Account" CommandName="Lock" CommandArgument='<%# Eval("PatientID") %>' />
                                       </ItemTemplate>
                                   </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn>
                                       <ItemTemplate>
                                           <asp:Button runat="server" Text="UnLock Account" CommandName="UnLock" CommandArgument='<%# Eval("PatientID") %>' />
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
                          SelectCommand="SELECT [PatientID], [PatientName], [BirthDate], [Mobile] FROM [Patients]"></asp:SqlDataSource>



                  </div>

                </div>


              

               
               
              </form>

            </div>
          </div>
        </div>
      </div>

   
</asp:Content>

