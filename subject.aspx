<%@ Page Title="Anand ICE | Subject" Language="C#" MasterPageFile="~/Index.master"
    AutoEventWireup="true" CodeFile="subject.aspx.cs" Inherits="subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">Home</a>
                        <li class="active">Subjects</li>
                    </li>
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
                                <div class="col-md-8">
                                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                        <!-- Indicators -->
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item">
                                                <img src="assets/images/banner1.jpg" alt="...">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                            <div class="item active">
                                                <img src="assets/images/banner2.jpg" alt="...">
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
                                <div class="col-md-4">
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
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="subject">
                                <h1>
                                    Online Test Subject</h1>
                                <p>
                                    Boost your exam preparation with Testbook to crack the most popular competitive
                                    exams in India.<br />
                                    Select your course and get started.</p>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <table id="simple-table" class="table  table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th width="15%" class="center">
                                                        Subcategory Image 
                                                    </th>
                                                    <th width="20%" class="detail-col">
                                                        Subcategory Name
                                                    </th>
                                                    <th width="60%">
                                                        Description
                                                    </th>
                                                    <th width="10%">
                                                        Detail
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="center">
                                                                <label class="pos-rel">
                                                                    <img class="nicdark_opacity" alt="" src='<%# Eval("PhotoUrl") %>'>
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <span>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server"><%# Eval("SubjectName")%></asp:LinkButton></span>
                                                            </td>
                                                            <td>
                                                                <span><%# Eval("Description")%></span>
                                                            </td>
                                                            <td>
                                                                <div class="hidden-sm hidden-xs btn-group">
                                                                    <a href="papers.html"></a>
                                                                    <asp:LinkButton ID="lnk_Stream" class="btn btn-xs btn-success" Text="View Detail"
                                                                        runat="server"></asp:LinkButton>
                                                                    <asp:Label ID="lbl_SubjectId" Visible="false" runat="server" Text='<%# Eval("SubjectId")%>'></asp:Label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.span -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
        </div>
    </div>
</asp:Content>
