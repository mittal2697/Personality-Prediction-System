using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Skills : System.Web.UI.Page
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
        }

    }

    public void FillCategory()
    {
        string str;

        str = "SELECT CASE EnableStatus WHEN 0 THEN 'Enable' ELSE 'Disable' END AS EnableStatus1, SkillWeight, SkillId, SkillName FROM tbl_Skills ";
        //if (Session["AdminId"].ToString() != "1")
        //    str = str + " and AdminId=" + Session["AdminId"].ToString();

        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();

    }



    protected void linkAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
        txt_Question_Title.Text = "";
        txt_Weight.Text = "";

        MultiView1.ActiveViewIndex = 1;
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        FillCategory();
        MultiView1.ActiveViewIndex = 0;
        lbl_Msg.Text = "";
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql, fn, path, id, ext;
        if (lbl_Opr.Text == "Add")
        {
            sql = "insert into tbl_Skills (EnableStatus,SkillName, SkillWeight,AdminId) values(1,'" + txt_Question_Title.Text + "', '";
            sql = sql + txt_Weight.Text + "','";
            sql = sql + Session["AdminId"].ToString() + "')";
            c1.ExecuteQry(sql);
            txt_Question_Title.Text = "";
            txt_Weight.Text = "";
            lbl_Msg.Text = "Q Section Added Successfully";
        }
        else
        {
            sql = "UPDATE tbl_Skills SET SkillName='" + txt_Question_Title.Text + "', ";
            sql = sql + " SkillWeight=" + txt_Weight.Text;
            sql = sql + " WHERE SkillId=" + lbl_Id.Text;
            c1.ExecuteQry(sql);

            txt_Weight.Text = "";
            txt_Question_Title.Text = "";
            FillCategory();
            MultiView1.ActiveViewIndex = 0;
        }

    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string str, id;
        lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Id")).Text;

        if (e.CommandName == "Delete")
        {
            str = "delete from tbl_Skills where SkillId=" + lbl_Id.Text;
            c1.ExecuteQry(str);
            FillCategory();
        }
        else if (e.CommandName == "Edit")
        {
            txt_Question_Title.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_SkillName")).Text;
            txt_Weight.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Weight")).Text;

            lbl_Opr.Text = "Edit";
            MultiView1.ActiveViewIndex = 1;
        }
        else if (e.CommandName == "EnableStatus")
        {
            if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
            {
                str = "update tbl_Skills set EnableStatus=1";
                str = str + " WHERE SkillId=" + lbl_Id.Text;
            }
            else
            {
                str = "update tbl_Skills set EnableStatus=0";
                str = str + " WHERE SkillId=" + lbl_Id.Text;
            }
            c1.ExecuteQry(str);
            FillCategory();
        }
    }
}
