using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Notification : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else
            FillSubject();
    }

    public void FillSubject()
    {
        string str;

        str = "SELECT CASE EnableStatus WHEN 0 THEN 'Enable' ELSE 'Disable' END AS EnableStatus1, Url, Notification,NDate, Id1 FROM tbl_Notification where Id1 > 0 ";

        if (Session["AdminId"].ToString() != "1")
            str = str + " and AdminId=" + Session["AdminId"].ToString();

        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();
    }

    protected void linkAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
        txt_Url.Text = "";
        txt_Date.Text = "";
        txt_Question_Title.Text = "";
        lbl_Id.Text = "";
        lbl_Msg.Text = "";

        MultiView1.ActiveViewIndex = 1;
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        FillSubject();
        MultiView1.ActiveViewIndex = 0;
        lbl_Msg.Text = "";
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string id;
        string sql, cnt, pass, user;

        user = c1.Clean(txt_Question_Title.Text);
        pass = c1.Clean(txt_Url.Text);

        if (lbl_Opr.Text == "Add")
        {
            sql = "insert into tbl_Notification (Notification,Url,NDate,enablestatus,AdminID)   Output Inserted.Id1 values('" + txt_Question_Title.Text + "','" + txt_Url.Text + "','" + txt_Date.Text + "',1,'"+Session["AdminId"].ToString()+"')";
            id = c1.SelectScalar(sql);

            txt_Question_Title.Text = "";
            txt_Url.Text = "";
            txt_Date.Text = "";

            lbl_Msg.Text = "Admin Added Successfully";
        }
        else
        {
            sql = "UPDATE tbl_Notification SET Notification='" + txt_Question_Title.Text + "', Url='" + txt_Url.Text + "',";
            sql = sql + " NDate='" + txt_Date.Text + "'";
            sql = sql + " WHERE Id1=" + lbl_Id.Text;
            c1.ExecuteQry(sql);

            txt_Question_Title.Text = "";
            txt_Url.Text = "";
            txt_Date.Text = "";

            FillSubject();
            MultiView1.ActiveViewIndex = 0;
        }

    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string str, id;
        lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Id")).Text;

        if (e.CommandName == "Delete")
        {
            str = "delete from tbl_Notification where Id1=" + lbl_Id.Text;
            c1.ExecuteQry(str);
            FillSubject();
        }
        else if (e.CommandName == "Edit")
        {
            txt_Question_Title.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Notification")).Text;
            txt_Url.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Url")).Text;
            txt_Date.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_NDate")).Text;

            lbl_Opr.Text = "Edit";
            MultiView1.ActiveViewIndex = 1;
        }
        else if (e.CommandName == "EnableStatus")
        {
            if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
            {
                str = "update tbl_Notification set EnableStatus=1";
                str = str + " WHERE Id1=" + lbl_Id.Text;
            }
            else
            {
                str = "update tbl_Notification set EnableStatus=0";
                str = str + " WHERE Id1=" + lbl_Id.Text;
            }
            c1.ExecuteQry(str);
            FillSubject();
        }
    }
}

