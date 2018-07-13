<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTest.aspx.cs" Inherits="TakeTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OnLine Test</title>
    <link href="cssTest/test.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet"
        id="main_ace_style" />
    <script type="text/javascript" language="javascript">
        /*
        document.onmousedown = disableclick;
        status = "Right Click Disabled";
        function disableclick(e) {
        if (event.button == 2) {
        alert(status);
        return false;
        }
        }
        */      
    </script>
    <script>

        var myVar = setInterval(function () { myTimer() }, 60000);


        function myTimer() {
            var i;
            i = document.getElementById("lbl_Timer").innerHTML;
            document.getElementById("lbl_Timer").innerHTML = i - 1;
            if (i == 1) {
                __doPostBack('btnFinish1', '');
                clearInterval(myVar);
            }
        }

        function closeWindow() {
            //alert('dd');
            var str, res;

            str = "You have " + document.getElementById("lbl_AttemptedNo").innerHTML + " unattampted questions???"
            // For IE and Firefox prior to version 4
            res = confirm(str);

            if (res == true) {
                return true;
            }
            else {
                return false;
            }
        }

    </script>
    </head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="test_main">
        <div class="test_header">
            <div class="test_logo">
                <img src="assets/images/logo.png" />
            </div>
            <div class="test_time">
                <span id="ctl00_lblClock"></span>Time Left: <strong>
                    <asp:Label ID="lbl_Timer" runat="server" Text=""></asp:Label></strong>&nbsp;
                (Minutes)
            </div>
            <div class="test_user1">
                <ul class="nav ace-nav">
                    <li class="light-blue dropdown-modal">
                        <img class="nav-user-photo" src="assets/images/avatars/user.jpg" alt="Jason's Photo" />
                        <span class="user-info"><small>Welcome,</small>
                            <asp:Label ID="lbl_UserName" runat="server"></asp:Label>
                        <asp:Label ID="lbl_UserName1" runat="server" Visible="False"></asp:Label>
                        <br />
                        </span><i class="ace-icon fa fa-caret-down"></i></li>
                </ul>

                <div class="clearfix"></div>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="test_frame">
                    <div class="test_frame_qus">
                        <div class="test_frame_qus_top">
                            <table width="100%" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        Paper Name
                                    </td>
                                    <td>
                                      
                                            <asp:Label ID="lbl_PaperName" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                Font-Size="10pt" ForeColor="#003300"></asp:Label>
                                     
                                    </td>
                                    <td>
                                        Max Marks: <strong>
                                            <asp:Label ID="lbl_MaxMarks" runat="server"></asp:Label></strong>
                                            </strong>
                                    </td>
                                    <td>
                                        Question No: <strong>
                                            <asp:Label ID="lbl_QuestionNo" runat="server"></asp:Label></strong>
                                    </td>

                                        <td>
                                        <span class="green"><asp:Label ID="lbl_MarksPerQuestion" runat="server"></asp:Label></span>
                                        <span  class="red"><asp:Label ID="lbl_NegativeMarks" runat="server"></asp:Label></span>
                                        
                                         
                                    </td>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                                            Qid:<asp:Label ID="lbl_CurrentQId" runat="server" Font-Bold="True" 
                                                ForeColor="#CC0000"></asp:Label>CIndex:<asp:Label
                                                ID="lbl_CurrentIndex" runat="server" Font-Bold="True" ForeColor="#003366"></asp:Label>
                                                TotQ:<asp:Label ID="lbl_TotalQ" runat="server" Font-Bold="True" ForeColor="#003300"></asp:Label></asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="test_frame_qus_top1">
                        </div>
                        <div class="test_frame_qus_qus">
                            <div style='overflow: auto; width: 800px; height: 325px;'>
                                <asp:Label ID="lbl_QuestionText" runat="server" Visible="False"></asp:Label>
                                <asp:Image ID="img_Question"  runat="server" /></div>
                            <!-- 
        <iframe id="pdfiframe1" name="pdfiframe1" style="width:750px; height: 253px;" frameborder="0" runat=server> 
            <asp:Image ID="Image11" ImageUrl="Questions/8.jpg" runat="server" />
        </iframe>
        -->
                        </div>
                    </div>
                    <div class="test_frame_ans">
                        <asp:Repeater ID="dl_Questions" runat="server" OnItemCommand="dl_Questions_ItemCommand">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_QuestionId" runat="server" Visible="false" CssClass="Question"
                                    Text='<%# Eval("QuestionId") %>'></asp:LinkButton>
                                <asp:LinkButton ID="lnk_QuestionNo" runat="server"   CssClass="Question" Text='<%# Eval("RowNo") %>'></asp:LinkButton>
                                <asp:Label ID="lbl_SelectedAnswer" runat="server" Visible="false" Text='<%# Eval("SelectedAnswer") %>'></asp:Label>
                                <asp:Label ID="lbl_Review" runat="server" Visible="false" Text='<%# Eval("Review") %>'></asp:Label>
                                
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="test_frame">
                    <div class="test_ans_frame">
                        <div class="test_ans_select">
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <b>
                                            <asp:Label ID="lblAnswer" runat="server" Visible="False"></asp:Label><asp:Label ID="lblQuestionUrl"
                                                runat="server" Visible="False"></asp:Label><asp:Label ID="Label1" runat="server"
                                                    Text="Select Answer"></asp:Label></b>
                                    </td>
                                    <td>
                                        <label>
                                            <asp:RadioButtonList ID="rdo_SelectAnswers" runat="server"   
                                                RepeatDirection="Horizontal" Height="30px" Width="180px">
                                                <asp:ListItem>A</asp:ListItem>
                                                <asp:ListItem>B</asp:ListItem>
                                                <asp:ListItem>C</asp:ListItem>
                                                <asp:ListItem>D</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="test_ans_btn">
                            <asp:LinkButton ID="btn_UnSelect" runat="server" OnClick="btn_UnSelect_Click">UnSelect</asp:LinkButton>
                            <asp:LinkButton ID="btn_Review" runat="server" OnClick="btn_Review_Click">Review</asp:LinkButton>
                            <asp:LinkButton ID="btn_Prev1" runat="server" OnClick="btn_Prev1_Click">Prev</asp:LinkButton>
                            <asp:LinkButton ID="btn_Next1" runat="server" OnClick="btn_Next1_Click">Next</asp:LinkButton>
                            <asp:LinkButton ID="btnFinish1" runat="server" OnClientClick="javascript:return closeWindow();"
                                OnClick="btnFinish1_Click" CausesValidation="False">Finish</asp:LinkButton>
                        </div>
                    </div>
                    <div class="test_frame_att">
                        <table cellspacing="5">
                            <tr>
                                <td>
                                    <strong>Total Questions</strong>
                                </td>
                                <td>
                                    <b>
                                        <asp:Label ID="lbl_TotalQuestions" runat="server" Text="0" Font-Bold="True" Font-Names="Verdana"
                                            Font-Size="10pt" ForeColor="#006600"></asp:Label></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Attempted</strong>
                                </td>
                                <td>
                                    <b class="green">
                                        <asp:Label ID="lbl_Attempted" runat="server" Text="0" Font-Bold="True" Font-Names="Verdana"
                                            Font-Size="10pt" ForeColor="#006600"></asp:Label></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Not Attempted</strong>
                                </td>
                                <td>
                                    <b class="red">
                                        <asp:Label ID="lbl_NotAttempted" runat="server" Text="0" Font-Bold="True" Font-Names="Verdana"
                                            Font-Size="10pt" ForeColor="Maroon"></asp:Label></b>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:Label ID="lbl_PaperId_Sess" runat="server"></asp:Label>
    <asp:Label ID="lbl_MemberId_Sess" runat="server"></asp:Label>
    <asp:Label ID="lbl_EmailId_Sess" runat="server"></asp:Label>
    </form>
</body>
</html>

