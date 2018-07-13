<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResulttakeExamIC.aspx.cs" Inherits="TakeExamIC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OnLine Test</title>
    <link href="cssTest/test.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet"
        id="main_ace_style" />
     
    <style type="text/css">
        .style1
        {
            width: 100px;
        }
    </style>
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
                            <asp:Label ID="lbl_UserName" runat="server"></asp:Label><br />
                        </span><i class="ace-icon fa fa-caret-down"></i></li>
                </ul>
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
                                        <b>
                                            <asp:Label ID="lbl_PaperName" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                Font-Size="10pt" ForeColor="#003300"></asp:Label>
                                        </b>
                                    </td>
                                    <td>
                                        Total Questions: <strong>
                                            <asp:Label ID="lbl_MaxMarks" runat="server"></asp:Label></strong>
                                    </td>
                                    <td>
                                        Question No: <strong>
                                            <asp:Label ID="lbl_QuestionNo" runat="server"></asp:Label></strong>
                                    </td>

                                        <td>
                                        <span class="green">+1</span>
                                        <span  class="red">-.25</span>
                                        
                                         <strong>
                                            <asp:Label ID="Label2" runat="server"></asp:Label></strong>
                                    </td>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                                            Qid:<asp:Label ID="lbl_CurrentQ" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>CIndex:<asp:Label
                                                ID="lbl_CurrentIndex" runat="server" Font-Bold="True" ForeColor="#003366"></asp:Label>TotQ:<asp:Label
                                                    ID="lbl_TotalQ" runat="server" Font-Bold="True" ForeColor="#003300"></asp:Label></asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="test_frame_qus_top1">
                            <asp:DataList ID="dl_QuestionCategory" runat="server" RepeatDirection="Horizontal"
                                OnItemCommand="dl_QuestionCategory_ItemCommand" OnSelectedIndexChanged="dl_QuestionCategory_SelectedIndexChanged">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_QuestionCategoryName" runat="server" Text='<%# Eval("CategoryName") %>'></asp:LinkButton>
                                    <asp:Label ID="lbl_QuestionCategoryId" runat="server" Text='<%# Eval("CategoryId") %>'
                                        Visible="False"></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
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
                                <asp:LinkButton ID="lnk_QuestionNo" runat="server" CssClass="Question" Text='<%# Eval("Question_Title") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="test_frame">
                    <div class="test_ans_frame">
                           <div class="result-answer">
                             <div class="left">
    <h6>Your Answer is (<asp:Label ID="lbl_AnswerYour"   runat="server"></asp:Label>)</h6>
    </div>
    <div class="left">
    <h6>Correct Answer is (<asp:Label ID="lbl_AnswerCorrect"   runat="server"></asp:Label>)</h6>
    </div>
    
    <div class="clearfix"></div>
    </div>
                        <div class="test_ans_btn">
                           <asp:Label ID="lblQuestionUrl"  runat="server" Visible="False"></asp:Label>
                            <asp:LinkButton ID="btn_Prev1" runat="server" OnClick="btn_Prev1_Click">Prev</asp:LinkButton>
                            <asp:LinkButton ID="btn_Next1" runat="server" OnClick="btn_Next1_Click">Next</asp:LinkButton>
                          
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
                                        <asp:Label ID="lbl_AttemptedNo" runat="server" Text="0" Font-Bold="True" Font-Names="Verdana"
                                            Font-Size="10pt" ForeColor="Maroon"></asp:Label></b>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:DataList ID="dl_QuestionAll" runat="server" RepeatColumns="8" Width="800px"
            Visible="False">
            <ItemTemplate>
                <table cellpadding="5" cellspacing="1" class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lbl_QuestionCategoryId" runat="server" Text='<%# Eval("QuestionCategoryId") %>'
                                Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbl_QuestionTitle" runat="server" Text='<%# Eval("Question_Title") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbl_QuestionId" runat="server" Text='<%# Eval("QuestionId") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbl_Answer" runat="server" Text='<%# Eval("Answer") %>' Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbl_SelectedAnswer" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbl_Result" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>

        </asp:DataList>

       
    </div>

    <div class="main-explain">
      <div class="explain">Here is an Explanation</div>
    <div class="Expalnation">
  
    <h3>Explanation</h3>
    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
    </div>
  </div>
    <asp:ListBox ID="lstQuestions" runat="server" AutoPostBack="True" Height="250px"
        OnSelectedIndexChanged="lstQuestions_SelectedIndexChanged" Width="94px" Visible="False">
    </asp:ListBox>
    <asp:ListBox ID="lstSelectedAnswser" runat="server" Height="250px" Width="93px" Visible="False">
    </asp:ListBox>
    <asp:ListBox ID="lstResults" runat="server" Height="250px" Width="100px" Visible="False">
    </asp:ListBox>
    <asp:Label ID="lbl_PaperId_Sess" runat="server"></asp:Label>
    <asp:Label ID="lbl_MemberId_Sess" runat="server"></asp:Label>
    <asp:Label ID="lbl_EmailId_Sess" runat="server"></asp:Label>
    </form>
</body>
</html>
