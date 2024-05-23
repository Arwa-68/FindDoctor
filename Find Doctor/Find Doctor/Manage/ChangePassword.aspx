<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/MedicalhistoryMasterPage.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="Account_ChangePassword" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">



    

    

    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:ChangePassword ID="ChangeUserPassword" runat="server" 
                    CancelDestinationPageUrl="~/Default.aspx" EnableViewState="false" RenderOuterTable="false" 
         SuccessPageUrl="ChangePasswordSuccess.aspx">
        <ChangePasswordTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="ChangeUserPasswordValidationGroup"/>
            <div class="accountInfo" style="width: 100%">
               
                  <div class="row">
                      <div class="col-lg-4 col-md-12"></div>
							<div class="col-lg-4 col-md-12">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">Change Password</h3>
										<div class="card-options ">
											<a href="#" class="card-options-collapse" data-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a>
											<%--<a href="#" class="card-options-remove" data-toggle="card-remove"><i class="fe fe-x"></i></a>--%>
										</div>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label class="form-label">Old Password</label>

                                            

                                        <asp:TextBox  ID="CurrentPassword" runat="server" CssClass="form-control" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                         
                                         <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                                                                     CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required." 
                                                                     ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                       
                                        </div>
                                  
                                <div class="form-group">
											<label class="form-label">New Password</label>
                                          <asp:TextBox  ID="NewPassword" runat="server" CssClass="form-control" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                   
                                         <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                             CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>

                                     
                                </div>


                                         <div class="form-group">
											<label class="form-label">Confirm Password</label>
                                          <asp:TextBox  ID="ConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                   
                                       <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                             ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>

                                     </div>
                                                


                                <div class="form-group">

                                           <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" 
                         ValidationGroup="ChangeUserPasswordValidationGroup"  class="btn btn-primary pull-left" />
                  
                         <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"  class="btn btn-primary pull-right" />
</div>
                                   
                                      
                
                   </div>
                                    </div></div></div>
                   
                  
                  
                  
                  
                   
            </div>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
    </form>
</asp:Content>