<%@ Page Title="Question Management System" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true"
    CodeFile="Admin_Questions.aspx.cs" Inherits="admin_Admin_Questions" %>

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
                    <li class="active">Question Management</li>
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
                                        Question Management</h1>
                                    <%--<div class="select-sub4">
                                        <label>
                                            Category
                                        </label>
                                        <asp:DropDownList ID="ddl_StreamShow" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_StreamShow_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="select-sub4">
                                        <label>
                                            Subcategory
                                        </label>
                                        <asp:DropDownList ID="ddl_SubjectShow" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_SubjectShow_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>--%>
                                    <div class="select-sub4">
                                        <label>
                                            Q Section
                                        </label>
                                        <asp:DropDownList ID="ddl_CategoryShow" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_CategoryShow_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <%--<div class="select-sub4">
                                        <label>
                                            Difficulty</label>
                                        <asp:DropDownList ID="ddl_DifficultyLevel_Show" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_DifficultyLevel_Show_SelectedIndexChanged">
                                            <asp:ListItem Value="0">--Select Difficulty Level--</asp:ListItem>
                                            <asp:ListItem Value="1">Easy</asp:ListItem>
                                            <asp:ListItem Value="2">Medium</asp:ListItem>
                                            <asp:ListItem Value="3">Difficult</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>--%>
                                    <div class="btn-colum qbtn">
                                        <asp:LinkButton ID="lnk_Add_Question" runat="server" class="btn btn-inverse text-right"
                                            CausesValidation="False" OnClick="linkAdd_Click">Add Question</asp:LinkButton>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                        <ItemTemplate>
                                            <div class="question-paper">
                                                <div class="col-md-12">
                                                    <div class="question-item">
                                                        <asp:Label ID="lbl_QId" runat="server" Text='<%# Eval("QuestionId") %>' Visible="False"></asp:Label>
                                                       <asp:Label ID="lbl_SubjectId" runat="server" Text='<%# Eval("SubjectId") %>' Visible="False"></asp:Label>
                                                        <asp:Label ID="lbl_QuestionCategoryId" runat="server" Text='<%# Eval("QuestionCategoryId") %>'
                                                            Visible="False"></asp:Label>
                                                        <asp:Label ID="lbl_Question_Type" runat="server" Text='<%# Eval("Question_Type") %>'
                                                            Visible="False"></asp:Label>
                                                        <asp:Label ID="lbl_Explanation_Type" runat="server" Text='<%# Eval("Explanation_Type") %>'
                                                            Visible="False"></asp:Label>
                                                         
                                                        <%-- <asp:Label ID="lbl_QTitle" runat="server" Text='<%# Eval("Question_Title") %>' Visible="False"></asp:Label>
                                                        --%>    
                                                        <p class="quest-add-item">
                                                            <asp:Label ID="lbl_Question_Text" runat="server" Text='<%# Eval("Question_Text") %>'></asp:Label>
                                                            <img class="img-responsive" src='<%# Eval("Question_Url1") %>'/> 
                                                        </p>
                                                        <p class="quest-add-explane">
                                                       
                                                        <asp:Label ID="lbl_Explanation" runat="server" Text='<%# Eval("Explanation_Text") %>'></asp:Label>
                                                        <img class="img-responsive" src='<%# Eval("Explanation_Url1") %>'/> 
                                                        </p>
                                                        <div class="clearfix">
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="answer-row">
                                                        <ul>
                                                            <li><b>
                                                            Answer(<asp:Label ID="lbl_Answer" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>)</b></li>
                                                            <li><b>Question No: <asp:Label ID="lbl_QuestionNo" runat="server" Text='<%# Eval("Question_Title") %>'></asp:Label></b></li>
                                                        </ul>
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
                                    Question Management</h1>
                                <asp:LinkButton ID="lnk_Back" class="btn btn-inverse" runat="server" OnClick="btnback_Click"
                                    CausesValidation="False">Back</asp:LinkButton>
                                <asp:Label ID="lbl_Opr" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lbl_Id" runat="server" Visible="False"></asp:Label>
                                <div class="form-bg">
                                    <%--<div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                 Category
                                            </label>
                                            <asp:DropDownList ID="ddl_StreamAdd" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_StreamAdd_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                 Subcategory
                                            </label>
                                            <asp:DropDownList ID="ddl_SubjectAdd" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_SubjectAdd_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>--%>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Q Section
                                            </label>
                                            <asp:DropDownList ID="ddl_CategoryAdd" runat="server"  >
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <%--<div class="form-group">
                                        <div class="col-sm-12">
                                            <label>
                                                Difficulty Level</label>
                                            <asp:DropDownList ID="ddl_DifficultyLevel_Add" runat="server">
                                                <asp:ListItem Value="0">--Select Difficulty Level--</asp:ListItem>
                                                <asp:ListItem Value="1">Easy</asp:ListItem>
                                                <asp:ListItem Value="2">Medium</asp:ListItem>
                                                <asp:ListItem Value="3">Difficult</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>--%>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Question No
                                            </label>
                                            <asp:TextBox ID="txt_QuestionNo" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_QuestionNo"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Question Type
                                            </label>
                                       
                                           <asp:RadioButtonList ID="opt_QuestionType" runat="server" RepeatColumns="2" 
                               AutoPostBack="True"  onselectedindexchanged="opt_QuestionType_SelectedIndexChanged"     RepeatDirection="Horizontal" Width="258px">
                                 <asp:ListItem Selected="True" class="input-type">Image</asp:ListItem>
                                 <asp:ListItem  class="input-type">Text</asp:ListItem>
                             </asp:RadioButtonList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12" runat="server" id="div_text">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Question Text
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
                                                Add New Question
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
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Answer
                                            </label>
                                            <asp:TextBox ID="txt_Answer" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_Answer"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>

                                    <div>


                                       <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Explanation Type
                                            </label>
                                       
                                           <asp:RadioButtonList ID="opt_ExplanationType" runat="server" RepeatColumns="2" 
                               AutoPostBack="True"  onselectedindexchanged="opt_Explanation_SelectedIndexChanged"     RepeatDirection="Horizontal" Width="258px">
                                 <asp:ListItem Selected="True" class="input-type">Image</asp:ListItem>
                                 <asp:ListItem  class="input-type">Text</asp:ListItem>
                             </asp:RadioButtonList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12" runat="server" id="Exp_txt">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Explanation Text
                                            </label>
                                            <div class="editor">
                                                <cc1:Editor ID="txt_Explanation"  runat="server" Height="200px" Width="500px" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12" runat="server" id="Exp_Image">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Add New Explanation
                                            </label>
                                           <label class="ace-file-input">
                                            <asp:FileUpload ID="FU_Explanation" runat="server" data-title="Choose"/>
                                            <span class="ace-file-container" data-title="Choose"><span class="ace-file-name" data-title="No File ..."><i class=" ace-icon fa fa-upload"></i></span></span>
                                            <a class="remove" href="#"><i class=" ace-icon fa fa-times"></i>
                                            </a>
                                            </label>
                                        </div>
                                        <div class="clearfix">
                                        </div>
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
