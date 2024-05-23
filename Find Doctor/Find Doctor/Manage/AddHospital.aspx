<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalhistoryMasterPage.master" AutoEventWireup="true" CodeFile="AddHospital.aspx.cs" Inherits="Manage_AddHospital" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="row">
        <div class="col-md-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb pl-0">
              <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Home</a></li>
              <li class="breadcrumb-item"><a href="#">Hospital</a></li>
              <li class="breadcrumb-item active" aria-current="page">Add Hospital</li>
            </ol>
          </nav>
        </div>

        <div class="col-xl-12 col-md-12">
          <div class="ms-panel">
            <div class="ms-panel-header ms-panel-custome">
              <h6>Add Hospital</h6>
              <a href="Hospitalsfrm.aspx" class="ms-text-primary  ">Hospital List</a>
            </div>
            <div class="ms-panel-body">
              <form class="needs-validation" novalidate runat="server">
                   <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
                <div class="form-row">

                 

                  <div class="col-md-6 mb-3">
                    <label for="validationCustom002">Hospital Name</label>
                    <div class="input-group">
                      <asp:TextBox runat="server" class="form-control" ID="Departmenttxt" placeholder="Hospital Name"  required></asp:TextBox>

                    </div>
                  </div>

                     <div class="col-md-6 mb-3">
                    <label for="validationCustom002">Mobile Number</label>
                    <div class="input-group">
                      <asp:TextBox runat="server" class="form-control" ID="MobileNumber" placeholder="Mobile Number"  required></asp:TextBox>

                    </div>
                  </div>
                       <div class="col-md-12 mb-3">
                    <label for="validationCustom002">Location</label>
                    <div class="input-group">
                      <asp:TextBox TextMode="MultiLine"  runat="server" class="form-control" ID="Loc" placeholder="Location"  required></asp:TextBox>

                    </div>
                  </div>
                      <div class="col-md-6 mb-3">
                    <label for="validationCustom002">Tel Number</label>
                    <div class="input-group">
                      <asp:TextBox runat="server" class="form-control" ID="TelNumber" placeholder="Tel Number"  required></asp:TextBox>

                    </div>
                  </div>
                      <div class="col-md-6 mb-3">
                    <label for="validationCustom002">City</label>
                    <div class="input-group">
                        <asp:DropDownList AppendDataBoundItems="true" runat="server" class="form-control select" ID="CityID" placeholder="Address" required DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityID">
                            <asp:ListItem Value="" Text="Select City"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT [CityID], [CityName] FROM [Cities]"></asp:SqlDataSource>
                    </div>
                  </div>
                     <div class="col-md-12 mb-3">
                    <label for="validationCustom002">File Upload</label>
                    <div class="input-group">
                     <telerik:RadAsyncUpload ID="Upload1" runat="server"   HideFileInput="true" class="dropify" data-show-loader="true"
                            Skin="Telerik" PostbackTriggers="savebtn"
                            MultipleFileSelection="Disabled"
                            OnClientFileUploadFailed="onUploadFailed" OnClientFileSelected="onFileSelected"
                            OnClientFileUploaded="onFileUploaded" TemporaryFolder="~/RadUploadTemp" 
                            Width="100px" />   

                    </div>
                  </div>
                    <div class="col-md-12 mb-3">
                    <label for="validationCustom002">Address</label>
                    <div class="input-group">
                       <asp:TextBox runat="server" class="form-control" ID="Address" placeholder="Address"  required></asp:TextBox>
                    </div>
                  </div>

                   

                </div>


              

               
                <button onserverclick="Unnamed_ServerClick"   runat="server"  class="btn btn-warning mt-4 d-inline w-20" type="submit" >Cancel</button>
                <asp:Button ID="savebtn" runat="server" OnClick="Unnamed_Click" Text="Save" class="btn btn-primary mt-4 d-inline w-20" type="submit"></asp:Button>
              </form>

            </div>
          </div>
        </div>
      </div>
</asp:Content>

