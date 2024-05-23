<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalhistoryMasterPage.master" AutoEventWireup="true" CodeFile="SpecForm.aspx.cs" Inherits="Manage_SubjectsForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


     <div class="row">
        <div class="col-md-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb pl-0">
              <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Home</a></li>
              <li class="breadcrumb-item"><a href="#">Specialist</a></li>
              <li class="breadcrumb-item active" aria-current="page">Specialist List</li>
            </ol>
          </nav>
        </div>

        <div class="col-xl-12 col-md-12">
          <div class="ms-panel">
            <div class="ms-panel-header ms-panel-custome">
              <h6>Specialist List</h6>
              <a href="AddSpec.aspx" class="ms-text-primary  ">Add Specialist</a>
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
                           <MasterTableView CommandItemDisplay="Top" DataKeyNames="SpecialistID" DataSourceID="SqlCashDataSource">
                               <CommandItemSettings ExportToPdfText="Export to PDF" AddNewRecordText="" ShowAddNewRecordButton="false"></CommandItemSettings>
                               <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                               </RowIndicatorColumn>
                               <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                               </ExpandCollapseColumn>
                               <Columns>
                                   <telerik:GridBoundColumn DataField="SpecialistID" Visible="false" ReadOnly="True" HeaderText="SpecialistID" SortExpression="SpecialistID" UniqueName="SpecialistID" DataType="System.Int32" FilterControlAltText="Filter SpecialistID column"></telerik:GridBoundColumn>
                                   <telerik:GridBoundColumn DataField="SpecialistName" HeaderText="SpecialistName" SortExpression="SpecialistName" UniqueName="SpecialistName" FilterControlAltText="Filter SpecialistName column"></telerik:GridBoundColumn>   
                                         
                                   
                                    <telerik:GridButtonColumn   ConfirmDialogType="Classic"  HeaderStyle-Width="50" 
                    ConfirmTitle="Delete" ButtonType="ImageButton"  CommandName="DeleteData" 
                    Text="Delete"  ImageUrl="~/imges/DeleteRed.png"
                    UniqueName="DeleteColumn" ConfirmText='are you Sure ?'  
                    ConfirmDialogHeight="150px" meta:resourcekey="GridButtonColumnResource1">
                   
                    
                </telerik:GridButtonColumn>

                

 <telerik:GridButtonColumn   UniqueName="EditCommandColumn"  ButtonType="ImageButton" HeaderStyle-Width="50"
      CommandName="Select" ImageUrl="~/imges/edit.png" 
                    meta:resourcekey="GridButtonColumnResource2" >
       
      
    </telerik:GridButtonColumn>   
                                   
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
                          SelectCommand="SELECT [SpecialistID], [SpecialistName] FROM [Specialists]"></asp:SqlDataSource>



                  </div>

                </div>


              

               
               
              </form>

            </div>
          </div>
        </div>
      </div>

   
</asp:Content>


