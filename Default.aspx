<%@ Page Title="Online Test | Home" Language="C#" MasterPageFile="~/Index.master"
    AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>Home </li>
                    <!--li class="active">Dashboard</li>-->
                </ul>
                <!--/.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <!-- /.col -->
                    <div class="col-md-12">
                        <div class="body-logo">
                            <img src="assets/images/main-logo.jpg" />
                        </div>
                        <div class="col-md-12">
                            <div class="banner">
                                <div class="col-md-12">
                                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                        <!-- Indicators -->
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item">
                                                <img src="assets/images/banner/banner1.jpg" alt="...">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                            <div class="item active">
                                                <img src="assets/images/banner/banner2.jpg" alt="...">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                            <div class="item">
                                                <img src="assets/images/banner/banner3.jpg" alt="...">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                            <div class="item">
                                                <img src="assets/images/banner/banner4.jpg" alt="...">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">
                                                Previous</span> </a><a class="right carousel-control" href="#carousel-example-generic"
                                                    role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true">
                                                    </span><span class="sr-only">Next</span> </a>
                                    </div>
                                </div>
                                <%--<div class="col-md-4">
                                    <div class=" new-announce">
                                        <h3 class=" title">
                                            New <span class="font-weight-300">Highlights</span></h3>
                                        <div class="list-wrpaaer">
                                            <ul class="list-aggregate" id="marquee-verticle">
                                                <asp:Repeater ID="dl_Notification" runat="server">
                                                    <ItemTemplate>
                                                        <li class="fat-l"><i class="fa fa-check-circle" aria-hidden="true"></i><a href='<%# Eval("Url")%>'>
                                                            <%# Eval("Notification")%></a> <span><i class="fa fa-calendar" aria-hidden="true"></i>
                                                                <%# Eval("NDate")%></span> </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row text-center">
                    <div class="col-md-12">
                        <div class="test">
                            <h1>
                                  Personality Prediction System through CV analysis choose best candidate.</h1>
                            <p>
                                This will enable a more effective way to short list submitted candidate CVs from a large number of applicants providing a consistent and fair CV ranking policy. 
                               </p>
                        </div>
                        <div class="row">
                            
                                    <%--<div class="col-md-3">
                                        <div class="box-item">
                                            
                                                <a href="TakeTest.aspx">
                                                    <div class="img-sec">
                                                        <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                                    <div class="black-bg">
                                                        <div class="title">
                                                            <h3>
                                                                Take Test</h3>
                                                            <p>
                                                                
                                                            </p>
                                                            
                                                        </div>
                                                    </div>
                                                </a>
                                            
                                        </div>
                                    </div>--%>
                             
                            <h4 class="white">
                                <a class="white" href="#"></a>
                            </h4>
                            <div class="nicdark_space10">
                            </div>
                            <div class="nicdark_divider left small">
                                <span class="nicdark_bg_white nicdark_radius"></span>
                            </div>
                            <div class="nicdark_space10">
                            </div>
                            <p class="white">
                            </p>
                            <div class="nicdark_space10">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
