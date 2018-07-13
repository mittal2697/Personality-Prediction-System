using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
public partial class MyAccount_Results : System.Web.UI.Page
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
            FillPaper();
        }
    }

    private void FillPaper()
    {
        string str;

        str = "SELECT ResultId,Per, ExamDate, '10' as Questions, Correct, Wrong, NotAttempt, Marks  ";
        str = str + " FROM tbl_Result ";
        str = str + " WHERE tbl_Result.EmailId='" + Session["EmailId"].ToString() + "'";
        str = str + " ORDER BY ResultId DESC";
        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string pid;

        pid = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lblResultId")).Text;
        Session.Add("ResultId", pid);
        Response.Redirect("MyAccount_ResultDetails.aspx");
        //Response.Redirect("Admin/Admin_test.aspx");
        
    }





}