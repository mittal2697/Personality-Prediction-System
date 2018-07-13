<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Admin_Contact_Mange.aspx.cs" Inherits="admin_Admin_Contact_Mange" %>

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
                    <li class="active">Contact Management</li>
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
                                        Contact Management</h1>
                                    
                                  
                                
                                    <table id="simple-table" class="table  table-bordered table-hover">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                     <th width="20%" class="detail-col">
                                                          Name
                                                        </th>
                                                        <th width="20%" class="detail-col">
                                                            Email Id
                                                        </th>
                                                        <th width="20%">
                                                          Message
                                                        </th>
                                                        <th width="20%">
                                                           Subject
                                                        </th>
                                                        <th width="10%">
                                                            Mobile No
                                                        </th>
                                                       <%-- <th width="10%">
                                                            Enable/Disable
                                                        </th>--%>
                                                        <th width="20%">
                                                            Delete Msg
                                                        </th>
                                                    </tr>
                                                </thead>                   
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                  <tbody>
                                                <tr>
                                                 
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="lbl_MemberName" runat="server" Text='<%# Eval("CName") %>'></asp:Label></span>
                                                    </td>
                                                     <td>
                                                        <span>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("EmailId") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Message") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Subject") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("PhoneNo") %>'></asp:Label></span>
                                                    </td>
               
                                                    <td>
                                                        <div class="hidden-sm hidden-xs btn-group">
                                                            <asp:Label ID="lbl_Id" runat="server" Visible="false" Text='<%# Eval("Id1") %>'></asp:Label>
                                                            <asp:LinkButton ID="lnk_Delete" class="btn btn-sm btn-danger" runat="server" CommandName="Delete"><i class="ace-icon fa fa-trash-o bigger-120"></i></asp:LinkButton>
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
            </asp:MultiView>
        </div>
    </div>
    </form>
</asp:Content>

