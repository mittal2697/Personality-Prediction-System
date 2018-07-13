using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Search_Candidate : System.Web.UI.Page
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
            FillDetails();
        }
    }

    private void FillDetails()
    {
        string sql;

        sql = "SELECT * FROM tbl_State";
        ddl_State.DataSource = c1.SelectDs(sql);
        ddl_State.DataTextField = "State_Name";
        ddl_State.DataValueField = "State_Id";
        ddl_State.DataBind();
        ddl_State.Items.Insert(0, "Select State");


        sql = "SELECT * FROM tbl_Industry";
        ddl_Industry.DataSource = c1.SelectDs(sql);
        ddl_Industry.DataTextField = "IndustryName";
        ddl_Industry.DataValueField = "IndustryId";
        ddl_Industry.DataBind();
        ddl_Industry.Items.Insert(0, "Select Industry");

    }
   
    protected void ddl_State_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql;

        if (ddl_State.SelectedIndex > 0)
        {
            sql = "SELECT * FROM tbl_City WHERE State_ID=" + ddl_State.SelectedValue.ToString(); ;
            ddl_City.DataSource = c1.SelectDs(sql);
            ddl_City.DataTextField = "City_Name";
            ddl_City.DataValueField = "City_Id";
            ddl_City.DataBind();
            ddl_City.Items.Insert(0, "Select City");
        }
    }
    protected void ddl_Industry_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql;
        if (ddl_Industry.SelectedIndex > 0)
        {
            sql = "SELECT * FROM tbl_FunctionalArea WHERE IndustryId=" + ddl_Industry.SelectedValue.ToString(); ;
            ddl_FunctionalArea.DataSource = c1.SelectDs(sql);
            ddl_FunctionalArea.DataTextField = "FunctionalAreaName";
            ddl_FunctionalArea.DataValueField = "FunctionalAreaId";
            ddl_FunctionalArea.DataBind();
            ddl_FunctionalArea.Items.Insert(0, "Select FunctionalAreaName ");
        }
    }

    protected void fill()
    {
        string sql;

        sql = "SELECT case ShortListed when 1 then 'Selected'  when 0 then 'Unselected' end as Shortlist,* FROM tbl_Member WHERE memberid > 0 ";
        if (ddl_State.SelectedIndex > 0)
            sql = sql + " AND State_Id='" + ddl_State.SelectedValue.ToString() + "'";
        if (ddl_City.SelectedIndex > 0)
            sql = sql + " AND City_Id='" + ddl_City.SelectedValue.ToString() + "'";
        if (ddl_Industry.SelectedIndex > 0)
            sql = sql + " AND Company_Industry='" + ddl_Industry.SelectedValue.ToString() + "'";
        if (ddl_FunctionalArea.SelectedIndex > 0)
            sql = sql + " AND Job_Functional_Area='" + ddl_FunctionalArea.SelectedValue.ToString() + "'";
        if (txt_Job.Text != "")
            sql = sql + " AND Job_Title like '%" + txt_Job.Text + "%'";

        Repeater1.DataSource = c1.SelectDs(sql);
        Repeater1.DataBind();
    
    }

    protected void lnk_SearchCandidate_Click(object sender, EventArgs e)
    {
        fill();
    }

    protected void lnk_SelectAll_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "update tbl_Member set ShortListed=1 ";
        c1.ExecuteQry(sql);
        fill();
    }

    protected void lnk_Back_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string sql, id;
        id = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Id")).Text;
        DataTable tb;
        if (e.CommandName == "Shortlist")
        {
            if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Shorted")).Text == "Selected")
            {
                sql = "update tbl_Member set ShortListed=0";
                sql = sql + " WHERE MemberId=" + id;
            }
            else
            {
                sql = "update tbl_Member set ShortListed=1";
                sql = sql + " WHERE MemberId=" + id;
                
            }
            c1.ExecuteQry(sql);
            fill();
        }
        else
        if (e.CommandName == "View")
        {
            sql = "SELECT * FROM tbl_Member where MemberId=" + id;
            tb = c1.SelectDT(sql);

            lbl_Candidate_Address.Text = tb.Rows[0]["Candidate_Address"].ToString();
            lbl_MemberName.Text = tb.Rows[0]["MemberName"].ToString();
            lbl_ContactNo.Text = tb.Rows[0]["ContactNo"].ToString();
            lbl_Gender.Text = tb.Rows[0]["Gender"].ToString();
            lbl_Password.Text = tb.Rows[0]["Password"].ToString();
            lbl_DOB.Text = tb.Rows[0]["DOB"].ToString();
            lbl_EmailId.Text = tb.Rows[0]["EmailId"].ToString();
            lbl_Desired_City.Text = tb.Rows[0]["Desired_City"].ToString();
            lbl_Desired_State.Text = tb.Rows[0]["Desired_State"].ToString();
            lbl_PhotoUrl.Text = tb.Rows[0]["PhotoUrl"].ToString();
            lbl_Pin_Code.Text = tb.Rows[0]["Pin_Code"].ToString();
            lbl_RegDate.Text = tb.Rows[0]["RegDate"].ToString();
            lbl_Resume_Url.Text = tb.Rows[0]["Resume_Url"].ToString();

            if ("1" == tb.Rows[0]["EnableStatus"].ToString())
            {
                lbl_EnableStatus.Text = "Active";
            }
            else
            {
                lbl_EnableStatus.Text = "Not-Active";
            }

            lbl_Experience_Month.Text = tb.Rows[0]["Experience_Month"].ToString();
            lbl_Experience_Type.Text = tb.Rows[0]["Experience_Type"].ToString();
            lbl_Experience_Year.Text = tb.Rows[0]["Experience_Year"].ToString();
            lbl_Job_Duration_Month.Text = tb.Rows[0]["Job_Duration_Month"].ToString();
            lbl_Job_Duration_Year.Text = tb.Rows[0]["Job_Duration_Year"].ToString();
            lbl_Job_Functional_Area.Text = tb.Rows[0]["Job_Functional_Area"].ToString();
            lbl_Job_Title.Text = tb.Rows[0]["Job_Title"].ToString();
            lbl_Key_Skills.Text = tb.Rows[0]["Key_Skills"].ToString();
            lbl_Company_Name.Text = tb.Rows[0]["Company_Name"].ToString();
            lbl_Company_Industry.Text = tb.Rows[0]["Company_Industry"].ToString();
            lbl_Current_Salary.Text = tb.Rows[0]["Current_Salary"].ToString();

            lbl_OldSallery.Text = tb.Rows[0]["OldSallery"].ToString();
            lbl_Reson.Text = tb.Rows[0]["Reson"].ToString();

            lbl_Sec_Board.Text = tb.Rows[0]["Sec_Board"].ToString();
            lbl_Sec_Per.Text = tb.Rows[0]["Sec_Per"].ToString();
            lbl_Sec_Type.Text = tb.Rows[0]["Sec_Type"].ToString();
            lbl_Sec_Year.Text = tb.Rows[0]["Sec_Year"].ToString();

            lbl_SrSec_Board.Text = tb.Rows[0]["SrSec_Board"].ToString();
            lbl_SrSec_Per.Text = tb.Rows[0]["SrSec_Per"].ToString();
            lbl_SrSec_Subject.Text = tb.Rows[0]["SrSec_Subject"].ToString();
            lbl_SrSec_Type.Text = tb.Rows[0]["SrSec_Type"].ToString();
            lbl_SrSec_Year.Text = tb.Rows[0]["SrSec_Year"].ToString();

            lbl_Graduation_Degree.Text = tb.Rows[0]["Graduation_Degree"].ToString();
            lbl_Graduation_Per.Text = tb.Rows[0]["Graduation_Per"].ToString();
            lbl_Graduation_Subject.Text = tb.Rows[0]["Graduation_Subject"].ToString();
            lbl_Graduation_Type.Text = tb.Rows[0]["Graduation_Type"].ToString();
            lbl_Graduation_Univ.Text = tb.Rows[0]["Graduation_Univ"].ToString();
            lbl_Graduation_Year.Text = tb.Rows[0]["Graduation_Year"].ToString();

            lbl_PG_Degree.Text = tb.Rows[0]["PG_Degree"].ToString();
            lbl_PG_Per.Text = tb.Rows[0]["PG_Per"].ToString();
            lbl_PG_Subject.Text = tb.Rows[0]["PG_Subject"].ToString();
            lbl_PG_Type.Text = tb.Rows[0]["PG_Type"].ToString();
            lbl_PG_Univ.Text = tb.Rows[0]["PG_Univ"].ToString();
            lbl_PG_Year.Text = tb.Rows[0]["PG_Year"].ToString();

            lbl_Other_Degree.Text = tb.Rows[0]["Other_Degree"].ToString();
            lbl_Other_Per.Text = tb.Rows[0]["Other_Per"].ToString();
            lbl_Other_Subject.Text = tb.Rows[0]["Other_Subject"].ToString();
            lbl_Other_Type.Text = tb.Rows[0]["Other_Type"].ToString();
            lbl_Other_Univ.Text = tb.Rows[0]["Other_Univ"].ToString();
            lbl_Other_Year.Text = tb.Rows[0]["Other_Year"].ToString();

            MultiView1.ActiveViewIndex = 1;
        }
    }
}
