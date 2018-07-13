using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Test_Insturction : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberId"] == null)
        {
            Response.Redirect("LoginRegister.aspx");
        }
        if (Session["PaperId"] == null)
        {
            Response.Redirect("Default.aspx");
        }


        if (!IsPostBack)
        {
            FillStream();
            //CheckRetake();
        }
    }
    private void CheckRetake()
    {
        //string str, cnt;

        //str = "SELECT Count(*) FROM tbl_Result ";
        //str = str + " WHERE EmailId='" + Session["EmailId"] + "' and PaperId=" + Session["PaperId"].ToString();
        //cnt = c1.SelectScalar(str);

        //if (Session["Retake"].ToString() == "Take" && Convert.ToInt16(cnt) == 1)
        //{
        //    lbl_PaperName.Text = "Retake Option is not Available";
        //    btn_Go.Enabled = false;
        //}
    }

    private void FillStream()
    {
        string str;
        SqlDataReader rd;

        str = " select * from tbl_TestInstruction, tbl_Paper  ";
        str = str + " WHERE tbl_TestInstruction.Id1 = tbl_Paper.InstructionId ";
        str = str + " and PaperId=" + Session["PaperId"].ToString();

        rd = c1.SelectDr1(str);
        if (rd.Read())
        {
            lbl_PaperType.Text = rd["FixPaper"].ToString();

            if (rd["InstructionType"].ToString() == "Text")
            {
                lbl_Instruction.Text = rd["TestInstruction"].ToString();
            }
            else
                img_Instruction.ImageUrl = rd["PhotoUrl"].ToString();
        }
    }


    protected void btn_Go_Click(object sender, EventArgs e)
    {
        if (lbl_PaperType.Text == "0")
            Response.Redirect("TakeTest.aspx");
        else
            Response.Redirect("TakeTest.aspx");
            //Response.Redirect("TakeExamIC.aspx");

    }
}
