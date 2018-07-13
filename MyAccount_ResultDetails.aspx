﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true" CodeFile="MyAccount_ResultDetails.aspx.cs" Inherits="MyAccount_ResultDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-content">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="mainContent">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">Home</a>
                    </li>

                    <li class="">Question Management System</li>
                    <li class="active">Question Management System</li>
                </ul>
                <!--/.breadcrumb -->
            </div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div class="col-md-12">
                        <div class="subject front-result">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h1>
                                        Result Details</h1>
                                    <asp:Label ID="lbl_PaperId" runat="server" Visible="false" Text=""></asp:Label>
                                     
                                     
                                    <div class="btn-colum qbtn">
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <asp:Repeater ID="Repeater1" runat="server" >
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
                                                            Correct Answer(<asp:Label ID="lbl_Answer" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>)</b></li>
                                                            <li><b>
                                                            Your Answer(<asp:Label ID="lbl_GivenAnswer" runat="server" Text='<%# Eval("GivenAnswer") %>'></asp:Label>)</b></li>
                                                            <li><b>Question No: <asp:Label ID="lbl_QuestionNo" runat="server" Text='<%# Eval("Question_Title") %>'></asp:Label></b></li>
                                                        </ul>
                                                         
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
                
            </asp:MultiView>
        </div>
    </div>
    </div>
</asp:Content>
