<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Admin_Skills.aspx.cs" Inherits="admin_Admin_Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server" class="main-content">
    <div class="mainContent">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="Admin_Home.aspx">Home</a>
                    </li>
                    <li>Skills Management System                </li>
                    <li class="active">Skills Management</li>
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
                                        Skills Management</h1>
                                    <div class="select-sub2">
                                    
                                        </div>
                                    <div class="select-sub2">
                                    
                                        </div>
                                    <div class="btn-colum">
                                        <asp:LinkButton ID="lnk_Add_Question" runat="server" class="btn btn-inverse text-right"
                                            CausesValidation="False" OnClick="linkAdd_Click">Add Skill</asp:LinkButton>
                                    </div>
                                    <div class="clearfix"></div>
                                    <table id="simple-table" class="table  table-bordered table-hover table-cate">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                        <th width="15%" class="detail-col">
                                                            Skill Name
                                                        </th>
                                                         <th width="15%" >
                                                            Weight
                                                        </th>
                                                        <th width="35%">
                                                            Detail
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="lbl_SkillName" runat="server" Text='<%# Eval("SkillName") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="lbl_Weight" runat="server" Text='<%# Eval("SkillWeight") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <div class="hidden-sm hidden-xs btn-group">
                                                            <asp:Label ID="lbl_Id" runat="server" Visible="false" Text='<%# Eval("SkillId") %>'></asp:Label>
                                                            <asp:LinkButton ID="lnk_Edit" class="btn btn-sm btn-info" runat="server" CommandName="Edit"><i class="ace-icon fa fa-pencil bigger-120"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lnk_Delete" class="btn btn-sm btn-danger" runat="server" CommandName="Delete"><i class="ace-icon fa fa-trash-o bigger-120"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lnk_Status" runat="server" class="btn-success" CommandName="EnableStatus" Text='<%# Eval("EnableStatus1") %>'></asp:LinkButton>
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
                                  Skills Management</h1>
                                <asp:LinkButton ID="lnk_Back" class="btn btn-inverse" runat="server" OnClick="btnback_Click"
                                    CausesValidation="False">Back</asp:LinkButton>
                                <asp:Label ID="lbl_Opr" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lbl_Id" runat="server" Visible="False"></asp:Label>
                                <div class="form-bg">
                                     
                                     
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                              Skill Name
                                            </label>
                                            <asp:TextBox ID="txt_Question_Title" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Question_Title"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                              Skill Weight
                                            </label>
                                            <asp:TextBox ID="txt_Weight" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Weight"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
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

