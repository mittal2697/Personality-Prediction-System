using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyAccount_ResultDetails : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberId"] == null)
        {
            Response.Redirect("LoginRegister.aspx");
        }
        if (!IsPostBack)
        {
            lbl_PaperId.Text = Session["ResultId"].ToString();
           
            FillQuestion();
        }
    }

   
    public void FillQuestion()
    {
        string str, sql;
        int cnt;

        if (lbl_PaperId.Text != "")
        {
            str = " SELECT Question_Url AS Question_Url1, Explanation_Url AS Explanation_Url1 , tbl_Question.*, tbl_ResultDetails.Answer as GivenAnswer FROM tbl_Result, tbl_ResultDetails , tbl_Question ";
            str = str + " WHERE tbl_Result.ResultId = tbl_ResultDetails.ResultId ";
            str = str + " and tbl_ResultDetails.QuestionId = tbl_Question.QuestionId ";
            str = str + " and EmailId='"+Session["EmailId"].ToString()+"' ";
            str = str + " and tbl_Result.ResultId=" + lbl_PaperId.Text;

            Repeater1.DataSource = c1.SelectDs(str);
            Repeater1.DataBind();
        }

    }

 

}
