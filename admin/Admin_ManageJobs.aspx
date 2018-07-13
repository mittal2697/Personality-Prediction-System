<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true"
    CodeFile="Admin_ManageJobs.aspx.cs" Inherits="admin_Admin_ManageJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        
        .Heading
        {
            padding: 0px;
            margin: 0px;
            background-color: Gray;
            width: 600px;
            height: 25px;
            color: Red;
            font-family: Verdana;
            font-size: 13pt;
            font-weight: bold;
            padding: 5px;
        }
        
        .SubHeading
        {
            padding: 0px;
            margin: 0px;
            width: 600px;
            height: 25px;
            font-family: Verdana;
            font-size: 10pt;
            font-weight: bold;
            padding: 5px;
        }
        
        .DetailFull
        {
            padding: 0px;
            margin: 0px;
            width: 600px;
            font-family: Verdana;
            font-size: 10pt;
            padding: 5px;
        }
        
        
        .DetailLeft
        {
            width: 150px;
            float: left;
        }
        
        .DetaiRight
        {
            width: 420px;
            float: left;
        }
        .style2
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server" class="main-content">
    <div class="mainContent">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="Admin_Home.aspx">Home</a>
                    </li>
                    <li class="active">Post Your Jobs</li>
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
                                        Job Management</h1>
                                    <div class="btn-colum">
                                        <asp:LinkButton ID="lnkbtn_Add" class="btn btn-inverse" runat="server" OnClick="lnkbtnAdd_Click"
                                            CausesValidation="False">Add</asp:LinkButton>
                                    </div>
                                    <table id="simple-table" class="table  table-bordered table-hover">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                        <th width="10%">
                                                            Job Title
                                                        </th>
                                                        <th width="10%">
                                                            Skills
                                                        </th>
                                                        <th width="10%">
                                                            Salary
                                                        </th>
                                                        <th width="10%">
                                                            Qualifications
                                                        </th>
                                                        <th width="10%">
                                                            Experience(Min.)
                                                        </th>
                                                        <th width="10%">
                                                            Description
                                                        </th>
                                                        <th width="20%">
                                                            Post Date/Last Date
                                                        </th>
                                                        <th width="20%">
                                                            Action
                                                        </th>  
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <span>
                                                                <asp:Label ID="lbl_MemberName" runat="server" Text='<%# Eval("Title") %>'></asp:Label></span>
                                                        </td>
                                                        <td>
                                                            <span>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Skills") %>'></asp:Label></span>
                                                        </td>
                                                        <td>
                                                            <span>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Salary") %>'></asp:Label></span>
                                                        </td>
                                                        <td>
                                                            <span>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Qualification") %>'></asp:Label></span>
                                                        </td>
                                                        <td>
                                                            <span>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Experience") %>'></asp:Label></span>
                                                        </td>
                                                        <td>
                                                            <span>
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>'></asp:Label></span>
                                                        </td>
                                                        <td>
                                                            <span>
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("PostDate") %>'></asp:Label>/
                                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("LastDate") %>'></asp:Label></span>
                                                        </td>
                                                        <td>
                                                            <div class="hidden-sm hidden-xs btn-group">
                                                                <asp:Label ID="lbl_Id" runat="server" Visible="false" Text='<%# Eval("JobId") %>'></asp:Label>
                                                                <asp:LinkButton ID="lnk_Edit" class="btn btn-sm btn-info" runat="server" CommandName="Edit"><i class="ace-icon fa fa-pencil bigger-120"></i></asp:LinkButton>
                                                                <asp:LinkButton ID="lnk_Delete" class="btn btn-sm btn-danger" runat="server" CommandName="Delete"><i class="ace-icon fa fa-trash-o bigger-120"></i></asp:LinkButton>
                                                               <%-- <asp:LinkButton ID="lnk_Status" runat="server" class="btn-success" CommandName="EnableStatus"
                                                                    Text='<%# Eval("EnableStatus1") %>'></asp:LinkButton>--%>
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
                                    Post new Job</h1>
                                <asp:LinkButton ID="lnk_Back" class="btn btn-inverse" runat="server" OnClick="btnback_Click"
                                    CausesValidation="False">Back</asp:LinkButton>
                                <asp:Label ID="lbl_Opr" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lbl_Id" runat="server" Visible="False"></asp:Label>
                                <div class="form-bg">
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Title</label>
                                            <asp:TextBox ID="txt_Title" class="form-control" placeholder="Title" data-value="Title"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" ControlToValidate="txt_Title"
                                                runat="server" ErrorMessage="Enter Title" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                           Skills</label>
                                            <asp:TextBox ID="txt_Skills" class="form-control" placeholder="Skills" data-value="Skills"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ControlToValidate="txt_Skills"
                                                runat="server" ErrorMessage="Enter Skills" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Sallery</label>
                                            <asp:TextBox ID="txt_Sallery" class="form-control" placeholder="Sallery" data-value="Sallery"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" ControlToValidate="txt_Sallery"
                                                runat="server" ErrorMessage="Enter Sallery" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Qualification</label>
                                            <asp:TextBox ID="txt_Qualification" class="form-control" placeholder="Qualification" data-value="Qualification"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" ControlToValidate="txt_Qualification"
                                                runat="server" ErrorMessage="Enter Qualification" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                               Experience</label>
                                            <asp:TextBox ID="txt_Experience" class="form-control" placeholder="Experience" data-value="Experience"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="None" ControlToValidate="txt_Experience"
                                                runat="server" ErrorMessage="Enter Experience" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                               Description</label>
                                            <asp:TextBox ID="txt_Description" class="form-control" placeholder="Description" data-value="Description"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="None" ControlToValidate="txt_Description"
                                                runat="server" ErrorMessage="Enter Description" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Post Date</label>
                                            <asp:TextBox ID="txt_PostDate" class="form-control" placeholder=" Post Date" data-value=" Post Date"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="None" ControlToValidate="txt_PostDate"
                                                runat="server" ErrorMessage="Enter  Post Date" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                               Last Date</label>
                                            <asp:TextBox ID="txt_LastDate" class="form-control" placeholder="Last Date" data-value="Last Date"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="None" ControlToValidate="txt_LastDate"
                                                runat="server" ErrorMessage="Enter Last Date" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Reg" runat="server"
                                            ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
                                        <asp:Label ID="lbl_Msg_Reg" runat="server" Font-Bold="True" Font-Names="Verdana"
                                            Font-Size="11pt" ForeColor="#FFCC00"></asp:Label>
                                    </div>
                                    <asp:LinkButton ID="btn_Submit" ValidationGroup="Reg" class="btn btn-info" runat="server"
                                        OnClick="btn_Submit_Click" Text=" Submit"> Submit<i class="ace-icon fa fa-check bigger-110"></i> </asp:LinkButton>
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
