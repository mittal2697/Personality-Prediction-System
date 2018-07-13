    <%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Admin_Shortlist_CV.aspx.cs" Inherits="admin_Admin_Shortlist_CV" %>
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
                    
                    <li class="active">Selected Candidates</li>
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
                                        Selected Candidates</h1>
                                  
                                </div>
                            </div>
                            <div class="btn-colum qbtn">
                                <asp:LinkButton ID="lnk_RemoveAll" runat="server" class="btn btn-inverse text-right"
                                    CausesValidation="False" OnClick="lnk_RemoveAll_Click">Remove All</asp:LinkButton>
                            </div>
                            <div class="clearfix">
                            </div>
                            <table id="simple-table" class="table  table-bordered table-hover">
                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th width="20%">
                                                    Photo
                                                </th>
                                                <th width="20%">
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
                                                <th width="10%">
                                                    Remove
                                                </th>
                                                <th width="20%">
                                                    View All Info.
                                                </th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <span>
                                                        <asp:Image ID="lbl_Photo" runat="server" ImageUrl='<%# Eval("PhotoUrl1") %>' Height="50px"
                                                            Width="50px" /></span>
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
                                                <td><div class="hidden-sm hidden-xs btn-group">
                                                        <asp:Label ID="lbl_Id" runat="server" Visible="false" Text='<%# Eval("MemberId") %>'></asp:Label>
                                                        <asp:LinkButton ID="lnk_Remove" runat="server" class="btn-success" CommandName="Remove"
                                                            Text="Remove"></asp:LinkButton>
                                                    </div>
                                                   
                                                </td>
                                                <td>
                                                 <span>
                                                        <asp:LinkButton ID="lnk_View" class="btn btn-sm btn-info" runat="server" CommandName="View" Text="View Detailss"></asp:LinkButton>
                                                    </span>    
                                                </td>
                                            </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.span -->
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
                                <asp:LinkButton ID="lnk_Back" class="btn btn-inverse" runat="server" OnClick="lnk_Back_Click">Back</asp:LinkButton>
                                <table id="Table1" class="table  table-bordered table-hover">
                                    <tr>
                                        <th>
                                            Candidate's Name
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_MemberName" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Email Address
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_EmailId" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            A/c Password 
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Password" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Contact Number
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_ContactNo" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Gender
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Gender" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Date Of Birth
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_DOB" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Candidate Address
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Candidate_Address" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Pin Code
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Pin_Code" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                      <tr>
                                        <th>
                                            Resume File Address
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Resume_Url" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Photo Address
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_PhotoUrl" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Active Status
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_EnableStatus" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Desired State
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Desired_State" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Desired City
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Desired_City" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            Registration Date
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_RegDate" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Employee Type
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Experience_Type" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Exp. Duretion in Years
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Experience_Year" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Exp. Duration in Months
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Experience_Month" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Candidate's Skills
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Key_Skills" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    

                                    <tr>
                                        <th>
                                            Old Sallery
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_OldSallery" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr><tr>
                                        <th>
                                            Reson To Skip Job
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Reson" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>
                                            Job Title
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Job_Title" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Company Name
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Company_Name" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Company Industry
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Company_Industry" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Job Functional Area
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Job_Functional_Area" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Job Duration Year
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Job_Duration_Year" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Job Duration Month
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Job_Duration_Month" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Current Salary
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Current_Salary" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Secendory Board
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Sec_Board" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Secendory Percent
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Sec_Per" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Secendory Passing Year
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Sec_Year" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Secendory Type
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Sec_Type" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Sr. Secendory Board
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_SrSec_Board" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Sr. Secendory Subject
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_SrSec_Subject" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Sr. Secendory Percent
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_SrSec_Per" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Sr. Secendory Passing Year
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_SrSec_Year" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Sr. Secendory Type
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_SrSec_Type" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Graduation University
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Graduation_Univ" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Graduation Degree
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Graduation_Degree" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Graduation Subject
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Graduation_Subject" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Graduation Percent
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Graduation_Per" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Graduation Year
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Graduation_Year" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Graduation Type
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Graduation_Type" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            PG University
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_PG_Univ" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            PG Degree
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_PG_Degree" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            PG Subject
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_PG_Subject" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            PG Percent
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_PG_Per" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            PG Year
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_PG_Year" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            PG Type
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_PG_Type" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Other University
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Other_Univ" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                           Degree
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Other_Degree" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Subject
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Other_Subject" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Percent
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Other_Per" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Year of Passing
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Other_Year" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                          Student Type
                                        </th>
                                        <td>
                                            <asp:Label ID="lbl_Other_Type" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                  
                                </table>
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
