<%@ Page Title="Home" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true"
    CodeFile="Admin_Home.aspx.cs" Inherits="admin_Admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                    </div>
                </div>
                <div class="admin-dashboard">
                    <h2>
                        Admin Section</h2>
                    <div class="dashbord-bg">
                        <div class="row">
                          <%--  <div class="col-sm-3">
                                <a href="Admin_Stream.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-align-justify" aria-hidden="true"></i>
                                        <h3>
                                            Add Category
                                        </h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3 ">
                                <a href="Admin_Subject.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-th-list" aria-hidden="true"></i>
                                        <h3>
                                            Add Subcategory</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="Admin_TestInstruction.aspx">
                                    <div class="tile-name ">
                                        <i class="fa fa-file-text" aria-hidden="true"></i>
                                        <h3>
                                            Add Instructions</h3>
                                    </div>
                                    <div class="view">
                                        <span href="Admin-ContactUs.aspx">View Detail<i class="fa fa-arrow-circle-right"
                                            aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>--%>
                            <%--<div class="col-sm-3 ">
                                <a href="Admin_Category.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-question-circle" aria-hidden="true"></i>
                                        <h3>
                                            Add Question Section</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>--%>
                            <%--<div class="col-sm-3">
                                <a href="Admin_Paper.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-clone" aria-hidden="true"></i>
                                        <h3>
                                            Add Papers</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>--%>
                            <div class="col-sm-3 ">
                                <a href="Admin_Questions.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-comments-o" aria-hidden="true"></i>
                                        <h3>
                                            Add Personality / Aptitute Question
                                        </h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="Admin_ManageJobs.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                        <h3>
                                            Add Job Details</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="">
                                    <div class="tile-name">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                        <h3>
                                            Preferred CV</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="Admin_SearchCandidate.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                        <h3>
                                            Scan CV</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="Admin_Shortlist_CV.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                        <h3>
                                            Shortlisted CV</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3 ">
                                <a href="Admin_Member.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-users" aria-hidden="true"></i>
                                        <h3>
                                            View Candidates
                                        </h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3 ">
                                <a href="Admin_Contact_Mange.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-users" aria-hidden="true"></i>
                                        <h3>
                                            Contact Us Manages
                                        </h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3 ">
                                <a href="Admin_Result.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-bar-chart" aria-hidden="true"></i>
                                        <h3>
                                            View Results</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <%--<div class="col-sm-3 ">
                                <a href="Admin_GeneratePaper.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                        <h3>
                                            Generate Paper</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>--%>
                <%--<div class="admin-dashboard">
                    <h2>
                        Account Management System</h2>
                    <div class="dashbord-bg">
                        <div class="row">
                            
                            
                            
                            
                        </div>
                    </div>
                </div>
                <div class="admin-dashboard">
                    <h2>
                        Page Management System</h2>
                    <div class="dashbord-bg">
                        <div class="row">
                            <div class="col-sm-3">
                                <a href="Admin_AboutUs.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-info-circle" aria-hidden="true"></i>
                                        <h3>
                                            About Us</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                              
                            <div class="col-sm-3 ">
                                <a href="Admin_ContactUsUpdate.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                        <h3>
                                            Contact Details</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            
                            <div class="col-sm-3 ">
                                <a href="Admin_Notification.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-bell" aria-hidden="true"></i>
                                        <h3>
                                            Notifications</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-3 ">
                                <a href="Admin_Logout.aspx">
                                    <div class="tile-name">
                                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                                        <h3>
                                            Logout</h3>
                                    </div>
                                    <div class="view">
                                        <span>View Detail<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <!-- /.ace-settings-container -->
                <!-- /.row -->
                <!-- /Stream Management 
                <div class="row text-center admin-stream">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="box-item">
                                    <a href="Admin_Stream.aspx">
                                        <div class="img-sec">
                                            <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                        <div class="black-bg">
                                            <div class="title">
                                                <h3>
                                                    Strem</h3>
                                                <p>
                                                    Whatever course you teach,
                                                    <br />
                                                    we have it!
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box-item">
                                    <a href="Admin_Subject.aspx">
                                        <div class="img-sec">
                                            <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                        <div class="black-bg">
                                            <div class="title">
                                                <h3>
                                                    Subject</h3>
                                                <p>
                                                    Whatever course you teach,
                                                    <br />
                                                    we have it!
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box-item">
                                    <a href="Admin_Paper.aspx">
                                        <div class="img-sec">
                                            <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                        <div class="black-bg">
                                            <div class="title">
                                                <h3>
                                                    Paper
                                                    </h3>
                                                <p>
                                                    Whatever course you teach,
                                                    <br />
                                                    we have it!
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box-item">
                                    <a href="Admin_Category.aspx">
                                        <div class="img-sec">
                                            <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                        <div class="black-bg">
                                            <div class="title">
                                                <h3>
                                                    Category</h3>
                                                <p>
                                                    Whatever course you teach,
                                                    <br />
                                                    we have it!
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box-item">
                                    <a href="Admin_Questions.aspx">
                                        <div class="img-sec">
                                            <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                        <div class="black-bg">
                                            <div class="title">
                                                <h3>
                                                    Questions</h3>
                                                <p>
                                                    Whatever course you teach,
                                                    <br />
                                                    we have it!
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box-item">
                                    <a href="subject.html">
                                        <div class="img-sec">
                                            <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                        <div class="black-bg">
                                            <div class="title">
                                                <h3>
                                                    SSC</h3>
                                                <p>
                                                    Whatever course you teach,
                                                    <br />
                                                    we have it!
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box-item">
                                    <a href="subject.html">
                                        <div class="img-sec">
                                            <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                        <div class="black-bg">
                                            <div class="title">
                                                <h3>
                                                    SSC</h3>
                                                <p>
                                                    Whatever course you teach,
                                                    <br />
                                                    we have it!
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box-item">
                                    <a href="subject.html">
                                        <div class="img-sec">
                                            <img class="img-responsive" src="assets/images/test1.jpg" /></div>
                                        <div class="black-bg">
                                            <div class="title">
                                                <h3>
                                                    SSC</h3>
                                                <p>
                                                    Whatever course you teach,
                                                    <br />
                                                    we have it!
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
</asp:Content>
