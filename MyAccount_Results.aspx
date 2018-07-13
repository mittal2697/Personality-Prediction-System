<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="MyAccount_Results.aspx.cs" Inherits="MyAccount_Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="#">Home</a> </li>
                    <li><a href="#">My Exam</a> </li>
                    <li class="active">My Results</li>
                </ul>
                <!-- /.breadcrumb -->
                <div class="nav-search" id="nav-search">
                    <%--<form class="form-search">
                    <span class="input-icon">
                        <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input"
                            autocomplete="off" />
                        <i class="ace-icon fa fa-search nav-search-icon"></i></span>
                    </form>--%>
                </div>
                <!-- /.nav-search -->
            </div>
            <div class="page-content">
                <!-- /.ace-settings-container -->
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="hr dotted">
                        </div>
                        <div>
                            <div class="Myresult">
                                <h1>
                                    My Results</h1>
                                <div class="additional-bg">
                                    <div class="col-sm-12">
                                          <table id="simple-table" class="table  table-bordered table-hover">
                                 
                                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                <HeaderTemplate>
                                                    <thead>
                                                        <tr>
                                                            
                                                            <th class="text-left">
                                                                Exam Date
                                                            </th>
                                                            <th class="text-left">
                                                                Questions
                                                            </th>
                                                            <th class="text-left">
                                                                Correct
                                                            </th>
                                                            <th class="text-left">
                                                                Wrong
                                                            </th>
                                                            <th class="text-left">
                                                                Not Attampted
                                                            </th>
                                                            <th class="text-left">
                                                                Marks
                                                            </th>
                                                            <th class="text-left">
                                                                Percentage
                                                            </th>
                                                            <th class="text-left">
                                                                &nbsp;
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                   
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                   <tbody>  <tr>
                                                       
                                                        <td class="text-left">
                                                            <asp:Label ID="lblPaperName" runat="server" Text='<%#Eval("ExamDate") %>'></asp:Label>
                                                        </td>
                                                        <td class="text-left">
                                                            <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Questions") %>'></asp:Label>
                                                        </td>
                                                        <td class="text-left">
                                                            <asp:Label ID="lblQuestions" runat="server" Text='<%#Eval("Correct") %>'></asp:Label>
                                                        </td>
                                                        <td class="text-left">
                                                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("Wrong") %>'></asp:Label>
                                                        </td>
                                                        <td class="text-left">
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("NotAttempt") %>'></asp:Label>
                                                        </td>
                                                        <td class="text-left">
                                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Marks") %>'></asp:Label>
                                                        </td>
                                                        <td class="text-left">
                                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Per") %>'></asp:Label>
                                                        </td>
                                                        <td class="text-left">
                                                            <asp:Label ID="lblResultId" runat="server" Visible="false" Text='<%#Eval("ResultId") %>'></asp:Label>
                                                             <asp:LinkButton ID="LinkButton1" CommandName="View" runat="server" class="btn btn-xs btn-success" ForeColor="#0066CC">View Details</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                         </table>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
</asp:Content>
