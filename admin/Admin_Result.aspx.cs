using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Result : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDateShow();
        }
    }


    private void FillDateShow()
    {
        string sql;
        sql = " select distinct ExamDate from  tbl_Result";
        ddl_Date.DataSource = c1.SelectDs(sql);
        ddl_Date.DataTextField = "ExamDate";
        ddl_Date.DataValueField = "ExamDate";
        ddl_Date.DataBind();
        ddl_Date.Items.Insert(0, new ListItem("--Select Date--", "0"));
    }

    //private void FillResult()
    //{
    //    string sql;

    //    sql = "select Question_Title,Question_Text, Question_Url,tbl_ResultDetails.Answer AS SelectedAnswer, tbl_Question.Answer AS ActualAnswer from tbl_ResultDetails, tbl_Question ";
    //    sql = sql + " WHERE tbl_ResultDetails.QuestionId =  tbl_Question.QuestionId";
    //    sql = sql + " AND ResultId='" + Session["ResultId"].ToString() + "'";
    //    Repeater1.DataSource = c1.SelectDs(sql);
    //    Repeater1.DataBind();

    //    sql = " select distinct ExamDate from  tbl_Result";
    //    sql = sql + " WHERE  PaperId=" + ddl_PaperShow.SelectedValue.ToString();
    //    ddl_Date.DataSource = c1.SelectDs(sql);

    //    ddl_Date.DataTextField = "ExamDate";
    //    ddl_Date.DataValueField = "ExamDate";
    //    ddl_Date.DataBind();
    //    ddl_Date.Items.Insert(0, new ListItem("--Select Date--", "0"));
    //}

    protected void linkAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
        MultiView1.ActiveViewIndex = 1;
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        //FillSubject();
        //MultiView1.ActiveViewIndex = 0;
        //lbl_Msg.Text = "";
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //string str, id;
        //lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Id")).Text;

        //if (e.CommandName == "Delete")
        //{
        //    str = "delete from tbl_Subject where SubjectId=" + lbl_Id.Text;
        //    c1.ExecuteQry(str);
        //    FillSubject();
        //}
        //else if (e.CommandName == "Edit")
        //{
        //    txt_Question_Title.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_SubjectName")).Text;
        //    ddl_StreamAdd.SelectedIndex = ddl_StreamShow.SelectedIndex;
        //    lbl_Opr.Text = "Edit";
        //    MultiView1.ActiveViewIndex = 1;
        //}
        //else if (e.CommandName == "EnableStatus")
        //{
        //    if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
        //    {
        //        str = "update tbl_Subject set EnableStatus=1";
        //        str = str + " WHERE SubjectId=" + lbl_Id.Text;
        //    }
        //    else
        //    {
        //        str = "update tbl_Subject set EnableStatus=0";
        //        str = str + " WHERE SubjectId=" + lbl_Id.Text;
        //    }
        //    c1.ExecuteQry(str);
        //    FillSubject();
        //}
    }

    protected void ddl_Date_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillResult();
    }

    private void FillResult()
    {
        String sql;

        sql = "  SELECT MemberName, tbl_Result.EmailId, ResultId,Per, ExamDate, '10' as Questions, Correct, Wrong, NotAttempt, Marks  ";
        sql = sql + " FROM tbl_Result, tbl_Member ";
        sql = sql + " WHERE tbl_Result.EmailId =tbl_Member.EmailId";
        sql = sql + " ORDER BY ResultId DESC ";

        Repeater1.DataSource = c1.SelectDs(sql);
        Repeater1.DataBind();

    }
}