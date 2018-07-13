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

public partial class TakeExamIC : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        Session.Timeout = 150;
        Session["PaperId"] = "1";
        Session["EmailId"] = "a@mail.com";
        Session["MemberName"] = "Shri Ram";
        if (Session["PaperId"] != null)
        {
            lbl_PaperId_Sess.Text = Session["PaperId"].ToString();
            lbl_MemberId_Sess.Text = Session["MemberName"].ToString();
          //  lbl_EmailId_Sess.Text = Session["EmailId"].ToString();
        }
        else if (Session["PaperId"] == null && lbl_PaperId_Sess.Text != "")
        {
            Session["PaperId"] = lbl_PaperId_Sess.Text;
            Session["MemberName"] = lbl_MemberId_Sess.Text;
            Session["EmailId"] = lbl_EmailId_Sess.Text;
        }
        //Response.Redirect("default.aspx");

        if (Session["PaperId"] == null)
            Response.Redirect("default.aspx");
        
        if (!IsPostBack)
        {
            if (Session["MemberId"] == null)
            {
                Response.Redirect("LoginRegister.aspx");
            }
            lbl_UserName.Text = Session["MemberName"].ToString();
          //  lbl_UserName1.Text = Session["EmailId"].ToString();
        }

        if (!IsPostBack)
        {
            FillDetails();
            FillQuestion1();
            FillQuestionCategory();
            ShowQuestion("0");
        }
    }

    private void FillDetails()
    {
        string str;
        DataSet ds = new DataSet();

        str = " SELECT *, Questions*QuestionMArks as MaxMarks FROM tbl_Paper ";
        str = str + " WHERE PaperId=" + Session["PaperId"].ToString();

        ds = c1.SelectDs(str);
        if (ds.Tables[0].Rows.Count > 0)
        {

            lbl_PaperName.Text = ds.Tables[0].Rows[0]["PaperName"].ToString();
            lbl_MaxMarks.Text = ds.Tables[0].Rows[0]["MaxMarks"].ToString();
            //lbl_TotalTime.Text = rd["MinTime"].ToString();
            lbl_Timer.Text = ds.Tables[0].Rows[0]["MinTime"].ToString();
            //lbl_PaperType.Text = rd["TestTypeId"].ToString();
        }
    }

    private void FillQuestion1()
    {
        int i, n;
        string str;

        //str = " SELECT * FROM tbl_Question, tbl_PaperSet ";
        //str = str + " WHERE tbl_Question.QuestionId = tbl_PaperSet.QuestionId ";
        //str = str + " and PaperId=" + lbl_PaperId_Sess.Text;

        str = " SELECT tbl_Question.*, tbl_ResultDetails.Answer as GivenAnswer ";
        str = str + " FROM tbl_Question, tbl_PaperSet, tbl_Result, tbl_ResultDetails   ";
        str = str + " WHERE tbl_Question.QuestionId = tbl_PaperSet.QuestionId   ";
        str = str + " and tbl_Result.ResultId = tbl_ResultDetails.ResultId ";
        str = str + " and tbl_Question.QuestionId = tbl_ResultDetails.QuestionId ";
        str = str + " and tbl_PaperSet.PaperId=" + lbl_PaperId_Sess.Text;


        dl_QuestionAll.DataSource = c1.SelectDs(str);
        dl_QuestionAll.DataBind();

        lstQuestions.DataSource = c1.SelectDs(str);
        lstQuestions.DataTextField = "QuestionId";
        lstQuestions.DataBind();

        //n = lstQuestions.Items.Count;
        //for (i = 0; i < n; i++)
        //{
        //    lstSelectedAnswser.Items.Add("0");
        //    lstResults.Items.Add("9");
        //}

        if (lstQuestions.Items.Count > 0)
        {
            lstQuestions.SelectedIndex = 0;
            lbl_TotalQuestions.Text = lstQuestions.Items.Count.ToString();
            lbl_Attempted.Text = "0";
            lbl_AttemptedNo.Text = lstQuestions.Items.Count.ToString();
        }
    }

    private void FillQuestionCategory()
    {
        string str;

        str = " SELECT * FROM tbl_PaperQuestionCategory, tbl_Category ";
        str = str + "  WHERE tbl_PaperQuestionCategory.CategoryId = tbl_Category.CategoryId ";
        str = str + " and PaperId=" + Session["PaperId"].ToString();

        dl_QuestionCategory.DataSource = c1.SelectDs(str);
        dl_QuestionCategory.DataBind();

        if (dl_QuestionCategory.Items.Count > 0)
        {
            fillQuestionFromCategory(((Label)dl_QuestionCategory.Items[0].FindControl("lbl_QuestionCategoryId")).Text);
        }
    }

        private void fillQuestionFromCategory(string id)
    {
        string str;
        int index, total, i, StratIndex = 0, showindex;

        str = " SELECT tbl_Question.* FROM tbl_PaperSet, tbl_Question ";
        str = str + " WHERE tbl_PaperSet.QuestionId = tbl_Question.QuestionId And PaperId=" + Session["PaperId"].ToString();
        str = str + " AND  QuestionCategoryId=  " + id;
        str = str + " ORDER BY Question_Title ASC ";

        dl_Questions.DataSource = c1.SelectDs(str);
        dl_Questions.DataBind();
        lbl_TotalQ.Text = dl_Questions.Items.Count.ToString();

        if (dl_Questions.Items.Count > 0)
        {
            lbl_CurrentQ.Text = ((LinkButton)dl_Questions.Items[0].FindControl("lnk_QuestionId")).Text;
            lbl_QuestionNo.Text = ((LinkButton)dl_Questions.Items[0].FindControl("lnk_QuestionNo")).Text;
            lbl_CurrentIndex.Text = "0";
            ShowQuestion("0");

            index = lstQuestions.Items.IndexOf(lstQuestions.Items.FindByText(lbl_CurrentQ.Text));
            total = Convert.ToInt32(lbl_TotalQ.Text);

            for (i = 0; i < lstQuestions.Items.Count; i++)
            {
                if (lstQuestions.Items[i].Text == lbl_CurrentQ.Text)
                {
                    StratIndex = i;
                    break;
                }
            }

            showindex = Convert.ToInt32(lbl_QuestionNo.Text);
            for (i = StratIndex; i < StratIndex + total; i++)
            {
                if (Convert.ToInt16(lstSelectedAnswser.Items[i].Text) > 0)
                {
                    ((LinkButton)dl_Questions.Items[i - (showindex - 1)].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Green;
                }
                if (Convert.ToInt16(lstSelectedAnswser.Items[i].Value) > 0)
                {
                    ((LinkButton)dl_Questions.Items[i - (showindex - 1)].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Orange;
                }

            }
        }
    }

    private void ShowQuestion(string id)
    {
        DataSet ds = new DataSet();
        SqlDataReader dr;
        string str = "";
        int index;

        if (Convert.ToInt32(lbl_CurrentQ.Text) > -1)
        {
            str = " SELECT * FROM tbl_Question ";
            str = str + " WHERE QuestionId =" + lbl_CurrentQ.Text;

            ds = c1.SelectDs(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //rdo_SelectAnswers.SelectedIndex = -1;

                index = lstQuestions.Items.IndexOf(lstQuestions.Items.FindByText(lbl_CurrentQ.Text));

                if (Convert.ToInt32(lstSelectedAnswser.Items[index].Text) > 0)
                {
                    //rdo_SelectAnswers.SelectedIndex = Convert.ToInt32(lstSelectedAnswser.Items[index].Text) - 1;
                }
                //lblAnswer.Text = ds.Tables[0].Rows[0]["Answer"].ToString();

                if (ds.Tables[0].Rows[0]["Question_Type"].ToString() == "Image")
                {
                    lblQuestionUrl.Text = ds.Tables[0].Rows[0]["Question_Url"].ToString();
                    Session["QuestionUrl"] = lblQuestionUrl.Text;
                    str = Session["QuestionUrl"].ToString();
                    img_Question.ImageUrl = str;
                    lbl_QuestionText.Visible = false;
                    img_Question.Visible = true;

                }
                else
                {
                    lbl_QuestionText.Text = ds.Tables[0].Rows[0]["Question_Text"].ToString();
                    lbl_QuestionText.Visible = true;
                    img_Question.Visible = false;
                }
            }
        }
    }
      
    protected void btn_Next1_Click(object sender, EventArgs e)
    {
        //SaveAnswer();
        if (Convert.ToInt16(lbl_CurrentIndex.Text) < (Convert.ToInt16(lbl_TotalQ.Text) - 1))
        {
            lbl_CurrentIndex.Text = (Convert.ToInt16(lbl_CurrentIndex.Text) + 1).ToString();
            lbl_CurrentQ.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionId")).Text;
            lbl_QuestionNo.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).Text;
            ShowQuestion("0");
        }

        //if (lstQuestions.SelectedIndex < lstQuestions.Items.Count - 1)
        //{
        //    lstQuestions.SelectedIndex = lstQuestions.SelectedIndex + 1;
        //    ShowQuestion("0");
        //}

    }

    protected void btn_Prev1_Click(object sender, EventArgs e)
    {
        //SaveAnswer();

        if (Convert.ToInt16(lbl_CurrentIndex.Text) > 0)
        {
            lbl_CurrentIndex.Text = (Convert.ToInt16(lbl_CurrentIndex.Text) - 1).ToString();
            lbl_CurrentQ.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionId")).Text;
            lbl_QuestionNo.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).Text;
            ShowQuestion("0");
        }


        //if (lstQuestions.SelectedIndex > 0)
        //{
        //    lstQuestions.SelectedIndex = lstQuestions.SelectedIndex - 1;
        //    ShowQuestion("0");
        //}
    }

    protected void btn_UnSelect_Click(object sender, EventArgs e)
    {
        //if (Convert.ToInt16(lbl_CurrentIndex.Text) > 0)
        //{
        //    rdo_SelectAnswers.SelectedIndex = -1;

        //    lbl_CurrentIndex.Text = (Convert.ToInt16(lbl_CurrentIndex.Text)).ToString();
        //    lbl_CurrentQ.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionId")).Text;
        //    lbl_NegativeMarks.Text = ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).Text;

        //    lstSelectedAnswser.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].Text = "0";
        //    lstSelectedAnswser.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].Value = "0";

        //    lstResults.Items[lstQuestions.SelectedIndex].Text = "9";

        //    //ShowQuestion("0");
        //    ((LinkButton)dl_Questions.Items[Convert.ToInt16(lbl_CurrentIndex.Text)].FindControl("lnk_QuestionNo")).BackColor = System.Drawing.Color.Gray;
        //    SaveAnswer();

        //}
    }

    protected void lstQuestions_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowQuestion("0");
    }

   
    protected void dl_Questions_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id;
        id = ((LinkButton)dl_Questions.Items[e.Item.ItemIndex].FindControl("lnk_QuestionId")).Text;
        lbl_QuestionNo.Text = ((LinkButton)dl_Questions.Items[e.Item.ItemIndex].FindControl("lnk_QuestionNo")).Text;
        lbl_CurrentQ.Text = id;
        lbl_CurrentIndex.Text = e.Item.ItemIndex.ToString();
        ShowQuestion(id);
    }

    protected void dl_QuestionCategory_ItemCommand(object source, DataListCommandEventArgs e)
    {
        string id;
        int i, n;
        id = ((Label)dl_QuestionCategory.Items[e.Item.ItemIndex].FindControl("lbl_QuestionCategoryId")).Text;
        n = dl_QuestionCategory.Items.Count;
        for (i = 0; i < n; i++)
        {
            ((LinkButton)dl_QuestionCategory.Items[i].FindControl("lnk_QuestionCategoryName")).BackColor = System.Drawing.Color.Blue;
        }

        ((LinkButton)dl_QuestionCategory.Items[e.Item.ItemIndex].FindControl("lnk_QuestionCategoryName")).BackColor = System.Drawing.Color.Green;
        fillQuestionFromCategory(id);
    }



    protected void dl_QuestionCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
