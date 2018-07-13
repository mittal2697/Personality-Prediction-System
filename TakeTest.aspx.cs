using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Collections.Generic;


public partial class TakeTest : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Timeout = 150;

        if (Session["MemberId"] == null)
            Response.Redirect("LoginRegister.aspx");


        if (Session["MemberId"] != null)
        {
             
            lbl_MemberId_Sess.Text = Session["MemberName"].ToString();
            lbl_EmailId_Sess.Text = Session["EmailId"].ToString();
        }
        else if (Session["MemberId"] == null && lbl_MemberId_Sess.Text != "")
        {
             
            Session["MemberName"] = lbl_MemberId_Sess.Text;
            Session["EmailId"] = lbl_EmailId_Sess.Text;
        }
        //Response.Redirect("default.aspx");

       

        if (!IsPostBack)
        {
            if (Session["MemberId"] == null)
            {
                Response.Redirect("LoginRegister.aspx");
            }
            lbl_UserName.Text = Session["MemberName"].ToString();
            lbl_UserName1.Text = Session["EmailId"].ToString();
        }

        if (!IsPostBack)
        {
            FillQuestion1();
        }
    }

   

    private void FillQuestion1()
    {
        int i, n;
        string str;
        
        str = "  SELECT  top 10 QuestionId, ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS RowNo, '0' As SelectedAnswer, '9' As Result, '0' as Review, ";
		str = str + "  Answer, Question_Url, Question_Type, Question_Text, Explanation_Text, ";
		str = str + " Explanation_Url, Explanation_Type, ";
        str = str + " 'Test ' as PaperName, '10' as Questions ,'20' as MaxMarks, '10' as MinTime, '2' as QuestionMarks, '.25' as NegativeMarks ";
        str = str + " FROM tbl_Question    ";     
        str = str + " ORDER BY newid() ASC ";

        DataTable dt;
        DataTable dt1;
        dt1 = c1.SelectDT(str);

        dt = dt1.AsEnumerable().OrderRandomly().CopyToDataTable();
        //dt.DefaultView.Sort = "QuestionCategoryId ASC";
        dt = dt.DefaultView.ToTable();

        n = dt.Rows.Count;

        for (i = 0; i < n; i++)
            dt.Rows[i]["RowNo"] = (i + 1).ToString();

        DataColumn[] keyColumns = new DataColumn[1];
        keyColumns[0] = dt.Columns["QuestionId"];
        dt.PrimaryKey = keyColumns;

        Session["AllQuestion"] = dt;
        //DataTable dt = Session["AllQuestion"] as DataTable;

        if (dt.Rows.Count > 0)
        {
            lbl_PaperName.Text = dt.Rows[0]["PaperName"].ToString();
            lbl_MaxMarks.Text = dt.Rows[0]["MaxMarks"].ToString();
            lbl_Timer.Text = dt.Rows[0]["MinTime"].ToString();
            lbl_MarksPerQuestion.Text = dt.Rows[0]["QuestionMarks"].ToString();
            lbl_NegativeMarks.Text = dt.Rows[0]["NegativeMarks"].ToString();

            lbl_TotalQuestions.Text = dt.Rows.Count.ToString();
            lbl_Attempted.Text = "0";
            lbl_NotAttempted.Text = dt.Rows.Count.ToString();

            fillQuestionFromCategory();
        }
    }

    private void fillQuestionFromCategory( )
    {
        int i;
        DataTable dt = Session["AllQuestion"] as DataTable;
        DataView dv = new DataView(dt);

        dl_Questions.DataSource = dv;
        dl_Questions.DataBind();
        lbl_CurrentIndex.Text = "0";

        lbl_TotalQ.Text = dl_Questions.Items.Count.ToString();

        if (dl_Questions.Items.Count > 0)
        {
            lbl_CurrentQId.Text = ((LinkButton)dl_Questions.Items[0].FindControl("lnk_QuestionId")).Text;
            lbl_QuestionNo.Text = ((LinkButton)dl_Questions.Items[0].FindControl("lnk_QuestionNo")).Text;
            ShowQuestion(lbl_CurrentQId.Text);

            for (i = 0; i < dl_Questions.Items.Count; i++)
            {
                String ans = ((Label)dl_Questions.Items[i].FindControl("lbl_SelectedAnswer")).Text;
                String review = ((Label)dl_Questions.Items[i].FindControl("lbl_Review")).Text;

                if (Convert.ToInt16(ans) > 0)
                {
                    ((LinkButton)dl_Questions.Items[i].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Green;
                }

                if (Convert.ToInt16(review) > 0)
                {
                    ((LinkButton)dl_Questions.Items[i].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Orange;
                }

            }
        }
    }

    private void ShowQuestion(string QNo)
    {
        string str;
        DataTable dt = Session["AllQuestion"] as DataTable;
        DataView dv = new DataView(dt);

        dv.Sort = "QuestionId";
        //record mil 
        int index = dv.Find(QNo);

        rdo_SelectAnswers.SelectedIndex = -1;

        if (Convert.ToInt32(dt.Rows[index]["SelectedAnswer"]) > 0)
        {
            rdo_SelectAnswers.SelectedIndex = Convert.ToInt32(dt.Rows[index]["SelectedAnswer"]) - 1;
        }

        if (dt.Rows[index]["Question_Type"].ToString() == "Image")
        {
            lblQuestionUrl.Text = dt.Rows[index]["Question_Url"].ToString();
            Session["QuestionUrl"] = lblQuestionUrl.Text;
            str = Session["QuestionUrl"].ToString();
            img_Question.ImageUrl = str;
            lbl_QuestionText.Visible = false;
            img_Question.Visible = true;
        }
        else
        {
            lbl_QuestionText.Text = dt.Rows[index]["Question_Text"].ToString();
            lbl_QuestionText.Visible = true;
            img_Question.Visible = false;
        }
    }

    private void GenerateResult()
    {
        int Right = 0, Wrong = 0, NotAttampt = 0, i, n;
        float RightMarks = 0, WrongMarks = 0, TotalMarks = 0, ObtainedMarks = 0, per = 0;
        string sql, ResultId;
        float NegativeMarks = Convert.ToSingle(lbl_NegativeMarks.Text);
        int QuestionMarks = Convert.ToInt32(lbl_MarksPerQuestion.Text);

        DataTable dt = Session["AllQuestion"] as DataTable;
        n = dt.Rows.Count;

        for (i = 0; i < n; i++)
        {
            if (dt.Rows[i]["SelectedAnswer"].ToString() == "0")
            {
                NotAttampt++;
            }
            else if (dt.Rows[i]["SelectedAnswer"].ToString() != dt.Rows[i]["Answer"].ToString())
            {
                Wrong++;
                dt.Rows[i]["Result"] = "0";
            }
            else if (dt.Rows[i]["SelectedAnswer"].ToString() == dt.Rows[i]["Answer"].ToString())
            {
                Right++;
                dt.Rows[i]["Result"] = "1";
            }
        }

        // 1 Marks for Each Question
        TotalMarks = n * QuestionMarks;
        RightMarks = Right * QuestionMarks;
        WrongMarks = (float)Wrong * NegativeMarks;
        ObtainedMarks = RightMarks - WrongMarks;
        per = (ObtainedMarks / TotalMarks) * 100;

        //sql = " DELETE FROM tbl_Result WHERE EmailId='" + Session["EmailId"].ToString() + "'";
        //sql = sql + " AND PaperId=" + Session["PaperId"].ToString();
        //c1.ExecuteQry(sql);

        sql = " INSERT INTO tbl_Result(EmailId, ExamDate, Correct, Wrong, NotAttempt,Marks, per) VALUES ";
        sql = sql + " ('" + Session["EmailId"].ToString() + "',";
        sql = sql + " '" + DateTime.Now.ToShortDateString() + "',";
        sql = sql + " " + Right + "," + Wrong + "," + NotAttampt + "," + ObtainedMarks.ToString() + "," + per.ToString() + ")";

        c1.ExecuteQry(sql);

        sql = "SELECT MAX(ResultId) FROM tbl_Result";
        ResultId = c1.SelectScalar(sql);


        sql = " INSERT INTO tbl_ResultDetails(ResultId,QuestionId,Answer,Status) VALUES ";
        for (i = 0; i < n; i++)
        {
            sql = sql + "(" + ResultId + "," + dt.Rows[i]["QuestionId"].ToString() + ",";
            sql = sql + dt.Rows[i]["SelectedAnswer"].ToString() + "," + dt.Rows[i]["Result"].ToString() + "),";
        }
        sql = sql.Substring(0, sql.Length - 1);

        c1.ExecuteQry(sql);
        Response.Redirect("MyAccount_Results.aspx");
    }

    protected void btnFinish1_Click(object sender, EventArgs e)
    {
        GenerateResult();
    }

    protected void btn_Next1_Click(object sender, EventArgs e)
    {
        SaveAnswer("next");
        if (Convert.ToInt16(lbl_CurrentIndex.Text) < dl_Questions.Items.Count - 1)
        {
            lbl_CurrentIndex.Text = (Convert.ToInt16(lbl_CurrentIndex.Text) + 1).ToString();
            lbl_CurrentQId.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionId")).Text;
            lbl_QuestionNo.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).Text;
            ShowQuestion(lbl_CurrentQId.Text);
        }
    }

    protected void btn_Prev1_Click(object sender, EventArgs e)
    {
        SaveAnswer("prev");
        if (Convert.ToInt16(lbl_CurrentIndex.Text) > 0)
        {
            lbl_CurrentIndex.Text = (Convert.ToInt16(lbl_CurrentIndex.Text) - 1).ToString();
            lbl_CurrentQId.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionId")).Text;
            lbl_QuestionNo.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).Text;
            ShowQuestion(lbl_CurrentQId.Text);
        }
    }

    protected void btn_UnSelect_Click(object sender, EventArgs e)
    {
        int index;

        if (Convert.ToInt16(lbl_CurrentIndex.Text) >= 0)
        {
            ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Gray;
            SaveAnswer("unselect");
        }
    }

    private void SaveAnswer(String fn)
    {
        int index, NAT = 0, AT = 0, i;
        DataTable dt = Session["AllQuestion"] as DataTable;
        DataView dv = new DataView(dt);

        dv.Sort = "QuestionId";
        index = dv.Find(lbl_CurrentQId.Text);

        if (index > -1)
        {
            if (fn == "review")
            {
                dt.Rows[index]["Review"] = "1";
                dt.Rows[index]["SelectedAnswer"] = "0";
                Session["AllQuestion"] = dt;
                ((LinkButton)dl_Questions.Items[Convert.ToInt32(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Orange;

                rdo_SelectAnswers.SelectedIndex = -1;
            }
            else if (fn == "unselect")
            {
                dt.Rows[index]["SelectedAnswer"] = "0";
                Session["AllQuestion"] = dt;
                ((LinkButton)dl_Questions.Items[Convert.ToInt32(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Gray;

                rdo_SelectAnswers.SelectedIndex = -1;
            }
            else if (fn == "next" || fn == "prev")
            {
                if (rdo_SelectAnswers.SelectedIndex >= 0)
                {
                    dt.Rows[index]["SelectedAnswer"] = (rdo_SelectAnswers.SelectedIndex + 1).ToString();
                    Session["AllQuestion"] = dt;

                    ((LinkButton)dl_Questions.Items[Convert.ToInt32(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Green;
                }
            }

            for (i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["SelectedAnswer"].ToString() == "0")
                {
                    NAT++;
                }
                else
                {
                    AT++;
                }
            }
            lbl_Attempted.Text = AT.ToString();
            lbl_NotAttempted.Text = NAT.ToString();
        }
    }

    protected void btn_Review_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt16(lbl_CurrentIndex.Text) >= 0)
            SaveAnswer("review");
    }

    protected void dl_Questions_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id;
        id = ((LinkButton)dl_Questions.Items[e.Item.ItemIndex].FindControl("lnk_QuestionId")).Text;
        lbl_QuestionNo.Text = ((LinkButton)dl_Questions.Items[e.Item.ItemIndex].FindControl("lnk_QuestionNo")).Text;
        lbl_CurrentQId.Text = id;
        lbl_CurrentIndex.Text = e.Item.ItemIndex.ToString();
        ShowQuestion(id);
    }

    
  


    public void sessiondtmanage()
    {
        // this session contant your dt as you filled it only one time 
        // this dt cintains all the categories
        DataTable dt = Session["Tissues"] as DataTable;
        DataView dv = new DataView(dt);

        dv.RowFilter = "QuestionCategoryId = 32";
        // so this dv have only all the questions of category 32
    }

    public void sessiondtupdate()
    {
        DataTable dt = Session["Tissues"] as DataTable;
        DataView dv = new DataView(dt);

        //record mil 
        int index = dv.Find("'question id value'");
        dv[index]["country"] = "germany";

        dt = dv.ToTable();
        //dtN is result table after update 

        DataTable dt1 = new DataTable();
        // Get all DataRows where the name is the name you want.
        IEnumerable<DataRow> rows = dt1.Rows.Cast<DataRow>().Where(r => r["RowNo"].ToString() == "1");

        // Alternative approach.
        // Simply loop through the rows, check the value of the Name field and change its value accordingly.
        foreach (DataRow row in dt1.Rows)
        {
            row.SetField("Qattand", "Green");
        }

    }
}

public static class Extension
{

    private static Random random = new Random();

    public static IEnumerable<T> OrderRandomly<T>(this IEnumerable<T> items)
    {
        List<T> randomly = new List<T>(items);

        while (randomly.Count > 0)
        {

            Int32 index = random.Next(randomly.Count);
            yield return randomly[index];

            randomly.RemoveAt(index);
        }
    }
}