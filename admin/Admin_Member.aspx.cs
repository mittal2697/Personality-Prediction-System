using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Member : System.Web.UI.Page
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

            FillSubject();
        }
    }

    public void FillSubject()
    {
        string str;
        str = "SELECT '../'+PhotoUrl as PhotoUrl1 ,CASE EnableStatus WHEN 0 THEN 'Enable' ELSE 'Disable' END AS EnableStatus1, * FROM tbl_Member ";
        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();
    }



    protected void lnkbtnAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
        txt_ContactNo.Text = "";
        txt_EmailID.Text = "";
        txt_MemberName.Text = "";
        txt_Password.Text = "";
        MultiView1.ActiveViewIndex = 1;
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        FillSubject();
        MultiView1.ActiveViewIndex = 0;

    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql, cnt;
        if (lbl_Opr.Text == "Edit")
        {
            sql = "UPDATE tbl_Member SET ";
            sql = sql + " MemberName='" + txt_MemberName.Text + "',";
            sql = sql + " EmailId='" + txt_EmailID.Text + "',";
            sql = sql + " ContactNo='" + txt_ContactNo.Text + "'";

            sql = sql + " WHERE MemberId=" + lbl_Id.Text;
            c1.ExecuteQry(sql);

            txt_ContactNo.Text = "";
            txt_EmailID.Text = "";
            txt_MemberName.Text = "";
            txt_Password.Text = "";
            MultiView1.ActiveViewIndex = 0;
        }

        if (lbl_Opr.Text == "Add")
        {
            sql = " SELECT Count(*) FROM tbl_Member WHERE EmailId='" + txt_EmailID.Text + "'";
            cnt = c1.SelectScalar(sql);
            if (Convert.ToInt32(cnt) == 1)
            {
                lbl_Msg_Reg.Text = "This EmailId is Already Registered.";
            }
            else
            {
                sql = " INSERT INTO tbl_Member (EnableStatus,MemberName, EmailId,Password,ContactNo,RegDate)";
                sql = sql + "VALUES ( 0,";
                sql = sql + " '" + txt_MemberName.Text + "',";
                sql = sql + " '" + txt_EmailID.Text + "',";
                sql = sql + " '" + txt_Password.Text + "',";
                sql = sql + " '" + txt_ContactNo.Text + "',";
                sql = sql + " '" + DateTime.Now.ToShortDateString() + "')";

                c1.ExecuteQry(sql);

                txt_ContactNo.Text = "";
                txt_EmailID.Text = "";
                txt_MemberName.Text = "";
                txt_Password.Text = "";
                FillSubject();
                MultiView1.ActiveViewIndex = 0;
            }
        }

    }




    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string str, id;
        lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Id")).Text;

        if (e.CommandName == "Delete")
        {
            str = "delete from tbl_Member where MemberId=" + lbl_Id.Text;
            c1.ExecuteQry(str);
            FillSubject();
        }
        else if (e.CommandName == "Edit")
        {
            lbl_Opr.Text = "Edit";
            //ddl_MemberTypeReg.Visible = false;
            String sql;
            DataTable tb;

            sql = "SELECT * FROM tbl_Member where MemberId=" + lbl_Id.Text;
            tb = c1.SelectDT(sql);

            txt_ContactNo.Text = tb.Rows[0]["ContactNo"].ToString();
            txt_EmailID.Text = tb.Rows[0]["EmailId"].ToString();
            txt_MemberName.Text = tb.Rows[0]["MemberName"].ToString();
            txt_Password.Text = tb.Rows[0]["Password"].ToString();
            MultiView1.ActiveViewIndex = 1;

        }
        else if (e.CommandName == "EnableStatus")
        {
            if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
            {
                str = "update tbl_Member set EnableStatus=1";
                str = str + " WHERE MemberId=" + lbl_Id.Text;
            }
            else
            {
                str = "update tbl_Member set EnableStatus=0";
                str = str + " WHERE MemberId=" + lbl_Id.Text;
            }
            c1.ExecuteQry(str);
            FillSubject();
        }
    }



}
