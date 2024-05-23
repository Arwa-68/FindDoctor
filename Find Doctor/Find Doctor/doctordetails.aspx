<%@ Page Title="" Language="C#" MasterPageFile="~/FindDoctorMasterPage.master" AutoEventWireup="true" CodeFile="doctordetails.aspx.cs" Inherits="doctordetails" %>

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


    <asp:Repeater runat="server" ID="docdetails" DataSourceID="SqlDataSource1">
        <ItemTemplate>




            <div class="doctor-details-area section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="doctor-details-item doctor-details-left">
                                <img runat="server" src='<%# "~/Upload/Doctors/" + Eval("Image") %>' alt="#">
                                <div class="doctor-details-contact">
                                    <h3>Contact info</h3>
                                    <ul class="basic-info">
                                        <li>
                                            <i class="icofont-ui-call"></i>
                                            Call : +<%# Eval("DoctorMobile") %>
</li>
                                        <li>
                                            <i class="icofont-ui-message"></i>
                                            SarahSalem@gmail.com
</li>
                                        <li>
                                            <i class="icofont-location-pin"></i>
                                            <%# Eval("DoctorMobile") %>
</li>
                                    </ul>

                                    <ul class="social">
                                        <li><a href="#"><i class="icofont-facebook"></i></a></li>
                                        <li><a href="#"><i class="icofont-google-plus"></i></a></li>
                                        <li><a href="#"><i class="icofont-twitter"></i></a></li>
                                        <li><a href="#"><i class="icofont-vimeo"></i></a></li>
                                        <li><a href="#"><i class="icofont-pinterest"></i></a></li>
                                    </ul>

                                    <div class="doctor-details-work">
                                        <h3>Working hours</h3>
                                        <ul class="time-sidual">
                                            <li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
                                            <li class="day">Saturday <span>9.00-18.30</span></li>
                                            <li class="day">Monday - Thusday <span>9.00-15.00</span></li>
                                            <li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="doctor-details-item">
                                <div class="doctor-details-right">
                                    <div class="doctor-name">
                                        <h3 class="name">Dr. <%# Eval("DoctorName") %></h3>
                                        <p class="deg"><%# Eval("SpecialistName") %></p>
                                        <p class="degree"><%# Eval("Address") %></p>
                                    </div>
                                    <div class="doctor-details-biography">
                                        <h3>Biography</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
                                        <br>
                                        <p>Risus commodo viverra maecenas accumsan lacus vel facilisis.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
                                    </div>
                                    <div class="doctor-details-biography">
                                        <h3>Education</h3>
                                        <ul>
                                            <li>PHD degree in Neorology at University of Mediserv (2006)</li>
                                            <li>Master of Neoro Surgery at University of Mediserv (2002)</li>
                                            <li>MBBS degree in Neurosciences at University of Mediserv (2002)</li>
                                            <li>Higher Secondary Certificate at Mediserv collage (1991)</li>
                                        </ul>
                                    </div>
                                    <div class="doctor-details-biography">
                                        <h3>Biography</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra</p>
                                        <br>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra</p>
                                        <br>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra eiusmod tempor incididunt ut labore et dolore magna.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT Doctors.DoctorID, Doctors.DoctorName, Doctors.DoctorMobile, Doctors.DoctorTel, Doctors.Image, Specialists.SpecialistName, Hosptials.HospitalName, Hosptials.Address, Hosptials.CityID, Cities.CityName FROM Doctors INNER JOIN Specialists ON Doctors.DoctorSpecialisID = Specialists.SpecialistID INNER JOIN Hosptials ON Doctors.HospialID = Hosptials.HospitalID INNER JOIN Cities ON Hosptials.CityID = Cities.CityID"></asp:SqlDataSource>
</asp:Content>

