using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_GeneratePaper : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] == null)
        {
            Response.Redirect("index.aspx");
        }
        if (!IsPostBack)
        {
            FillStream();

        }
    }

    public void FillQuestion()
    {
        string str = "";
        int cnt;


        if (ddl_PaperShow.SelectedIndex > 0)
        {
            str = " select *,'../'+Question_Url AS PhotoUrl  from tbl_Question, tbl_PaperSet";
            str = str + " where  tbl_Question.QuestionId= tbl_PaperSet.QuestionId";
            str = str + " and PaperId=" + ddl_PaperShow.SelectedValue.ToString();

            if (ddl_CategoryShow.SelectedIndex > 0) {
                str = str + " and QuestionCategoryId=" + ddl_CategoryShow.SelectedValue.ToString();
            }
            if (ddl_DifficultyLevel_Show.SelectedIndex > 0)
            {
                str = str + " and DifficultyLevel=" + ddl_DifficultyLevel_Show.SelectedValue.ToString();
            }
            Repeater1.DataSource = c1.SelectDs(str);
            Repeater1.DataBind();
        }

    }

    public void FillStream()
    {
        string sql;
        sql = "select * from tbl_Stream ";
        sql = sql + " WHERE EnableStatus =1 ";
        if (Session["AdminId"].ToString() != "1")
            sql = sql + " and AdminId=" + Session["AdminId"].ToString();

        ddl_StreamShow.DataSource = c1.SelectDs(sql);
        ddl_StreamShow.DataTextField = "StreamName";
        ddl_StreamShow.DataValueField = "StreamId";
        ddl_StreamShow.DataBind();
        ddl_StreamShow.Items.Insert(0, new ListItem("--Select Category--", "0"));

        ddl_StreamAdd.DataSource = c1.SelectDs(sql);
        ddl_StreamAdd.DataTextField = "StreamName";
        ddl_StreamAdd.DataValueField = "StreamId";
        ddl_StreamAdd.DataBind();
        ddl_StreamAdd.Items.Insert(0, new ListItem("--Select Category--", "0"));

    }

    protected void linkAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
        MultiView1.ActiveViewIndex = 1;
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        FillQuestion();
        MultiView1.ActiveViewIndex = 0;
        lbl_Msg.Text = "";
    }
    protected void linkDelete_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "Delete from tbl_PaperSet where PaperId=" + ddl_PaperAdd.SelectedValue.ToString();
        c1.ExecuteQry(sql);
        FillQuestion();
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql,cnt;
        int TotalRows = 0, i, j, TotalCols = 0, k, TotalQuestionRequired, QNo;
        DataTable ds = new DataTable();

        TotalRows = grd_Category.Rows.Count;
        TotalCols = 3;

        sql = "Select Count(PaperId) from tbl_PaperSet where PaperId="+ddl_PaperAdd.SelectedValue.ToString();
        cnt = c1.SelectScalar(sql);
        if (Convert.ToInt32(cnt) > 0) {
            lbl_Msg.Text = "Paper Already Created";
        }
        else
        {
            for (i = 0; i < TotalRows; i++)
            {
                for (j = 1; j <= 3; j++)
                {

                    TotalQuestionRequired = Convert.ToInt32(grd_Category.Rows[i].Cells[j].Text);

                    lstAllQuestion.Items.Clear();
                    //1=Easy 2=Medium 3=diff
                    sql = " select QuestionId from tbl_Question where SubjectId=" + ddl_SubjectAdd.SelectedValue.ToString();
                    sql = sql + " and  QuestionCategoryId=" + grd_Category.DataKeys[i].Value.ToString();
                    sql = sql + " and  DifficultyLevel=" + j.ToString();

                    ds = c1.SelectDT(sql);
                    lstAllQuestion.DataSource = ds;
                    lstAllQuestion.DataTextField = "QuestionId";
                    lstAllQuestion.DataValueField = "QuestionId";
                    lstAllQuestion.DataBind();

                    if (ds.Rows.Count < TotalQuestionRequired)
                    {
                        lbl_Msg.Text = "Less Questions can not create paper";
                        break;
                    }
                    else
                    {
                        Random r = new Random();
                        for (k = 0; k < TotalQuestionRequired; k++)
                        {
                            QNo = r.Next(0, lstAllQuestion.Items.Count);
                            lstSelectedQuestion.Items.Add(lstAllQuestion.Items[QNo].Text);
                            lstAllQuestion.Items.RemoveAt(QNo);
                        }

                    }
                }
            }

            int lstcnt = Convert.ToInt32(lstSelectedQuestion.Items.Count);

            for (i = 0; i < lstcnt; i++)
            {
                sql = " INSERT INTO tbl_PaperSet (PaperId,QuestionId) VALUES (";
                sql = sql + " '" + ddl_PaperAdd.SelectedValue.ToString() + "','" + lstSelectedQuestion.Items[i] + "')";
                c1.ExecuteQry(sql);


            }

            lstAllQuestion.Items.Clear();
            lstSelectedQuestion.Items.Clear();
            ddl_StreamAdd.SelectedIndex = -1;
            ddl_SubjectAdd.Items.Clear();
            ddl_PaperAdd.Items.Clear();
            grd_Category.DataSource = "";
            grd_Category.DataBind();
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //string str, id;
        //lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_QId")).Text;

        //if (e.CommandName == "Delete")
        //{
        //    str = "delete from tbl_Question where QuestionId=" + lbl_Id.Text;
        //    c1.ExecuteQry(str);
        //    FillQuestion();
        //}
        //else if (e.CommandName == "Edit")
        //{
        //    string sql, cnt;
        //    sql = "Select count(*) Question_Type from tbl_Question where Question_Type= 'Text' And  QuestionId=" + lbl_Id.Text;
        //    cnt = c1.SelectScalar(sql);
        //    if (Convert.ToInt16(cnt) > 0)
        //    {
        //        opt_QuestionType.SelectedIndex = 1;
        //        div_text.Visible = true;
        //        div_Image.Visible = false;

        //    }
        //    else
        //    {
        //        opt_QuestionType.SelectedIndex = 0;
        //        div_text.Visible = false;
        //        div_Image.Visible = true;

        //    }
        //    txt_Answer.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Answer")).Text;
        //    txt_QuestionText.Content = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Question_Text")).Text;
        //    ddl_StreamAdd.SelectedIndex = ddl_StreamShow.SelectedIndex;
        //    ddl_DifficultyLevel_Add.SelectedIndex = ddl_DifficultyLevel_Show.SelectedIndex;
        //    FillSubjectAdd();

        //    ddl_SubjectAdd.SelectedIndex = ddl_SubjectShow.SelectedIndex;
        //    FillCategoryAdd();
        //    ddl_CategoryAdd.SelectedIndex = ddl_CategoryShow.SelectedIndex;

        //    lbl_Opr.Text = "Edit";
        //    MultiView1.ActiveViewIndex = 1;
        // }
        //else if (e.CommandName == "EnableStatus")
        //{
        //    if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
        //    {
        //        str = "update tbl_paper set EnableStatus=1";
        //        str = str + " WHERE CategoryId=" + lbl_Id.Text;
        //    }
        //    else
        //    {
        //        str = "update tbl_paper set EnableStatus=0";
        //        str = str + " WHERE CategoryId=" + lbl_Id.Text;
        //    }
        //    c1.ExecuteQry(str);
        //    FillQuestion();
        //}
    }
    protected void ddl_StreamShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_StreamShow.SelectedIndex > -1)
        {
            string sql;
            sql = "select * from tbl_Subject ";
            sql = sql + " WHERE EnableStatus =1 and StreamId=" + ddl_StreamShow.SelectedValue.ToString();
            ddl_SubjectShow.DataSource = c1.SelectDs(sql);
            ddl_SubjectShow.DataTextField = "SubjectName";
            ddl_SubjectShow.DataValueField = "SubjectId";
            ddl_SubjectShow.DataBind();
            ddl_SubjectShow.Items.Insert(0, new ListItem("--Select Subcategory--", "0"));
        }
    }

    protected void ddl_SubjectShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_SubjectShow.SelectedIndex > -1)
        {

            FillPaperShow();
        }
    }

    protected void ddl_CategoryShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillQuestion();
    }
    protected void ddl_PaperShow_SelectedIndexChanged(object sender, EventArgs e)
    {
         FillCategoryShow();
         FillQuestion();
    }

    protected void ddl_DifficultyLevel_Show_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillQuestion();
    }
    protected void ddl_StreamAdd_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_StreamAdd.SelectedIndex > -1)
        {
            FillSubjectAdd();
        }
    }
    protected void ddl_SubjectAdd_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_StreamAdd.SelectedIndex > -1)
        {
            FillPaperAdd();
        }
    }

    private void FillCategoryShow()
    {
        string sql;
        sql = " select tbl_Category.* from tbl_Category,tbl_PaperQuestionCategory";
        sql = sql + " where tbl_Category.CategoryId = tbl_PaperQuestionCategory.CategoryId";
        sql = sql + " and PaperId=" + ddl_PaperShow.SelectedValue.ToString();
         
        ddl_CategoryShow.DataSource = c1.SelectDs(sql);
        ddl_CategoryShow.DataTextField = "categoryName";
        ddl_CategoryShow.DataValueField = "categoryId";
        ddl_CategoryShow.DataBind();
        ddl_CategoryShow.Items.Insert(0, new ListItem("--select category--", "0"));


    }
    private void FillPaperShow()
    {
        string sql;
        sql = "select * from tbl_Paper ";
        sql = sql + " WHERE  SubjectId=" + ddl_SubjectShow.SelectedValue.ToString();
        ddl_PaperShow.DataSource = c1.SelectDs(sql);
        ddl_PaperShow.DataTextField = "PaperName";
        ddl_PaperShow.DataValueField = "PaperId";
        ddl_PaperShow.DataBind();
        ddl_PaperShow.Items.Insert(0, new ListItem("--Select Paper--", "0"));


    }
    private void FillSubjectAdd()
    {
        string sql;
        sql = "select * from tbl_Subject ";
        sql = sql + " WHERE EnableStatus =1 and StreamId=" + ddl_StreamAdd.SelectedValue.ToString();
        ddl_SubjectAdd.DataSource = c1.SelectDs(sql);
        ddl_SubjectAdd.DataTextField = "SubjectName";
        ddl_SubjectAdd.DataValueField = "SubjectId";
        ddl_SubjectAdd.DataBind();
        ddl_SubjectAdd.Items.Insert(0, new ListItem("--Select Subcategory--", "0"));
    }
    private void FillPaperAdd()
    {
        string sql;
        sql = "select * from tbl_Paper ";
        sql = sql + " WHERE  SubjectId=" + ddl_SubjectAdd.SelectedValue.ToString();
        sql = sql + " AND FixPaper=1";
        ddl_PaperAdd.DataSource = c1.SelectDs(sql);
        ddl_PaperAdd.DataTextField = "PaperName";
        ddl_PaperAdd.DataValueField = "PaperId";
        ddl_PaperAdd.DataBind();
        ddl_PaperAdd.Items.Insert(0, new ListItem("--Select Paper--", "0"));
    }
    protected void ddl_PaperAdd_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_PaperAdd.SelectedIndex > -1)
        {
            FillPaperQuestionCategory();
        }
    }

    private void FillPaperQuestionCategory()
    {
        string Sql = "SELECT tbl_Category.CategoryId, CategoryName, EasyQuestion ,ModQuestion,DifQuestion, (tbl_PaperQuestionCategory.EasyQuestion +tbl_PaperQuestionCategory.ModQuestion+tbl_PaperQuestionCategory.DifQuestion) as TotalQuestion ,tbl_Category.CategoryName as CategoryName FROM tbl_PaperQuestionCategory,tbl_Category";
        Sql = Sql + "  WHERE tbl_Category.CategoryId= tbl_PaperQuestionCategory.CategoryId And  tbl_PaperQuestionCategory.PaperId=" + ddl_PaperAdd.SelectedValue.ToString();

        grd_Category.DataSource = c1.SelectDs(Sql);
        grd_Category.DataBind();


    }


    //protected void opt_QuestionType_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (opt_QuestionType.SelectedIndex == 0)
    //    {
    //        div_text.Visible = false;
    //        div_Image.Visible = true;
    //    }
    //    else
    //    {

    //        div_text.Visible = true;
    //        div_Image.Visible = false;
    //    }
    //}
}