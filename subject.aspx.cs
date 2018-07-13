using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class subject : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["StreamId"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        if (!IsPostBack)
        {
            FillSubject();
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


    private void FillSubject()
    {
        string str;
        str = "select Description,SubjectId, SubjectName, PhotoUrl from tbl_Subject WHERE StreamId=" + Session["StreamId"].ToString();
        str = str + " AND EnableStatus =1 ";
        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string SubjectId;

        SubjectId = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_SubjectId")).Text;
        Session.Add("SubjectId", SubjectId);

        Response.Redirect("Papers.aspx");
    }
}
