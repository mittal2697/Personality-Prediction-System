<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginRegister.aspx.cs" Inherits="LoginRegister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>Login Page - Ace Admin</title>
    <meta name="description" content="User login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- text fonts -->
    <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
    <!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
</head>
<body class="login-layout">
    <form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="main-container">
        <div class="main-content">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="login-container">
                        <div class="center">
                            <h1>
                                <img src="assets/images/logo.png" />
                            </h1>
                        </div>
                        <div class="space-6">
                        </div>
                        <div class="position-relative">
                            <div id="login-box" class="login-box visible widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="ace-icon fa fa-coffee green"></i>Please Enter Your Information
                                        </h4>
                                        <div class="space-6">
                                        </div>
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <asp:TextBox runat="server" placeholder="Email Id" class="form-control" ID="txt_EmailId_Login"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txt_EmailId_Login"
                                                        Display="None" ErrorMessage="Enter Valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ValidationGroup="Login"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="None" ControlToValidate="txt_EmailId_Login"
                                                        runat="server" ErrorMessage="Enter Email Id" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                                    <i class="ace-icon fa fa-user"></i></span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <asp:TextBox runat="server" class="form-control" placeholder="PASSWORD" ID="txt_Password_Login"
                                                        TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="None" ControlToValidate="txt_Password_Login"
                                                        runat="server" ErrorMessage="Enter Password" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                                    <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="Login" runat="server"
                                                        ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
                                                    <i class="ace-icon fa fa-lock"></i></span>
                                            </label>
                                            <div class="space">
                                            </div>
                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace" />
                                                    <span class="lbl">Remember Me</span>
                                                </label>
                                                <asp:LinkButton runat="server" ValidationGroup="Login" class="width-35 pull-right btn btn-sm btn-primary"
                                                    ID="btn_Submit_Login" OnClick="btn_Submit_Login_Click"><i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Login</span></asp:LinkButton>
                                                <asp:Label ID="lbl_Msg_Login" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                    Font-Size="10pt" ForeColor="Red"></asp:Label>
                                            </div>
                                            <div class="space-4">
                                            </div>
                                        </fieldset>
                                        <div class="space-6">
                                        </div>
                                    </div>
                                    <!-- /.widget-main -->
                                    <div class="toolbar clearfix">
                                        <div>
                                           <%-- <a href="#" data-target="#forgot-box" class="forgot-password-link"><i class="ace-icon fa fa-arrow-left">
                                            </i>I forgot my password </a>--%>
                                            <a href="ForgetPassword.aspx" class="forgot-password-link"><i class="ace-icon fa fa-arrow-left">
                                            </i>I forgot my password </a>
                                        </div>
                                        <div>
                                            <a href="#" data-target="#signup-box" class="user-signup-link">I want to register <i
                                                class="ace-icon fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.login-box -->
                            <div id="forgot-box" class="forgot-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header red lighter bigger">
                                            <i class="ace-icon fa fa-key"></i>Retrieve Password
                                        </h4>
                                        <div class="space-6">
                                        </div>
                                        <p>
                                            Enter your email and to receive instructions
                                        </p>
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="email" class="form-control" placeholder="Email" />
                                                    <i class="ace-icon fa fa-envelope"></i></span>
                                            </label>
                                            <div class="clearfix">
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i><span class="bigger-110">Send Me!</span>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <!-- /.widget-main -->
                                    <div class="toolbar center">
                                        <a href="#" data-target="#login-box" class="back-to-login-link">Back to login <i
                                            class="ace-icon fa fa-arrow-right"></i></a>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.forgot-box -->
                            <div id="signup-box" class="signup-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header green lighter bigger">
                                            <i class="ace-icon fa fa-users blue"></i>New User Registration
                                        </h4>
                                        <div class="space-6">
                                        </div>
                                        <p>
                                            Enter your details to begin:
                                        </p>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <label class="block clearfix">
                                                     
                                                </label>
                                                <fieldset>
                                                     
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="txt_MemberName" class="form-control" placeholder="NAME" data-value="Name"
                                                                runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ControlToValidate="txt_MemberName"
                                                                runat="server" ErrorMessage="Enter Name" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                                            <i class="ace-icon fa fa-user"></i></span>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="txt_ContactNo" class="form-control" placeholder="Contact Number"
                                                                runat="server"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_ContactNo"
                                                                Display="None" ErrorMessage="Enter Valid Mobile No" ValidationExpression="\d{10}"
                                                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_ContactNo"
                                                                runat="server" ErrorMessage="Enter Contact No" ValidationGroup="Reg" Display="None"></asp:RequiredFieldValidator>
                                                            <i class="ace-icon fa fa-phone"></i></span>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="txt_EmailId" class="form-control" placeholder="Email Id" data-value="Email Id"
                                                                runat="server"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_EmailId"
                                                                Display="None" ErrorMessage="Enter Valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" ControlToValidate="txt_EmailId"
                                                                runat="server" ErrorMessage="Enter Email Id" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                                            <i class="ace-icon fa fa-envelope"></i></span>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="txt_Password" TextMode="Password" class="form-control" placeholder="Password"
                                                                data-value="Password" runat="server"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_Password"
                                                                Display="None" ErrorMessage="Password Should be 6-20 Chars" ValidationExpression="\w{6,20}"
                                                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" ControlToValidate="txt_Password"
                                                                runat="server" ErrorMessage="Enter Password" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                                            <i class="ace-icon fa fa-lock"></i></span>
                                                    </label>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="txt_ConfirmPassword" TextMode="Password" class="form-control" placeholder="Confirm Password"
                                                                data-value="Confirm Password" runat="server"></asp:TextBox>
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_ConfirmPassword"
                                                                ControlToValidate="txt_Password" Display="None" ErrorMessage="Both Password Does Not Match"
                                                                ValidationGroup="Reg"></asp:CompareValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt_ConfirmPassword"
                                                                Display="None" ErrorMessage="Password Should be 6-20 Chars" ValidationExpression="\w{6,20}"
                                                                ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="None" ControlToValidate="txt_ConfirmPassword"
                                                                runat="server" ErrorMessage="Enter Confirm Password" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                                            <i class="ace-icon fa fa-lock"></i></span>
                                                    </label>
                                                    <label class="block">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl">I accept the <a href="#">User Agreement</a> </span>
                                                    </label>
                                                    <div class="space-24">
                                                    </div>
                                                    <div class="clearfix">
                                                        <button type="reset" class="width-30 pull-left btn btn-sm">
                                                            <i class="ace-icon fa fa-refresh"></i><span class="bigger-110">Reset</span>
                                                        </button>
                                                        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Reg" runat="server"
                                                            ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
                                                        <asp:LinkButton ID="btn_Submit" class="width-65 pull-right btn btn-sm btn-success"
                                                            ValidationGroup="Reg" runat="server" Text="REGISTER" OnClick="btn_Submit_Click">                             
				         		 
															<span class="bigger-110">Register</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                        </asp:LinkButton>
                                                        <asp:Label ID="lbl_Msg_Reg" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                            Font-Size="11pt" ForeColor="#FFCC00"></asp:Label>
                                                    </div>
                                                </fieldset>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div class="toolbar center">
                                        <a href="#" data-target="#login-box" class="back-to-login-link"><i class="ace-icon fa fa-arrow-left">
                                        </i>Back to login </a>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.signup-box -->
                        </div>
                        <!-- /.position-relative -->
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.main-content -->
    </div>
    <!-- /.main-container -->
    </form>
    <!-- basic scripts -->
    <!--[if !IE]> -->
    <script src="assets/js/jquery-2.1.4.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
        jQuery(function ($) {
            $(document).on('click', '.toolbar a[data-target]', function (e) {
                e.preventDefault();
                var target = $(this).data('target');
                $('.widget-box.visible').removeClass('visible'); //hide others
                $(target).addClass('visible'); //show target
            });
        });



        //you don't need this, just used for changing background
        jQuery(function ($) {
            $('#btn-login-dark').on('click', function (e) {
                $('body').attr('class', 'login-layout');
                $('#id-text2').attr('class', 'white');
                $('#id-company-text').attr('class', 'blue');

                e.preventDefault();
            });
            $('#btn-login-light').on('click', function (e) {
                $('body').attr('class', 'login-layout light-login');
                $('#id-text2').attr('class', 'grey');
                $('#id-company-text').attr('class', 'blue');

                e.preventDefault();
            });
            $('#btn-login-blur').on('click', function (e) {
                $('body').attr('class', 'login-layout blur-login');
                $('#id-text2').attr('class', 'white');
                $('#id-company-text').attr('class', 'light-blue');

                e.preventDefault();
            });

        });
    </script>
</body>
</html>
