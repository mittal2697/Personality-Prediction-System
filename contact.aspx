<%@ Page Title="System | Contact" Language="C#" MasterPageFile="~/Index.master"
    AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href="Default.aspx">Home</a>
                        <li class="active">Contact</li>
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
                                    Contact</h1>
                                <p>
                                      Personality Prediction System through CV analysis choose best candidate.</p>
                            <p>
                                This will enable a more effective way to short list submitted candidate CVs from a large number of applicants providing a consistent and fair CV ranking policy. 
                               </p>
                                <div class="row pt-30">
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 ">
                                                <div class="left-bar bg1">
                                                    <a href="#"><i class="fa fa-map" aria-hidden="true"></i></a>
                                                    <div class="media-body">
                                                        <strong>OUR OFFICE LOCATION</strong>
                                                        <p>
                                                            <asp:Label ID="lbl_Address" runat="server" Text="Type your Address"></asp:Label></p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-12">
                                                <div class="left-bar bg2">
                                                    <a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a>
                                                    <div class="media-body">
                                                        <strong>OUR CONTACT NUMBER</strong>
                                                        <p>
                                                            <asp:Label ID="lbl_Phone" runat="server" Text="Type ytour Phoe"></asp:Label></p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-12">
                                                <div class="left-bar bg3">
                                                    <a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a>
                                                    <div class="media-body">
                                                        <strong>OUR CONTACT E-MAIL</strong>
                                                        <p>
                                                            <asp:Label ID="lbl_MailUs" runat="server" Text=""></asp:Label></p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <!-- Contact Form -->
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txt_Name" class="form-control" placeholder="Enter Name" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ControlToValidate="txt_Name"
                                                        runat="server" ErrorMessage="Enter Name" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                         

                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txt_Phone" class="form-control required" placeholder="Enter Phone"
                                                            runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" ControlToValidate="txt_Phone"
                                                            runat="server" ErrorMessage="Enter Phone" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txt_EmailId" class="form-control required email" placeholder="Enter Email"
                                                            runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_EmailId"
                                                            runat="server" ErrorMessage="Enter Email Id" ValidationGroup="Reg" Display="None"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid eMail"
                                                            ControlToValidate="txt_EmailId" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                         
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txt_Subject" class="form-control" placeholder="Enter Subject" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" ControlToValidate="txt_Subject"
                                                        runat="server" ErrorMessage="Enter Subject" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txt_Message" TextMode="MultiLine" Height="213" class="form-control required"
                                                placeholder="Enter Message" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txt_Message"
                                                runat="server" ErrorMessage="Enter Message" ValidationGroup="Reg" Display="None"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <input id="form_botcheck" name="form_botcheck" class="form-control" value="" type="hidden">
                                            <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Reg" runat="server"
                                                ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
                                            <asp:LinkButton ID="btn_Submit" class="purple  btn btn-dark  btn-flat mr-5" ValidationGroup="Reg"
                                                runat="server" Text="Send your message" OnClick="btn_Submit_Click"></asp:LinkButton>
                                            <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
                                        </div>
                                        <!-- Contact Form Validation-->
                                        <%--<script type="text/javascript">
                $("#contact_form").validate({
                    submitHandler: function (form) {
                        var form_btn = $(form).find('button[type="submit"]');
                        var form_result_div = '#form-result';
                        $(form_result_div).remove();
                        form_btn.before('<div id="form-result" class="alert alert-success" role="alert" style="display: none;"></div>');
                        var form_btn_old_msg = form_btn.html();
                        form_btn.html(form_btn.prop('disabled', true).data("loading-text"));
                        $(form).ajaxSubmit({
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == 'true') {
                                    $(form).find('.form-control').val('');
                                }
                                form_btn.prop('disabled', false).html(form_btn_old_msg);
                                $(form_result_div).html(data.message).fadeIn('slow');
                                setTimeout(function () { $(form_result_div).fadeOut('slow') }, 6000);
                            }
                        });
                    }
                });
            </script>--%>
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
</asp:Content>
