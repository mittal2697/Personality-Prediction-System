using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Questions : System.Web.UI.Page
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
            FillCategory();
            if (opt_QuestionType.SelectedIndex == 0)
            {
                div_text.Visible = false;
                div_Image.Visible = true;
            }
            else
            {
                div_text.Visible = true;
                div_Image.Visible = false;
            }

            if (opt_ExplanationType.SelectedIndex == 0)
            {
                Exp_txt.Visible = false;
                Exp_Image.Visible = true;
            }
            else
            {
                Exp_txt.Visible = true;
                Exp_Image.Visible = false;
            }
        }
    }

    private void FillCategory()
    {
        string sql;
        sql = "select * from tbl_Category ";
        //sql = sql + " WHERE EnableStatus =1 ";
        ddl_CategoryAdd.DataSource = c1.SelectDs(sql);
        ddl_CategoryAdd.DataTextField = "CategoryName";
        ddl_CategoryAdd.DataValueField = "CategoryId";
        ddl_CategoryAdd.DataBind();
        ddl_CategoryAdd.Items.Insert(0, new ListItem("--Select Category--", "0"));

        ddl_CategoryShow.DataSource = c1.SelectDs(sql);
        ddl_CategoryShow.DataTextField = "CategoryName";
        ddl_CategoryShow.DataValueField = "CategoryId";
        ddl_CategoryShow.DataBind();
        ddl_CategoryShow.Items.Insert(0, new ListItem("--Select Category--", "0"));

    }

    public void FillQuestion()
    {
        string str, sql;
        int cnt;

        str = "SELECT *,'../'+Question_Url AS Question_Url1,'../'+Explanation_Url AS Explanation_Url1  FROM tbl_Question ";

        if (ddl_CategoryShow.SelectedIndex > 0)
        {
            str = str + " WHERE QuestionCategoryId=" + ddl_CategoryShow.SelectedValue.ToString();
        }
        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();

    }

    //public void FillStream()
    //{
    //    string sql;
    //    sql = "select * from tbl_Stream ";
    //    sql = sql + " WHERE EnableStatus =1 ";
    //    if (Session["AdminId"].ToString() != "1")
    //        sql = sql + " and AdminId=" + Session["AdminId"].ToString();

    //    ddl_StreamShow.DataSource = c1.SelectDs(sql);
    //    ddl_StreamShow.DataTextField = "StreamName";
    //    ddl_StreamShow.DataValueField = "StreamId";
    //    ddl_StreamShow.DataBind();
    //    ddl_StreamShow.Items.Insert(0, new ListItem("--Select Category--", "0"));

    //    ddl_StreamAdd.DataSource = c1.SelectDs(sql);
    //    ddl_StreamAdd.DataTextField = "StreamName";
    //    ddl_StreamAdd.DataValueField = "StreamId";
    //    ddl_StreamAdd.DataBind();
    //    ddl_StreamAdd.Items.Insert(0, new ListItem("--Select Category--", "0"));

    //}

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

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql, fn, path, id, ext;
        string isQueImage = "No";
        string isQueText = "No";
        string isExpImage = "No";
        string isExpText = "No";

        if (lbl_Opr.Text == "Add")
        {
            if (opt_QuestionType.SelectedIndex == 0)
            {
                isQueImage = "Yes";
                isQueText = "No";
            }
            else
            {
                isQueImage = "No";
                isQueText = "Yes";
            }

            if (opt_ExplanationType.SelectedIndex == 0)
            {
                isExpImage = "Yes";
                isExpText = "No";
            }
            else
            {
                isExpImage = "No";
                isExpText = "Yes";
            }

            if (isQueImage == "Yes")
                if (!FU_Question.HasFile)
                {
                    lbl_Msg.Text = "Select Question Image";
                    return;
                }

            if (isExpImage == "Yes")
                if (!FU_Explanation.HasFile)
                {
                    lbl_Msg.Text = "Select Explanation Image";
                    return;
                }

            sql = "insert into tbl_Question (Question_Type, Explanation_Type, Question_Text, Explanation_Text, QuestionCategoryId,Answer,Question_Title) Output Inserted.QuestionId   values ";
            sql = sql + " ('Text','Text','" + c1.Clean(txt_QuestionText.Content) + "','" + c1.Clean(txt_Explanation.Content) + "',";
            sql = sql + " '" + ddl_CategoryAdd.SelectedValue.ToString() + "','" + txt_Answer.Text + "','" + txt_QuestionNo.Text + "')";
            

            id = c1.SelectScalar(sql);

            if (isQueImage == "Yes")
                if (FU_Question.HasFile)
                    UploadPhoto(FU_Question, id, "tbl_Question", "Question_Url", "Questions", "Question_Type");

            if (isExpImage == "Yes")
                if (FU_Explanation.HasFile)
                    UploadPhoto(FU_Explanation, id, "tbl_Question", "Explanation_Url", "QuestionExplain", "Explanation_Type");

            txt_QuestionText.Content = "";
            txt_Explanation.Content = "";
            txt_QuestionNo.Text = "";
            txt_Answer.Text = "";

            lbl_Msg.Text = "Question Added Successfully";
        }
        else
        {
            id = lbl_Id.Text;

            if (opt_QuestionType.SelectedIndex == 0)
            {
                isQueText = "No";
                if (FU_Question.HasFile)
                {
                    UploadPhoto(FU_Question, id, "tbl_Question", "Question_Url", "Questions", "Question_Type");
                    
                    sql = "UPDATE tbl_Question set Question_Text='' ";
                    sql = sql + " where QuestionId=" + lbl_Id.Text;
                    c1.ExecuteQry(sql);
                }
                else
                    lbl_Msg.Text = "Select Question Image ";
            }
            else
            {
                isQueText = "Yes";
            }

            if (opt_ExplanationType.SelectedIndex == 0)
            {
                isExpText = "No";
                if (FU_Explanation.HasFile)
                {
                    UploadPhoto(FU_Explanation, id, "tbl_Question", "Explanation_Url", "QuestionExplain", "Explanation_Type");
                    sql = "UPDATE tbl_Question set Explanation_Text='' ";
                    sql = sql + " where QuestionId=" + lbl_Id.Text;
                    c1.ExecuteQry(sql);
                }
                else
                    lbl_Msg.Text = "Select Explanation Image ";
            }
            else
            {
                isExpText = "Yes";
            }

            sql = "UPDATE tbl_Question set ";
             sql = sql + " QuestionCategoryId='" + ddl_CategoryAdd.SelectedValue.ToString() + "', ";
            sql = sql + " Question_Title='" + txt_QuestionNo.Text + "', ";
            sql = sql + " Answer='" + txt_Answer.Text + "' ";
            
            if (isQueText == "Yes")
                sql = sql + " ,Question_Type='Text', Question_Url='', Question_Text ='" + txt_QuestionText.Content + "' ";

            if (isExpText == "Yes")
                sql = sql + " ,Explanation_Type='Text', Explanation_Url='', Explanation_Text ='" + txt_Explanation.Content + "' ";

            sql = sql + " where QuestionId=" + lbl_Id.Text;
            c1.ExecuteQry(sql);

        }
    }

    public void UploadPhoto(FileUpload fu_Banner, string id, string table, string field, string folder, string type)
    {
        string sql, fn, path, ext;
        int dot;
        if (fu_Banner.HasFile)
        {
            fn = fu_Banner.FileName;
            dot = fn.LastIndexOf(".");
            ext = fn.Substring(dot, fn.Length - dot);
            path = Server.MapPath("../" + folder);
            path = path + "\\" + id + ext;
            fu_Banner.SaveAs(path);

            sql = "UPDATE " + table + " SET " + field + " ='" + folder + "/" + id + ext + "', " + type + "='Image' ";
            sql = sql + " WHERE QuestionId=" + id;

            c1.ExecuteQry(sql);
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string str, id, QuestionType, ExplanationType;
        lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_QId")).Text;

        if (e.CommandName == "Delete")
        {
            str = "delete from tbl_Question where QuestionId=" + lbl_Id.Text;
            c1.ExecuteQry(str);
            FillQuestion();
        }
        else if (e.CommandName == "Edit")
        {
            string sql, cnt;


            txt_QuestionNo.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_QuestionNo")).Text;
            QuestionType = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Question_Type")).Text;
            ExplanationType = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Explanation_Type")).Text;

            if (QuestionType == "Text")
            {
                opt_QuestionType.SelectedIndex = 1;
                div_text.Visible = true;
                div_Image.Visible = false;

            }
            else
            {
                //opt_QuestionType.SelectedIndex = 0;
                div_text.Visible = false;
                div_Image.Visible = true;

            }

            if (ExplanationType  == "Text")
            {
                opt_ExplanationType.SelectedIndex = 1;
                Exp_txt.Visible = true;
                Exp_Image.Visible = false;

            }
            else
            {
                //opt_ExplanationType.SelectedIndex = 0;
                Exp_txt.Visible = false;
                Exp_Image.Visible = true;
            }

            txt_Explanation.Content = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Explanation")).Text;
            txt_Answer.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Answer")).Text;
            txt_QuestionText.Content = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Question_Text")).Text;
            ddl_CategoryAdd.SelectedIndex = ddl_CategoryShow.SelectedIndex;

            lbl_Opr.Text = "Edit";
            MultiView1.ActiveViewIndex = 1;
        }

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
    //protected void ddl_StreamShow_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddl_StreamShow.SelectedIndex > -1)
    //    {
    //        string sql;
    //        sql = "select * from tbl_Subject ";
    //        sql = sql + " WHERE EnableStatus =1 and StreamId=" + ddl_StreamShow.SelectedValue.ToString();
    //        ddl_SubjectShow.DataSource = c1.SelectDs(sql);
    //        ddl_SubjectShow.DataTextField = "SubjectName";
    //        ddl_SubjectShow.DataValueField = "SubjectId";
    //        ddl_SubjectShow.DataBind();
    //        ddl_SubjectShow.Items.Insert(0, new ListItem("--Select Subcategory--", "0"));
    //    }
    //}

    //protected void ddl_SubjectShow_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    FillSubjectShow();

    //}

    protected void ddl_CategoryShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillQuestion();
    }

    //protected void ddl_DifficultyLevel_Show_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    FillQuestion();
    //}
    //protected void ddl_StreamAdd_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddl_StreamAdd.SelectedIndex > -1)
    //    {
    //        FillSubjectAdd();
    //    }
    //}
    //protected void ddl_SubjectAdd_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddl_StreamAdd.SelectedIndex > -1)
    //    {
    //        FillCategoryAdd();
    //    }
    //}

    //private void FillSubjectShow()
    //{
    //    string sql;
    //    sql = "select * from tbl_category ";
    //    sql = sql + " where enablestatus =1 and subjectid=" + ddl_SubjectShow.SelectedValue.ToString();
    //    ddl_CategoryShow.DataSource = c1.SelectDs(sql);
    //    ddl_CategoryShow.DataTextField = "categoryName";
    //    ddl_CategoryShow.DataValueField = "categoryId";
    //    ddl_CategoryShow.DataBind();
    //    ddl_CategoryShow.Items.Insert(0, new ListItem("--Select Q Section--", "0"));


    //}
    //private void FillSubjectAdd()
    //{
    //    string sql;
    //    sql = "select * from tbl_Subject ";
    //    sql = sql + " WHERE EnableStatus =1 and StreamId=" + ddl_StreamAdd.SelectedValue.ToString();
    //    ddl_SubjectAdd.DataSource = c1.SelectDs(sql);
    //    ddl_SubjectAdd.DataTextField = "SubjectName";
    //    ddl_SubjectAdd.DataValueField = "SubjectId";
    //    ddl_SubjectAdd.DataBind();
    //    ddl_SubjectAdd.Items.Insert(0, new ListItem("--Select Subject--", "0"));
    //}
   


    protected void opt_Explanation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (opt_ExplanationType.SelectedIndex == 0)
        {
            Exp_txt.Visible = false;
            Exp_Image.Visible = true;
        }
        else
        {
            Exp_txt.Visible = true;
            Exp_Image.Visible = false;
        }
    }

    protected void opt_QuestionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (opt_QuestionType.SelectedIndex == 0)
        {
            div_text.Visible = false;
            div_Image.Visible = true;
        }
        else
        {

            div_text.Visible = true;
            div_Image.Visible = false;
        }
    }
}
