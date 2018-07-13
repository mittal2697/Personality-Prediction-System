using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Papers : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SubjectId"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        if (!IsPostBack)
        {
            FillPaper();
            FillNotification();
        }
    }

    private void FillNotification()
    {
        string str;
        str = "select * from tbl_Notification ";
        str = str + " WHERE EnableStatus =1 ";
        dl_Notification.DataSource = c1.SelectDs(str);
        dl_Notification.DataBind();
    }


    private void FillPaper()
    {
        int i, n;
        string pid, cnt;
        string str;

        str = "select * FROM  tbl_Paper ";
        str = str + " WHERE SubjectId=" + Session["SubjectId"].ToString();
        //str = str + " AND EnableStatus =1 ";
        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();


        if (Session["MemberId"] != null)
        {
            n = Repeater1.Items.Count;
            for (i = 0; i < n; i++)
            {
                pid = ((Label)Repeater1.Items[i].FindControl("lblPaperId")).Text;

                str = "SELECT Count(*) FROM tbl_Result ";
                str = str + " WHERE EmailId='" + Session["EmailId"] + "' and PaperId=" + pid;
                cnt = c1.SelectScalar(str);

                //if (Convert.ToInt16(cnt) == 0)
                //{
                //    ((ImageButton)Repeater1.Items[i].FindControl("Img_Test")).ImageUrl = "~/img/TakeTest.png";
                //}
                //else
                //{
                //    if (Session["Retake"].ToString() == "Retake")
                //    {
                //        ((ImageButton)Repeater1.Items[i].FindControl("Img_Test")).ImageUrl = "~/img/ReTakeTest.png";
                //    }
                //    else
                //    {
                //        ((ImageButton)Repeater1.Items[i].FindControl("Img_Test")).Visible = false;
                //    }
                //}

                //if (Convert.ToInt16(cnt) == 0)
                //{
                //    ((LinkButton)Repeater1.Items[i].FindControl("lnk_Test")).Text = "Take";
                //}
                //else
                //{
                //    if (Session["Retake"].ToString() == "Retake")
                //    {
                //        ((LinkButton)Repeater1.Items[i].FindControl("lnk_Test")).Text = "Retake";
                //    }
                //    else
                //    {
                //        ((LinkButton)Repeater1.Items[i].FindControl("lnk_Test")).Text = "";
                //    }
                //}
            }
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string pid, marks, Negative;

        pid = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lblPaperId")).Text;
        Session.Add("PaperId", pid);

        marks = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lblQuestionMarks")).Text;
        Session.Add("QuestionMarks", marks);

        Negative = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lblNegativeMarks")).Text;
        Session.Add("Negative", Negative);

        if (Session["MemberId"] == null)
        {
            Session.Add("RefUrl", "TakeExam");
            Response.Redirect("LoginRegister.aspx");
        }
        else
        {
            //ScriptManager.RegisterStartupScript(this, typeof(string), "New_Window", "window.open( 'TakeExamI.aspx', null, 'height=800,width=1280,status=yes,toolbar=no,menubar=no,location=no' );", true);
            Response.Redirect("Test_Insturction.aspx");
        }
    }
}
