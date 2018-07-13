<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true"
    CodeFile="Admin_AboutUs.aspx.cs" Inherits="admin_Admin_AboutUs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server" class="main-content">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="mainContent">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="Admin_Home.aspx">Home</a>
                    </li>
                    <li class="">Page Management System</li>
                    <li class="active">About Us</li>
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
                <!-- /.row -->
                <!-- /Stream Management -->
                <div class="row text-center admin-about">
                    <!-- /Add Stream Management -->
                    <div class="col-md-12 add-stream ">
                        <h1>
                            About Us</h1>
                        
                       
                        <div class="form-bg">
                           
                            <div class="form-group">
                                <div class="col-sm-12" style="margin-top:0px;" runat="server" id="div_text">
                                    
                                    <div class="editor">
                                        <cc1:Editor ID="txt_Editor" class="about-editor" runat="server" Height="300px"  />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                           
                            <asp:LinkButton ID="btn_Submit" class="btn btn-info" runat="server"  
                                Text=" Submit" onclick="btn_Submit_Click"> Submit<i class="ace-icon fa fa-check bigger-110"></i> </asp:LinkButton>
                            <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
                        </div>
                    </div>
                    <!-- /Paper Management -->
                </div>
            </div>
        </div>
    </div>
    </form>
</asp:Content>
