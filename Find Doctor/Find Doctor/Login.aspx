<%@ Page Title="" Language="C#" MasterPageFile="~/LognDB.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">

                         <asp:Login ID="LoginUser" runat="server" EnableViewState="false"   TextBoxStyle-CssClass="login-inp"
    RenderOuterTable="false" OnLoggingIn="LoginUser_LoggingIn">
        <LayoutTemplate>

              <div class="limiter">
        <div class="container-login100" style="background-image: url('Content/Content/login/images/bg-01.jpg');">
          <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
          <%--  <form class="login100-form validate-form" runat="server">--%>
              <span class="login100-form-title p-b-49">
                Login
              </span>
              <div class="wrap-input100 validate-input m-b-23" data-validate="Username is reauired">
                <span class="label-input100">Username</span>
                  <asp:TextBox ID="UserName" runat="server" class="input100"  placeholder="Username" />
                  <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>
              <div class="wrap-input100 validate-input" data-validate="Password is required">
                <span class="label-input100">Password</span>
                 <asp:TextBox ID="Password" TextMode="Password" runat="server" class="input100" placeholder="Password" />
                   <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>
              <div class="text-right p-t-8 p-b-31">
                <a runat="server" href="register.aspx">
                  Create New Account
                </a>
              </div>
              <div class="container-login100-form-btn">
                <div class="wrap-login100-form-btn">
                  <div class="login100-form-bgbtn"></div>
                    <asp:Button style="cursor:pointer;"  BackColor="Black"  class="login100-form-btn" ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup" />
                </div>
              </div>
          </div>
        </div>
      </div>
      <div id="dropDownSelect1"></div>







         
              
                            
                     
           
                   
                            
                   
                   

                   
                           
                            
                      



              </LayoutTemplate>
    </asp:Login>





</asp:Content>
