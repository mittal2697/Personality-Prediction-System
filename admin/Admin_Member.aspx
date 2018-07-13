<%@ Page Title="Member Management System" Language="C#" MasterPageFile="~/admin/Admin.master"
    AutoEventWireup="true" CodeFile="Admin_Member.aspx.cs" Inherits="admin_Admin_Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server" class="main-content">
    <div class="mainContent">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="Admin_Home.aspx">Home</a>
                    </li>
                    <li class="active">Candidate Management</li>
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
                                        Account Management</h1>
                                    
                                  
                                  <div class="btn-colum">
                                     <asp:LinkButton ID="lnkbtn_Add" class="btn btn-inverse" runat="server" OnClick="lnkbtnAdd_Click"
                                    CausesValidation="False">Add</asp:LinkButton>
                                    
                                    </div>
                                    <table id="simple-table" class="table  table-bordered table-hover">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                     <th width="20%" class="detail-col">
                                                            Photo
                                                        </th>
                                                        <th width="20%" class="detail-col">
                                                            Name
                                                        </th>
                                                        <th width="20%">
                                                            Email
                                                        </th>
                                                        <th width="20%">
                                                            Mobile
                                                        </th>
                                                        <th width="10%">
                                                            RegDate
                                                        </th>
                                                       <%-- <th width="10%">
                                                            Enable/Disable
                                                        </th>--%>
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
                                                            <asp:Image ID="lbl_Photo" runat="server" ImageUrl='<%# Eval("PhotoUrl1") %>' Height="50px" Width="50px" /></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="lbl_MemberName" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmailId") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ContactNo") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("RegDate") %>'></asp:Label></span>
                                                    </td>
                                                   <%-- <td>
                                                        <span>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("EnableStatus1") %>'></asp:Label></span>
                                                    </td>--%>
                                                    <td>
                                                        <div class="hidden-sm hidden-xs btn-group">
                                                            <asp:Label ID="lbl_Id" runat="server" Visible="false" Text='<%# Eval("MemberId") %>'></asp:Label>
                                                            <asp:LinkButton ID="lnk_Edit" class="btn btn-sm btn-info" runat="server" CommandName="Edit"><i class="ace-icon fa fa-pencil bigger-120"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lnk_Delete" class="btn btn-sm btn-danger" runat="server" CommandName="Delete"><i class="ace-icon fa fa-trash-o bigger-120"></i></asp:LinkButton>
                                                          <%--  <asp:LinkButton ID="lnk_Status" runat="server" class="btn-success" CommandName="EnableStatus"
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
                                    Member Management</h1>
                                <asp:LinkButton ID="lnk_Back" class="btn btn-inverse" runat="server" OnClick="btnback_Click"
                                    CausesValidation="False">Back</asp:LinkButton>
                                <asp:Label ID="lbl_Opr" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lbl_Id" runat="server" Visible="False"></asp:Label>
                                
                                <div class="form-bg">
                
                                                               <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <label class=" control-label no-padding-right" for="form-field-1">
                                                                        Member Name</label>
                                                                         <asp:TextBox ID="txt_MemberName" class="form-control" placeholder="NAME" data-value="Name"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" ControlToValidate="txt_MemberName"
                                                runat="server" ErrorMessage="Enter Name" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                               
                                             
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>

                                                  
                                 

                                                                <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <label class=" control-label no-padding-right" for="form-field-1">
                                                                        Contact No </label>
                                                                          <asp:TextBox ID="txt_ContactNo" class="form-control" placeholder="Contact Number"
                                                runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_ContactNo"
                                                Display="None" ErrorMessage="Enter Valid Mobile No" ValidationExpression="\d{10}"
                                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txt_ContactNo"
                                                runat="server" ErrorMessage="Enter Contact No" ValidationGroup="Reg" Display="None"></asp:RequiredFieldValidator>
                              
                                             
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>



                                    

                                                               <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <label class=" control-label no-padding-right" for="form-field-1">
                                                                        Email Id</label>
                                                                          <asp:TextBox ID="txt_EmailID" class="form-control" placeholder="Email Id" data-value="Email Id"
                                                runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_EmailID"
                                                Display="None" ErrorMessage="Enter Valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="None" ControlToValidate="txt_EmailId"
                                                runat="server" ErrorMessage="Enter Email Id" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                
                                             
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>


                                  
                                                                <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <label class=" control-label no-padding-right" for="form-field-1">
                                                                        Password </label>
                                                                          <asp:TextBox ID="txt_Password" class="form-control" placeholder="Password"
                                                runat="server" TextMode="SingleLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ControlToValidate="txt_Password"
                                                runat="server" ErrorMessage="Enter Password" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    
                                             
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
                                    <asp:LinkButton ID="btn_Submit" ValidationGroup="Reg" class="btn btn-info" runat="server" OnClick="btn_Submit_Click"
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
