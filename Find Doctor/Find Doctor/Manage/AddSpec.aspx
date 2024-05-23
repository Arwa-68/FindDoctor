<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalhistoryMasterPage.master" AutoEventWireup="true" CodeFile="AddSpec.aspx.cs" Inherits="Manage_AddSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="row">
        <div class="col-md-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb pl-0">
              <li class="breadcrumb-item"><a href="#"><i class="material-icons">home</i> Home</a></li>
              <li class="breadcrumb-item"><a href="#">Specialist</a></li>
              <li class="breadcrumb-item active" aria-current="page">Add Subject</li>
            </ol>
          </nav>
        </div>

        <div class="col-xl-12 col-md-12">
          <div class="ms-panel">
            <div class="ms-panel-header ms-panel-custome">
              <h6>Add Specialist</h6>
              <a href="SpecForm.aspx" class="ms-text-primary  ">Specialist List</a>
            </div>
            <div class="ms-panel-body">
              <form class="needs-validation" novalidate runat="server">
                <div class="form-row">

                 



                


                     <div class="col-md-12 mb-3">
                    <label for="validationCustom002">Specialist Name</label>
                    <div class="input-group">
                      <asp:TextBox runat="server" class="form-control" ID="SubjectName" placeholder="Specialist Name"  required></asp:TextBox>

                    </div>
                  </div>

                 

                </div>


              

               
                <button onserverclick="Unnamed_ServerClick"   runat="server"  class="btn btn-warning mt-4 d-inline w-20" type="submit" >Cancel</button>
                <asp:Button runat="server" OnClick="Unnamed_Click" Text="Save" class="btn btn-primary mt-4 d-inline w-20" type="submit"></asp:Button>
              </form>

            </div>
          </div>
        </div>
      </div>
</asp:Content>

