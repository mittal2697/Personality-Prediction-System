<%@ Page Title="Paper Management" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true"
    CodeFile="Admin_Paper.aspx.cs" Inherits="admin_Admin_Paper" %>

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
                    <li class="">Question Management System</li>
                    <li class="active">Paper Management</li>
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
                                        Paper Management</h1>
                                    <div class="select-sub1">
                                        <label>
                                            Category
                                        </label>
                                        <asp:DropDownList ID="ddl_StreamShow" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_TopicShow_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="select-sub1">
                                        <label>
                                            Subcategory
                                        </label>
                                        <asp:DropDownList ID="ddl_SubjectShow" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_SubjectShow_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="btn-colum">
                                        <asp:LinkButton ID="lnk_Add_Question" runat="server" class="btn btn-inverse text-right"
                                            CausesValidation="False" OnClick="linkAdd_Click">Add Papers</asp:LinkButton>
                                    </div>
                                    <table id="simple-table" class="table  table-bordered table-hover">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                        <th width="15%" class="center">
                                                            Paper Name
                                                        </th>
                                                        <th width="10%" class="detail-col">
                                                            Quest Marks
                                                        </th>
                                                        <th width="10%" class="center">
                                                           -ve Marks
                                                        </th>
                                                        <th width="10%" class="center">
                                                           Total Time
                                                        </th>
                                                        <th width="40%">
                                                            Description
                                                        </th>
                                                        <th width="15%">
                                                            Detail
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="center">
                                                        <span>
                                                            <asp:Label ID="lbl_CategoryName" runat="server" Text='<%# Eval("PaperName") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="lbl_QuestionMarks" runat="server" Text='<%# Eval("QuestionMarks") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="lbl_NegativeMarks" runat="server" Text='<%# Eval("NegativeMarks") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="lbl_PaperTime" runat="server" Text='<%# Eval("MinTime") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label ID="lbl_Description" runat="server" Text='<%# Eval("Description") %>'></asp:Label></span>
                                                    </td>
                                                    <td>
                                                        <div class="hidden-sm hidden-xs btn-group">
                                                           <asp:Label ID="lbl_InstructionId" runat="server" Visible="false" Text='<%# Eval("InstructionId") %>'></asp:Label>
                                                         <asp:Label ID="lbl_PaperType" runat="server" Visible="false" Text='<%# Eval("FixPaper") %>'></asp:Label>
                                                            <asp:Label ID="lbl_Id" runat="server" Visible="false" Text='<%# Eval("PaperId") %>'></asp:Label>
                                                            <asp:LinkButton ID="lnk_Edit" class="btn btn-sm btn-info" runat="server" CommandName="Edit"><i class="ace-icon fa fa-pencil bigger-120"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lnk_Delete" class="btn btn-sm btn-danger" runat="server" CommandName="Delete"><i class="ace-icon fa fa-trash-o bigger-120"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lnk_Status" runat="server" class="btn btn-sm btn-success " CommandName="EnableStatus" Text='<%# Eval("EnableStatus1") %>'></asp:LinkButton>
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
                                    Paper Management</h1>
                                <asp:LinkButton ID="lnk_Back" class="btn btn-inverse" runat="server" OnClick="btnback_Click"
                                    CausesValidation="False">Back</asp:LinkButton>
                                <asp:Label ID="lbl_Opr" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lbl_Id" runat="server" Visible="False"></asp:Label>
                                <div class="form-bg">
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Category Name
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
                                                Subcategory Name
                                            </label>
                                            <asp:DropDownList ID="ddl_SubjectAdd" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_SubjectAdd_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Instruction 
                                            </label>
                                            <asp:DropDownList ID="ddl_InstructionAdd" runat="server"  >
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Paper Name
                                            </label>
                                            <asp:TextBox ID="txt_PaperName" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Submit"
                                                runat="server" ControlToValidate="txt_PaperName" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Description
                                            </label>
                                            <asp:TextBox ID="txt_Description" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Submit"
                                                runat="server" ControlToValidate="txt_Description" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Paper Time
                                            </label>
                                            <asp:TextBox ID="txt_PaperTime" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Submit"
                                                runat="server" ControlToValidate="txt_PaperTime" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Paper Type
                                            </label>
                                            <asp:RadioButtonList ID="dl_PaperType" runat="server">
                                            <asp:ListItem Value="1" Selected="True" class="paper-radio">Same Question for All Students</asp:ListItem>
                                            <asp:ListItem Value="0"  class="paper-radio">Different Question for All Students</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                Question Marks
                                            </label>
                                            <asp:TextBox ID="txt_QuestionMarks" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Submit"
                                                runat="server" ControlToValidate="txt_QuestionMarks" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <label class=" control-label no-padding-right" for="form-field-1">
                                                -ve Marks
                                            </label>
                                            <asp:TextBox ID="txt_NegativeMarks" runat="server" class="col-xs-10 col-sm-8"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Submit"
                                                runat="server" ControlToValidate="txt_NegativeMarks" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="admin-paper-cate">
                                        <ul>
                                            <li>
                                                <asp:Label ID="lbl_EditRowId" Visible="false" runat="server" Text=""></asp:Label>
                                                <label>
                                                    Q Section</label>
                                                <asp:DropDownList ID="ddl_Category" runat="server">
                                                </asp:DropDownList>
                                            </li>
                                            <li>
                                                <label>
                                                    Easy Paper</label>
                                                <asp:TextBox ID="txt_Easy" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="AddCategory"
                                                    runat="server" ControlToValidate="txt_Easy" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </li>
                                            <li>
                                                <label>
                                                    Mod Paper</label>
                                                <asp:TextBox ID="txt_Mod" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="AddCategory"
                                                    runat="server" ControlToValidate="txt_Mod" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </li>
                                            <li>
                                                <label>
                                                    Diff Paper</label>
                                                <asp:TextBox ID="txt_Diff" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="AddCategory"
                                                runat="server" ControlToValidate="txt_Diff" ErrorMessage="*"></asp:RequiredFieldValidator>
                                           </li> <li>
                                                <asp:Button ID="btn_AddCategory" ValidationGroup="AddCategory" runat="server" class="btn btn-inverse"
                                                    Text="Add" OnClick="btn_AddCategory_Click" />
                                            </li>
                                        </ul>
                                        <asp:GridView ID="grd_Category" runat="server" DataKeyNames="CategoryId" class="display table table-hover table-condensed"
                                            Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                                            GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="grd_Items_SelectedIndexChanging">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                                                <asp:BoundField DataField="EasyQuestion" HeaderText="Easy Question" />
                                                <asp:BoundField DataField="ModQuestion" HeaderText="Mod Question" />
                                                <asp:BoundField DataField="DifQuestion" HeaderText="Dif Question" />
                                                <asp:BoundField DataField="TotalQuestion" HeaderText="Total Question" />
                                                <asp:CommandField ShowDeleteButton="True" />
                                                <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                                            </Columns>
                                            <EditRowStyle BackColor="#7C6F57" />
                                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#E3EAEB" />
                                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                                        </asp:GridView>
                                        <div class="clearfix">
                                        </div>
                                        <%--<table id="Table1" class="table  table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="center" width="20%">
                                                        Category
                                                    </th>
                                                    <th class="detail-col" width="20%">
                                                        Easy Test
                                                    </th>
                                                    <th width="20%">
                                                        Mock Type
                                                    </th>
                                                    <th width="20%">
                                                        Lorem Ipsum
                                                    </th>
                                                    <th width="20%">
                                                        Total
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <span>Lorem Ipsum Dolar</span>
                                                    </td>
                                                    <td>
                                                        <span>Lorem Ipsum Dolar</span>
                                                    </td>
                                                    <td>
                                                        <span>Lorem Ipsum Dolar</span>
                                                    </td>
                                                    <td>
                                                        <span>Lorem Ipsum Dolar</span>
                                                    </td>
                                                    <td>
                                                        <span>Lorem Ipsum Dolar</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>--%>
                                    </div>
                                    <asp:LinkButton ID="btn_Submit" class="btn btn-info" runat="server" OnClick="btn_Submit_Click"
                                        ValidationGroup="Submit" Text=" Submit"> Submit<i class="ace-icon fa fa-check bigger-110"></i> </asp:LinkButton>
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
