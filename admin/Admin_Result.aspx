<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true"
    CodeFile="Admin_Result.aspx.cs" Inherits="admin_Admin_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server" class="main-content">
    <div class="mainContent">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="Admin_Home.aspx">Home</a> </li>
                  
                    <li class="active">Result Management</li>
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
                                        Result Management</h1>
                                     
                                      <div class="select-sub1">
                                        <label>
                                            date
                                        </label>
                                        <asp:DropDownList ID="ddl_Date" runat="server" AutoPostBack="True" 
                                              onselectedindexchanged="ddl_Date_SelectedIndexChanged"  >
                                        </asp:DropDownList>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                   
                                </div>
                                <div class="col-xs-12">
                                    <div class="clearfix">
                                    </div>
                                     <table id="simple-table" class="table  table-bordered table-hover">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <HeaderTemplate>
                                                    <thead>
                                                        <tr>
                                                            <th class="text-left">
                                                               Name
                                                            </th>
                                                            <th class="text-left">
                                                               EmailId
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
                                                            
                                                        </tr>
                                                    </thead>
                                                   
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                   <tbody>  <tr>
                                                       <td class="text-left">
                                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("MemberName") %>'></asp:Label>
                                                        </td>
                                                        <td class="text-left">
                                                            <asp:Label ID="lblPaperName" runat="server" Text='<%#Eval("EmailId") %>'></asp:Label>
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
                                                        <%--<td class="text-left">
                                                            <asp:Label ID="lblResultId" runat="server" Visible="false" Text='<%#Eval("ResultId") %>'></asp:Label>
                                                             <asp:LinkButton ID="LinkButton1" CommandName="View" runat="server" class="btn btn-xs btn-success" ForeColor="#0066CC">View Details</asp:LinkButton>
                                                        </td>--%>
                                                    </tr>
                                                    </tbody>
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
                                    Stream Management</h1>
                                <asp:LinkButton ID="lnk_Back" class="btn btn-inverse" runat="server" OnClick="btnback_Click"
                                    CausesValidation="False">Back</asp:LinkButton>
                                <asp:Label ID="lbl_Opr" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lbl_Id" runat="server" Visible="False"></asp:Label>
                                <div class="form-bg">
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
