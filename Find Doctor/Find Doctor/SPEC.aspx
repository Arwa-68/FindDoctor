<%@ Page Title="" Language="C#" MasterPageFile="~/FindDoctorMasterPage.master" AutoEventWireup="true" CodeFile="SPEC.aspx.cs" Inherits="SPEC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- Breadcrumbs -->
		<div class="breadcrumbs overlay">
			<div class="container">
				<div class="bread-inner">
					<div class="row">
						<div class="col-12">
							<h2>Hosptials</h2>
							<ul class="bread-list">
								<li><a href="Default.aspx#">Home</a></li>
								<li><i class="icofont-simple-right"></i></li>
								<li class="active">Clinics </li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
		
		<!-- Single News -->
	<section class="news-single section">
			<div class="container">

                <asp:Repeater runat="server" ID="citiesrep" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="row">
                    <div class="col-lg-8 col-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="single-main">
                                    <!-- News Head -->
                                    <div class="news-head">
                                        <img runat="server" src='<%# "~/Upload/Hospitals/" + Eval("Image") %>' style="width: 100%;" alt="#">
                                    </div>
                                    <!-- News Title -->
                                    <h1 class="news-title"><a href='<%# "Doctorsdata.aspx?HOSPID=" + Eval("HospitalID") + "&SPECID=" + Eval("SpecialistID") %>'><%# Eval("SpecialistName") %></a></h1>
                                    <!-- Meta -->

                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="main-sidebar">
                            <!-- Single Widget -->
                            <div class="single-widget search">
                                <div class="form">
   <%# Eval("Location") %>   
                                </div>
                            </div>
                            <!--/ End Single Widget -->

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>



        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT Hosptials.Location,Hosptials.Image, Specialists.SpecialistID, Specialists.SpecialistName, Hosptials.HospitalName, Hosptials.HospitalID FROM Doctors INNER JOIN Specialists ON Doctors.DoctorSpecialisID = Specialists.SpecialistID INNER JOIN Hosptials ON Doctors.HospialID = Hosptials.HospitalID WHERE (Hosptials.HospitalID = @HospitalID)">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="HOSPID" DefaultValue="0" Name="HospitalID"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
		</section>
		<!--/ End Single News -->
</asp:Content>

