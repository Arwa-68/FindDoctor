<%@ Page Title="" Language="C#" MasterPageFile="~/FindDoctorMasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- Breadcrumbs -->
		<div class="breadcrumbs overlay">
			<div class="container">
				<div class="bread-inner">
					<div class="row">
						<div class="col-12">
							<h2>Doctor Details</h2>
							<ul class="bread-list">
								<li><a href="Default.aspx#">Home</a></li>
								<li><i class="icofont-simple-right"></i></li>
								<li class="active">Doctor Details</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
<section class="appointment">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>We Are Always Ready to Help You. Register</h2>
                    <img
                        alt="#"
                        loading="lazy"
                        width="48"
                        height="24"
                        decoding="async"
                        data-nimg="1"
                        src="img/section-img.png"
                        style="color: transparent;"
                    />
                  <%--  <p>Lorem ipsum dolor sit amet consectetur adipiscing elit praesent aliquet. pretiumts</p>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-12 col-12">
                <form runat="server" class="form" action="#">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="form-group"><asp:TextBox runat="server" ID="pname" placeholder="Name" type="text" name="name" required /></div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="form-group"><asp:TextBox ID="Pmobile" runat="server" placeholder="Mobile"  /></div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="form-group"><asp:TextBox ID="userName" runat="server" placeholder="User Name" type="text" name="userName" required></asp:TextBox></div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="form-group"><asp:TextBox ID="Password" runat="server" placeholder="User Name" TextMode="Password" name="Password" required></asp:TextBox></div>
                        </div>
                       
                    </div>
                    <div class="row">
                        <div class="col-lg-5 col-md-4 col-12">
                            <div class="form-group">
                                <div class="button"><asp:Button BackColor="#1A76D1" ForeColor="White" runat="server" type="submit" CssClass="btn" OnClick="Unnamed_ServerClick" Text="Register" /></div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-8 col-12"><p><asp:Label runat="server" ForeColor="Red" ID="MessageBox"></asp:Label></p></div>
                    </div>
                </form>
            </div>
            <div class="col-lg-6 col-md-12">
                <div class="appointment-image">
                    <img
                        alt="#"
                        loading="lazy"
                        width="522"
                        height="523"
                        decoding="async"
                        data-nimg="1"
                        src="img/contact-img.png"
                        style="color: transparent;"
                    />
                </div>
            </div>
        </div>
    </div>
</section>


</asp:Content>

