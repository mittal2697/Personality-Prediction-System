using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostResumeOld : System.Web.UI.Page
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
            FillDetails();
        }
    }

    private void FillDetails()
    {
        string sql;

        sql = "SELECT * FROM tbl_Skills";
        dl_Skills.DataSource = c1.SelectDs(sql);
        dl_Skills.DataBind();
        
        //FillBoard
        sql = "SELECT * FROM tbl_Board";
        ddl_Sec_Board.DataSource = c1.SelectDs(sql);
        ddl_Sec_Board.DataTextField = "Board_Name";
        ddl_Sec_Board.DataValueField = "Board_ID";
        ddl_Sec_Board.DataBind();
        ddl_Sec_Board.Items.Insert(0, "Select Board Name");

        ddl_SrSec_Board.DataSource = c1.SelectDs(sql);
        ddl_SrSec_Board.DataTextField = "Board_Name";
        ddl_SrSec_Board.DataValueField = "Board_Id";
        ddl_SrSec_Board.DataBind();
        ddl_SrSec_Board.Items.Insert(0, "Select Board Name");

        //Fill University
        sql = "SELECT * FROM tbl_Uni";
        ddl_Graduation_Uni.DataSource = c1.SelectDs(sql);
        ddl_Graduation_Uni.DataTextField = "Uni_Name";
        ddl_Graduation_Uni.DataValueField = "Uni_Id";
        ddl_Graduation_Uni.DataBind();
        ddl_Graduation_Uni.Items.Insert(0, "Select University");

        ddl_PG_Uni.DataSource = c1.SelectDs(sql);
        ddl_PG_Uni.DataTextField = "Uni_Name";
        ddl_PG_Uni.DataValueField = "Uni_Id";
        ddl_PG_Uni.DataBind();
        ddl_PG_Uni.Items.Insert(0, "Select University");

        ddl_Other_Uni.DataSource = c1.SelectDs(sql);
        ddl_Other_Uni.DataTextField = "Uni_Name";
        ddl_Other_Uni.DataValueField = "Uni_Id";
        ddl_Other_Uni.DataBind();
        ddl_Other_Uni.Items.Insert(0, "Select University");

        //Fill State
        sql = "SELECT * FROM tbl_State";
        ddl_State.DataSource = c1.SelectDs(sql);
        ddl_State.DataTextField = "State_Name";
        ddl_State.DataValueField = "State_Id";
        ddl_State.DataBind();
        ddl_State.Items.Insert(0, "Select State");

        ddl_Desired_State.DataSource = c1.SelectDs(sql);
        ddl_Desired_State.DataTextField = "State_Name";
        ddl_Desired_State.DataValueField = "State_Id";
        ddl_Desired_State.DataBind();
        ddl_Desired_State.Items.Insert(0, "Select State");

        //Fill Industry
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
    protected void ddl_Desired_State_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql;

        if (ddl_Desired_State.SelectedIndex > 0)
        {
            sql = "SELECT * FROM tbl_City WHERE State_ID=" + ddl_Desired_State.SelectedValue.ToString(); ;
            ddl_Desired_City.DataSource = c1.SelectDs(sql);
            ddl_Desired_City.DataTextField = "City_Name";
            ddl_Desired_City.DataValueField = "City_Id";
            ddl_Desired_City.DataBind();
            ddl_Desired_City.Items.Insert(0, "Select City");
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

    protected void btn_Submit_Click(object sender, EventArgs e)
    {

        string sql, Gender, ExpType;
        //, Resume_Url
        if (Opt_Male.Checked == true)
        {
            Gender = "Male";
        }
        else
        {
            Gender = "Female";
        }

        if (opt_Fresher.Checked == true)
        {
            ExpType = "Fresher"; 
        }
        else
        {
            ExpType = "Experienced";
        }

        sql = " UPDATE tbl_Member SET ";
        sql = sql + " Gender='" + Gender + "',";
        sql = sql + " DOB='" + txt_DOB.Text + "',";
        sql = sql + " Candidate_Address='" + txt_Address.Text + "',";
        sql = sql + " State_Id='" + ddl_State.SelectedValue.ToString() + "',";
        sql = sql + " City_Id='" + ddl_City.SelectedValue.ToString() + "',";
        sql = sql + " Pin_Code='" + txt_PinCode.Text + "',";
        sql = sql + " RegDate='" + DateTime.Now.ToShortDateString() + "',";
        sql = sql + " Experience_Type='" + ExpType + "',";
        sql = sql + " Desired_State='" + ddl_Desired_State.SelectedValue.ToString() + "',";
        sql = sql + " Desired_City='" + ddl_Desired_City.SelectedValue.ToString() + "',";
        sql = sql + " Sec_Board='" + ddl_Sec_Board.SelectedValue.ToString() + "',";
        sql = sql + " Sec_Per='" + txt_Sec_Pecentage.Text + "',";
        sql = sql + " Sec_Year='" + txt_Sec_Year.Text + "',";
        sql = sql + " Sec_Type='" + ddl_Sec_Course_Type.SelectedValue.ToString() + "',";
        sql = sql + " SrSec_Board='" + ddl_SrSec_Board.SelectedValue.ToString() + "',";
        sql = sql + " SrSec_Subject='" + txt_SrSec_Subject.Text + "',";
        sql = sql + " SrSec_Per='" + txt_SrSec_Pecentage.Text + "',";
        sql = sql + " SrSec_Year='" + txt_SrSec_Year.Text + "',";
        sql = sql + " SrSec_Type='" + ddl_SrSec_CourseType.SelectedValue.ToString() + "',";
        
        if (ExpType == "Experienced")
        {
            sql = sql + " Experience_Year='" + ddl_Exp_Years.SelectedValue.ToString() + "',";
            sql = sql + " Experience_Month='" + ddl_Exp_Months.SelectedValue.ToString() + "',";
            sql = sql + " OldSallery='" + txt_Sallery.Text + "',";
            sql = sql + " Reson='" + txt_reson.Text + "',";
            sql = sql + " Key_Skills='" + txt_KeySkills.Text + "',";
            sql = sql + " Job_Title='" + txt_Job_Title.Text + "',";
            sql = sql + " Company_Name='" + txt_Cmpny_Name.Text + "',";
            sql = sql + " Company_Industry='" + ddl_Industry.SelectedValue.ToString() + "',";
            sql = sql + " Job_Functional_Area='" + ddl_FunctionalArea.SelectedValue.ToString() + "',";
            sql = sql + " Job_Duration_Year='" + ddl_JobDur_Years.SelectedValue.ToString() + "',";
            sql = sql + " Job_Duration_Month='" + ddl_JobDur_Months.SelectedValue.ToString() + "',";
            sql = sql + " Current_Salary='" + txt_CSallery.Text + "',";
        }

        sql = sql + " Graduation_Univ='" + ddl_Graduation_Uni.SelectedValue.ToString() + "',";
        sql = sql + " Graduation_Degree='" + txt_Graduation_Degree.Text + "',";
        sql = sql + " Graduation_Subject='" + txt_Graduation_Uni_Subject.Text + "',";
        sql = sql + " Graduation_Per='" + txt_Graduation_Uni_Pecentage.Text + "',";
        sql = sql + " Graduation_Year='" + txt_Graduation_Uni_Year.Text + "',";
        sql = sql + " Graduation_Type='" + ddl_Graduation_Uni_Coursetype.SelectedValue.ToString() + "',";
        
        sql = sql + " PG_Univ='" + ddl_PG_Uni.SelectedValue.ToString() + "',";
        sql = sql + " PG_Degree='" + txt_PG_Degree.Text + "',";
        sql = sql + " PG_Subject='" + txt_PG_Subject.Text + "',";
        sql = sql + " PG_Per='" + txt_PG_Percentage.Text + "',";
        sql = sql + " PG_Year='" + txt_PG_Year.Text + "',";
        sql = sql + " PG_Type='" + ddl_PG_CourseType.SelectedValue.ToString() + "',";
       
        sql = sql + " Other_Univ='" + ddl_Other_Uni.SelectedValue.ToString() + "',";
        sql = sql + " Other_Degree='" + txt_Other_Degree.Text + "',";
        sql = sql + " Other_Subject='" + txt_PG_Subject.Text + "',";
        sql = sql + " Other_Per='" + txt_PG_Percentage.Text + "',";
        sql = sql + " Other_Year='" + txt_PG_Year.Text + "',";
        sql = sql + " Other_Type='" + ddl_Other_Uni.SelectedValue.ToString() + "'";
        
        sql = sql + " WHERE MemberId=" + Session["MemberId"].ToString();

        SaveSkills();
        UploadPhoto();
        UploadResume();
        c1.ExecuteQry(sql);
        lbl_Msg.Text = "Your Resume SuccessFully Updated";
      
    }

    private void SaveSkills()
    {
        int i, n;
        String sql, ids = "", v;

        n = dl_Skills.Items.Count;
        for (i = 0; i < n; i++)
        {
            v = ((Label)dl_Skills.Items[i].FindControl("lbl_Id")).Text;
            if (((CheckBox)dl_Skills.Items[i].FindControl("chk_Skill")).Checked == true)
                ids = ids + "(" + Session["MemberId"].ToString() + "," + v + "),";
        }

        if (ids.Length > 0)
        {
            ids = ids.Substring(0, ids.Length - 1);
            sql = "INSERT INTO tbl_MemberSkills (MemberId,SkillId) VALUES " + ids;

            c1.ExecuteQry(sql);
        }
    }

    private void UploadResume()
    {
        string sql, ext, fn, path;
        int i;
        if (FU_Resume.HasFile)
        {
            fn = FU_Resume.FileName;
            i = fn.LastIndexOf(".");

            ext = fn.Substring(i, fn.Length - i);
            path = Server.MapPath("CandidateResumes");
            path = path + "\\" + Session["MemberId"].ToString() + ext;

            FU_Resume.SaveAs(path);

            sql = "UPDATE tbl_Member SET Resume_Url='CandidateResumes/" + Session["MemberId"].ToString() + ext + "'";
            sql = sql + " WHERE MemberId=" + Session["MemberId"].ToString();

            c1.ExecuteQry(sql);
        }
    }

    private void UploadPhoto()
    {
        string sql, ext, fn, path;
        int i;
        if (FU_Photo.HasFile)
        {
            fn = FU_Photo.FileName;
            i = fn.LastIndexOf(".");

            ext = fn.Substring(i, fn.Length - i);
            path = Server.MapPath("MemberPhoto");
            path = path + "\\" + Session["MemberId"].ToString() + ext;

            FU_Photo.SaveAs(path);

            sql = "UPDATE tbl_Member SET PhotoUrl='MemberPhoto/" + Session["MemberId"].ToString() + ext + "'";
            sql = sql + " WHERE MemberId=" + Session["MemberId"].ToString();

            c1.ExecuteQry(sql);
        }
    }
   
}