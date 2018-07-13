<%@ Page Title="Test Instruction Management" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Admin_TestInstruction.aspx.cs" Inherits="admin_Admin_TestInstruction" %>

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
                     <li><a href="Admin_Home.aspx">Question Management System</a>
                    </li>
                    <li class="active">Test Instruction Management
</li>
                </ul>
                <!--/.breadcrumb -->
            </div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div class="col-md-12">
                        <div class="subject admin-subject">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h1>
                                        Test Instruction Management</h1>
                                   
                                    <div class="btn-colum">
                                        <asp:LinkButton ID="lnk_Add_Question" runat="server" class="btn btn-inverse text-right"
                                            CausesValidation="False" OnClick="linkAdd_Click">Add Instruction</asp:LinkButton>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                        <ItemTemplate>
                                            <div class="question-paper">
                                                <div class="col-md-6">
                                                    <div class="question-item">
                                                        <asp:Label ID="lbl_QId" runat="server" Text='<%# Eval("Id1") %>' Visible="False"></asp:Label>
                                                        
                                                        <asp:Label ID="lbl_InstructionType" runat="server" Text='<%# Eval("InstructionType") %>'
                                                            Visible="False"></asp:Label>
                                                          <p class="test-title">
                                                            <asp:Label ID="lbl_Title"  runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                                        </p>

                                                        
                                                        <p class="test-desscription">
                                                            <asp:Label ID="lbl_TestInstruction" runat="server" Text='<%# Eval("TestInstruction") %>'></asp:Label>
                                                       
                                                     
                                                        <img class="img-responsive" src='<%# Eval("PhotoUrl1") %>'/> 
                                                         </p>
                                                        <div class="clearfix">
                                                        </div>
                                                    </div>
                                                    <div class="answer-row test-btn">
                                                      
                                                        <div class="hidden-sm hidden-xs btn-group">
                                                            <asp:LinkButton  class="btn btn-xs btn-info" id="lnk_Edit" runat="server" commandname="Edit">
                                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                             
                                                           </asp:LinkButton>
                                                          <asp:LinkButton  id="lnk_Delete" runat="server" commandname="Delete" class="btn btn-xs btn-danger">
                                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                            </asp:LinkButton>
                                                        </div>
                                                        <div class="clearfix">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <!-- /.span -->
                            </div>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
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
                        <div class="row text-center admin-stream">
                            <!-- /Add Stream Management -->
                            <div class="col-md-12 add-stream">
                                <h1>
                                    Test Instruction Management</h1>
                                <asp:LinkButton ID="lnk_Back" class="btn btn-inverse" runat="server" OnClick="btnback_Click"
                                    CausesValidation="False">Back</asp:LinkButton>
                                <asp:Label ID="lbl_Opr" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lbl_Id" runat="server" Visible="False"></asp:Label>
                                <div class="form-bg">
                                    
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Instruction Type
                                            </label>
                                       
                                           <asp:RadioButtonList ID="opt_QuestionType" runat="server" RepeatColumns="2" 
                               AutoPostBack="True"  onselectedindexchanged="opt_QuestionType_SelectedIndexChanged"     RepeatDirection="Horizontal" Width="258px">
                                 <asp:ListItem Selected="True" class="input-type">Image</asp:ListItem>
                                 <asp:ListItem class="input-type">Text</asp:ListItem>
                             </asp:RadioButtonList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <div class="col-sm-12" runat="server" id="div1">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Instruction Title
                                            </label>
                                            <div class="test-edit-input">
                                                <asp:TextBox ID="txt_Title" runat="server"></asp:TextBox>         
                                            </div>
                                        </div>
                                        <div class="col-sm-12" runat="server" id="div_text">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Instruction Text
                                            </label>
                                            <div class="editor">
                                                <cc1:Editor ID="txt_QuestionText" runat="server" Height="200px" Width="500px" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12" runat="server" id="div_Image">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Instruction Image
                                            </label>
                                           <label class="ace-file-input">
                                            <asp:FileUpload ID="FU_Question" runat="server" data-title="Choose"/>
                                            <span class="ace-file-container" data-title="Choose"><span class="ace-file-name" data-title="No File ..."><i class=" ace-icon fa fa-upload"></i></span></span>
                                            <a class="remove" href="#"><i class=" ace-icon fa fa-times"></i>
                                            </a>
                                            </label>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                     
                                    <asp:LinkButton ID="btn_Submit" class="btn btn-info" runat="server" OnClick="btn_Submit_Click"
                                        Text=" Submit"> Submit<i class="ace-icon fa fa-check bigger-110"></i> </asp:LinkButton>
                                    <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
                                </div>
                            </div>
                            <!-- /Paper Management -->
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
    </form>
</asp:Content>
