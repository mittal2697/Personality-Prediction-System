<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test_Insturction.aspx.cs" Inherits="Test_Insturction" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OnLine Test</title>
    <link href="cssTest/test.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet"
        id="main_ace_style" />
     <script>
         function Exit() {
             return "Are you sure?";
         }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   <div class="test_main test_main1">
  <div class="test_header test_header1">
    <div class="test_logo"> <img src="assets/images/logo.png" /> </div>
   <div class="test_user user1">
                <ul class="nav ace-nav">
                    <li class="light-blue dropdown-modal">
                        <img class="nav-user-photo" src="assets/images/avatars/user.jpg" alt="Jason's Photo" />
                        <span class="user-info"><small>Welcome,</small>
                            <asp:Label ID="lbl_UserName" runat="server">Yoganand Sharma</asp:Label><br />
                        </span><i class="ace-icon fa fa-caret-down"></i></li>
                </ul>
            </div>
  </div>
  <div class="test_frame1">
    <div class="test_frame_qus">
      <div class="test_frame_qus_top" >
        <table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td><b> <asp:Label ID="lbl_PaperName" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt" ForeColor="#003300">Instruction for Test</asp:Label></b></td>
            <td>
                <asp:Label ID="lbl_PaperType" runat="server"></asp:Label>
              </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </div>
      <div class="test_frame_qus_qus1">
      <asp:Image ID="img_Instruction" runat="server" />
          <asp:Label ID="lbl_Instruction" runat="server"></asp:Label>
      </div>
    </div>
  </div>
  <div class="test_frame">
    <div class="test_ans_frame">
      <div class="test_ans_btn test_ans_btn1" >
            <asp:LinkButton ID="btn_Go" runat="server" onclick="btn_Go_Click">Start Test Now</asp:LinkButton>
      </div>
    </div>
  </div>
</div>
    </form>
</body>
</html>
