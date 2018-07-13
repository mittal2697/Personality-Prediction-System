<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="PostResumeOld.aspx.cs" Inherits="PostResumeOld" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Job" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-content">
        <!-- page-content -->
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="Default.aspx">Home</a>
                        <li class="active">Upload Resume</li>
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
                            <div class="contact">
                                <h1>
                                    Upload Resume</h1>
                                <p>
                                    Put Content Here</p>
                                <div class="row pt-30">
                                    <div class="col-md-12">
                                        <!-- Contact Form -->
                                        <div class="row">
                                            <asp:Label ID="lbl_Opr" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="lbl_Id" runat="server" Visible="False"></asp:Label>
                                            <div class="profile-user-info profile-user-info-striped">
                                               <div class="main-block">
                                                    <div class="Heading">
                                                        <h3>
                                                            Personal Details</h3>
                                                    </div>
                                                    <div class="sub-block">
                                                         
                                                        <asp:Repeater ID="dl_Skills" runat="server">
                                                           <ItemTemplate>
                                                           <div style="padding:10px;margin-right:10px;float:left;">
                                                            <asp:CheckBox ID="chk_Skill" Text='<%# Eval("SkillName") %>' Font-Bold="true" Font-Names="verdana" Font-Size="10pt" runat="server">
                                                            </asp:CheckBox>
                                                               <asp:Label ID="lbl_Id" runat="server" Text='<%# Eval("SkillId") %>' Visible="false"></asp:Label>
                                                           
                                                           </div>
                                                           
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                      
                                                         <div class="clearfix"></div>
                                                      
                                                    </div>
                                                </div>
                                               
                                                <div class="main-block">
                                                    <div class="Heading">
                                                        <h3>
                                                            Personal Details</h3>
                                                    </div>
                                                    <div class="sub-block">
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Address*
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Address" TextMode="MultiLine" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredAddress" runat="server" ControlToValidate="txt_Address"
                                                                    ErrorMessage="Adderss is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Pin Code*
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_PinCode" runat="server" class="col-xs-12 col-sm-6" onchange="valid()"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredPin" runat="server" ControlToValidate="txt_PinCode"
                                                                    ErrorMessage="Pin Code is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                State*
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_State" runat="server" class="col-xs-12 col-sm-6" AutoPostBack="True"
                                                                    OnSelectedIndexChanged="ddl_State_SelectedIndexChanged">
                                                                    <asp:ListItem Enabled="true" Text="Select State" Value=""></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredState" runat="server" ControlToValidate="ddl_State"
                                                                    ErrorMessage="State is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                City*
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_City" runat="server" class="col-xs-12 col-sm-6">
                                                                    
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredCity" runat="server" ControlToValidate="ddl_City"
                                                                    ErrorMessage="City is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Gender*
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:RadioButton ID="Opt_Male" runat="server" Text="Male" GroupName="a" Checked="True" />
                                                                <asp:RadioButton ID="Opt_FeMale" runat="server" Text="Female" GroupName="a"  />
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Date Of Birth*
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_DOB" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <Job:CalendarExtender ID="calnder" runat="server" TargetControlID="txt_DOB" Format="dd/MM/yyyy">
                                                                </Job:CalendarExtender>
                                                                <asp:RequiredFieldValidator ID="txtRequiredDOB" runat="server" ControlToValidate="txt_DOB"
                                                                    ErrorMessage="DOB is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="main-block">
                                                    <div class="Heading">
                                                        <h3>
                                                            Professional Details</h3>
                                                    </div>
                                                    <div class="sub-block">
                                                        <div class="SubHeading">
                                                            <h5>
                                                                Desired Job Location</h5>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                State
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Desired_State" runat="server" class="col-xs-12 col-sm-6"
                                                                    AutoPostBack="True" OnSelectedIndexChanged="ddl_Desired_State_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredDesiredState" runat="server" ControlToValidate="ddl_Desired_State"
                                                                    ErrorMessage="Desired State is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                City
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Desired_City" runat="server" class="col-xs-12 col-sm-6">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredDesiredCity" runat="server" ControlToValidate="ddl_Desired_City"
                                                                    ErrorMessage="Desired City is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="sub-block">
                                                         <div class="SubHeading">
                                                            <h5>
                                                                Working Experience*</h5>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Are You
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:RadioButton ID="opt_Fresher" runat="server" Text="Fresher" GroupName="b" />
                                                                <asp:RadioButton ID="opt_Experience" runat="server" Text="Experience" GroupName="b" Checked="true" />
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Experience
                                                            </div>
                                                            <div class="profile-info-value ">
                                                                <asp:DropDownList ID="ddl_Exp_Months" runat="server" class="col-xs-12 col-sm-6" Style="width: 50%;">
                                                                    <asp:ListItem Enabled="true" Text="Select Month" Value="NO Experience"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="One Month" Value="One Month"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Two Months" Value="Two Months"></asp:ListItem>
                                                                     <asp:ListItem Enabled="true" Text="Three Months" Value="Three Months"></asp:ListItem>
                                                                      <asp:ListItem Enabled="true" Text="More then Five Months" Value="More then Five Months"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddl_Exp_Years" runat="server" class="col-xs-12 col-sm-6" Style="width: 50%;">
                                                                    <asp:ListItem Enabled="true" Text="Select Year" Value="0"></asp:ListItem>
                                                                   <asp:ListItem Enabled="true" Text="One Year" Value="One Year"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Two Years" Value="Two Years"></asp:ListItem>
                                                                     <asp:ListItem Enabled="true" Text="Three Years" Value="Three Years"></asp:ListItem>
                                                                      <asp:ListItem Enabled="true" Text="More then Five Years" Value="More then Five Years"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Sallery
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Sallery" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Reason To Left/Skip job
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_reson" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="sub-block">
                                                        <div class="SubHeading">
                                                            <h5>
                                                                Current / Latest Job Details</h5>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Job Title
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Job_Title" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                               
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Company Name
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Cmpny_Name" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                   </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                 Current Sallery
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_CSallery" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                              </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Industry
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Industry" class="col-xs-12 col-sm-6" runat="server" AutoPostBack="True"
                                                                    OnSelectedIndexChanged="ddl_Industry_SelectedIndexChanged">
                                                                    <asp:ListItem Enabled="true" Text="Select Industry" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                  </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Functional Area
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_FunctionalArea" class="col-xs-12 col-sm-6" runat="server">
                                                                    <asp:ListItem Enabled="true" Text="Select Functional Area" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                  </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Duration Job
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_JobDur_Months" runat="server" class="col-xs-12 col-sm-6"
                                                                    Style="width: 50%;">
                                                                     <asp:ListItem Enabled="true" Text="Select Month" Value="NO Experience"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="One Month" Value="One Month"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Two Months" Value="Two Months"></asp:ListItem>
                                                                     <asp:ListItem Enabled="true" Text="Three Months" Value="Three Months"></asp:ListItem>
                                                                      <asp:ListItem Enabled="true" Text="More then Five Months" Value="More then Five Months"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddl_JobDur_Years" runat="server" class="col-xs-12 col-sm-6"
                                                                    Style="width: 50%;">
                                                                    <asp:ListItem Enabled="true" Text="Select Year" Value="0"></asp:ListItem>
                                                                   <asp:ListItem Enabled="true" Text="One Year" Value="One Year"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Two Years" Value="Two Years"></asp:ListItem>
                                                                     <asp:ListItem Enabled="true" Text="Three Years" Value="Three Years"></asp:ListItem>
                                                                     <asp:ListItem Enabled="true" Text="Four Years" Value="Four Years"></asp:ListItem>
                                                                     <asp:ListItem Enabled="true" Text="Five Years" Value="Five Years"></asp:ListItem>
                                                                      <asp:ListItem Enabled="true" Text="More then Five Years" Value="More then Five Years"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Key Skills
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_KeySkills" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                 </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="main-block">
                                                    <div class="Heading">
                                                        <h3>
                                                            Education Details</h3>
                                                    </div>
                                                    <div class="sub-block">
                                                        <div class="SubHeading">
                                                            <h5>
                                                                Secondary Details*</h5>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Board
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Sec_Board" runat="server" class="col-xs-12 col-sm-6">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSecBoard" runat="server" ControlToValidate="ddl_Sec_Board"
                                                                    ErrorMessage="Board is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Course Type
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Sec_Course_Type" runat="server" class="col-xs-12 col-sm-6">
                                                                    <asp:ListItem Enabled="true" Text="Select Course Type" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="CorresPondance" Value="CorresPondance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Distance" Value="Distance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Regular" Value="Regular"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSecCourseType" runat="server" ControlToValidate="ddl_Sec_Course_Type"
                                                                    InitialValue="0" ErrorMessage="Course Type is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Percentage
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Sec_Pecentage" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSecPercentage" runat="server" ControlToValidate="txt_Sec_Pecentage"
                                                                    ErrorMessage="Percentage is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Year
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Sec_Year" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSecYear" runat="server" ControlToValidate="txt_Sec_Year"
                                                                    ErrorMessage="Year is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="sub-block">
                                                        <div class="SubHeading">
                                                            <h5>
                                                                Sr Secondary Details*</h5>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Board
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_SrSec_Board" runat="server" class="col-xs-12 col-sm-6">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSrSecBoard" runat="server" ControlToValidate="ddl_SrSec_Board"
                                                                    ErrorMessage="Board is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Course Type
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_SrSec_CourseType" runat="server" class="col-xs-12 col-sm-6">
                                                                    <asp:ListItem Enabled="true" Text="Select Course Type" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="CorresPondance" Value="CorresPondance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Distance" Value="Distance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Regular" Value="Regular"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSrSecCourseType" runat="server" ControlToValidate="ddl_SrSec_CourseType"
                                                                    InitialValue="0" ErrorMessage="Course Type is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Subject
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_SrSec_Subject" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSrSecSubject" runat="server" ControlToValidate="txt_SrSec_Subject"
                                                                    ErrorMessage="Subject is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Percentage
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_SrSec_Pecentage" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSrSecPercentage" runat="server" ControlToValidate="txt_SrSec_Pecentage"
                                                                    ErrorMessage="Percentage is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Year
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_SrSec_Year" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredSrSecYear" runat="server" ControlToValidate="txt_SrSec_Year"
                                                                    ErrorMessage="Year is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="sub-block">
                                                        <div class="SubHeading">
                                                            <h5>
                                                                Graduation Details*</h5>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                University
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Graduation_Uni" runat="server" class="col-xs-12 col-sm-6">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredGraduationUni" runat="server" ControlToValidate="ddl_Graduation_Uni"
                                                                    InitialValue="0" ErrorMessage="University is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Course Type
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Graduation_Uni_Coursetype" runat="server" class="col-xs-12 col-sm-6">
                                                                    <asp:ListItem Enabled="true" Text="Select Course Type" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="CorresPondance" Value="CorresPondance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Distance" Value="Distance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Regular" Value="Regular"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="txtRequiredGraduationCourseType" runat="server" ControlToValidate="ddl_Graduation_Uni_Coursetype"
                                                                    InitialValue="0" ErrorMessage="Course Type is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Degree
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Graduation_Degree" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredGraduationDegree" runat="server" ControlToValidate="txt_Graduation_Degree"
                                                                    ErrorMessage="Degree is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Subject
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Graduation_Uni_Subject" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredGraduationSubject" runat="server" ControlToValidate="txt_Graduation_Uni_Subject"
                                                                    ErrorMessage="Subject is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Percentage
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Graduation_Uni_Pecentage" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredGraduationPercentage" runat="server" ControlToValidate="txt_Graduation_Uni_Pecentage"
                                                                    ErrorMessage="Percentage is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Year
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Graduation_Uni_Year" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="txtRequiredGraduationYear" runat="server" ControlToValidate="txt_Graduation_Uni_Year"
                                                                    ErrorMessage="Yesr is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="sub-block">
                                                        <div class="SubHeading">
                                                            <h5>
                                                                PG Details</h5>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                University
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_PG_Uni" runat="server" class="col-xs-12 col-sm-6">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Course Type
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_PG_CourseType" runat="server" class="col-xs-12 col-sm-6">
                                                                    <asp:ListItem Enabled="true" Text="Select Course Type" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="CorresPondance" Value="CorresPondance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Distance" Value="Distance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Regular" Value="Regular"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Degree
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_PG_Degree" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Subject
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_PG_Subject" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Percentage
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_PG_Percentage" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Year
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_PG_Year" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="main-block">
                                                    <div class="Heading">
                                                        <h3>
                                                            Other Education Details</h3>
                                                    </div>
                                                    <div class="sub-block">
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                University
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Other_Uni" runat="server" class="col-xs-12 col-sm-6">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Course Type
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:DropDownList ID="ddl_Other_Uni_CourseType" runat="server" class="col-xs-12 col-sm-6">
                                                                    <asp:ListItem Enabled="true" Text="Select Course Type" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="CorresPondance" Value="CorresPondance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Distance" Value="Distance"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Regular" Value="Regular"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Degree
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Other_Degree" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Subject
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_Other_Uni_Subject" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Percentage
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_other_Uni_Pecentage" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Year
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:TextBox ID="txt_other_Uni_Year" runat="server" class="col-xs-12 col-sm-6"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Upload Resume File
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:FileUpload ID="FU_Resume" runat="server" />
                                                                <asp:RequiredFieldValidator ID="txtRequiredFUResume" runat="server" ControlToValidate="FU_Resume"
                                                                    ErrorMessage="Resume is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="profile-info-row">
                                                            <div class="profile-info-name">
                                                                Upload Photo
                                                            </div>
                                                            <div class="profile-info-value">
                                                                <asp:FileUpload ID="FU_Photo" runat="server" />
                                                              <%--  <asp:RequiredFieldValidator ID="txtRequiredFUPhoto" runat="server" ControlToValidate="FU_Photo"
                                                                    ErrorMessage="Photo is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                --%>            
                                                </div>
                                                        </div>
                                                        
                                                   <div class="profile-info-row-btn">
                                                         
                                                                <asp:LinkButton ID="btn_Submit" class="btn btn-info" runat="server" OnClick="btn_Submit_Click"
                                                                    Text=" Submit"> Submit<i class="ace-icon fa fa-check bigger-110"></i> </asp:LinkButton>
                                                                <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
                                                    
                                                            
                                                        </div>
                                                    </div>
                                        </div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
        </div>
    </div>
    <!-- /.page-content -->
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
