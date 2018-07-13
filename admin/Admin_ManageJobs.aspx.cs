using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_ManageJobs : System.Web.UI.Page
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
            Filljobs();
        }
    }

    public void Filljobs()
    {
        string sql;
        sql = "select CASE EnableStatus WHEN 0 THEN 'Enable' ELSE 'Disable' END AS EnableStatus1,* from tbl_JobPost";
        sql = sql + " WHERE AdminId= " + Session["AdminId"].ToString();
        Repeater1.DataSource = c1.SelectDs(sql);
        Repeater1.DataBind();
    }



    protected void lnkbtnAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
        txt_Title.Text = "";
        txt_Skills.Text = "";
        txt_Sallery.Text = "";
        txt_Qualification.Text = "";
        txt_Experience.Text = "";
        txt_Description.Text = "";
        txt_PostDate.Text = "";
        txt_LastDate.Text = "";
        MultiView1.ActiveViewIndex = 1;

    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Filljobs();
        MultiView1.ActiveViewIndex = 0;
        //lbl_Msg.Text = "";
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql;
        if (lbl_Opr.Text == "Edit")
        {
            sql = "UPDATE tbl_JobPost SET ";
            sql = sql + "Title='" + txt_Title.Text + "',";
            sql = sql + "Skills='" + txt_Skills.Text + "',";
            sql = sql + "Salary='" + txt_Sallery.Text + "',";
            sql = sql + "Qualification='" + txt_Qualification.Text + "',";
            sql = sql + "Experience='" + txt_Experience.Text + "',";
            sql = sql + "Description='" + txt_Description.Text + "',";
            sql = sql + "PostDate='" + txt_PostDate.Text + "',";
            sql = sql + "LastDate='" + txt_LastDate.Text + "'";
            sql = sql + " WHERE JobId=" + lbl_Id.Text;
            c1.ExecuteQry(sql);
            Filljobs();
            MultiView1.ActiveViewIndex = 0;

        }
        if (lbl_Opr.Text == "Add")
        {
            sql = " INSERT INTO tbl_JobPost (Title,Skills,Salary,Qualification,Experience,Description,PostDate,LastDate,AdminId)";
            sql = sql + "VALUES(";
            sql = sql + " '" + txt_Title.Text + "',";
            sql = sql + " '" + txt_Skills.Text + "',";
            sql = sql + " '" + txt_Sallery.Text + "',";
            sql = sql + " '" + txt_Qualification.Text + "',";
            sql = sql + " '" + txt_Experience.Text + "',";
            sql = sql + " '" + txt_Description.Text + "',";
            sql = sql + " '" + txt_PostDate.Text + "',";
            sql = sql + " '" + txt_LastDate.Text + "',";
            sql = sql + " '" + Session["AdminId"] + "')";
            c1.ExecuteQry(sql);

            txt_Title.Text = "";
            txt_Skills.Text = "";
            txt_Sallery.Text = "";
            txt_Qualification.Text = "";
            txt_Experience.Text = "";
            txt_Description.Text = "";
            txt_PostDate.Text = "";
            txt_LastDate.Text = "";
            Filljobs();
            MultiView1.ActiveViewIndex = 0;
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string str;
        lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Id")).Text;

        if (e.CommandName == "Delete")
        {
            str = "DELETE from tbl_JobPost where JobId=" + lbl_Id.Text;
            c1.ExecuteQry(str);
            Filljobs();
        }
        else if (e.CommandName == "Edit")
        {
            lbl_Opr.Text = "Edit";
            String sql;
            DataTable tb;

            sql = "SELECT * FROM tbl_JobPost where JobId=" + lbl_Id.Text;
            tb = c1.SelectDT(sql);
            txt_Title.Text = tb.Rows[0]["Title"].ToString();
            txt_Skills.Text = tb.Rows[0]["Skills"].ToString();
            txt_Sallery.Text = tb.Rows[0]["Salary"].ToString();
            txt_Qualification.Text = tb.Rows[0]["Qualification"].ToString();
            txt_Experience.Text = tb.Rows[0]["Experience"].ToString();
            txt_Description.Text = tb.Rows[0]["Description"].ToString();
            txt_PostDate.Text = tb.Rows[0]["PostDate"].ToString();
            txt_LastDate.Text = tb.Rows[0]["LastDate"].ToString();
            MultiView1.ActiveViewIndex = 1;


        }
        else if (e.CommandName == "EnableStatus")
        {
            if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
            {
                str = "update tbl_JobPost set EnableStatus=1";
                str = str + " WHERE JobId=" + lbl_Id.Text;
            }
            else
            {
                str = "update tbl_JobPost set EnableStatus=0";
                str = str + " WHERE JobId=" + lbl_Id.Text;
            }
            c1.ExecuteQry(str);
            Filljobs();
        }
    }
}
