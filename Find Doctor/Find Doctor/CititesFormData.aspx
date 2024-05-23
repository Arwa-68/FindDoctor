<%@ Page ValidateRequest="false" Title="" Language="C#" MasterPageFile="~/FindDoctorMasterPage.master" AutoEventWireup="true" CodeFile="CititesFormData.aspx.cs" Inherits="CititesFormData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- Breadcrumbs -->
		<div class="breadcrumbs overlay">
			<div class="container">
				<div class="bread-inner">
					<div class="row">
						<div class="col-12">
							<h2>Cities</h2>
							<ul class="bread-list">
								<li><a href="Default.aspx#">Home</a></li>
								<li><i class="icofont-simple-right"></i></li>
								<li class="active">Cities </li>
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
                                        <img runat="server" src='<%# "~/Upload/Cities/" + Eval("Image") %>' style="width: 100%;" alt="#">
                                    </div>
                                    <!-- News Title -->
                                    <h1 class="news-title"><a href='Hosptials.aspx?CITID=<%# Eval("CityID") %>'><%# Eval("CityName") %></a></h1>
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



        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FindDoctorConnectionString %>' SelectCommand="SELECT [CityID], [CityName], [Image], Location FROM [Cities]"></asp:SqlDataSource>
    </div>
		</section>
		<!--/ End Single News -->
</asp:Content>

