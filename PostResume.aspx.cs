using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;

public partial class PostResume : System.Web.UI.Page
{
    static string PDF;
    static string TEXT2;

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
            FillResume();
        }
    }

    private void FillDetails()
    {
        string sql;
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
        ddl_StatePersonal.DataSource = c1.SelectDs(sql);
        ddl_StatePersonal.DataTextField = "State_Name";
        ddl_StatePersonal.DataValueField = "State_Id";
        ddl_StatePersonal.DataBind();
        ddl_StatePersonal.Items.Insert(0, "Select State");

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
        fillCityPersonal();
    }

    private void fillCityPersonal()
    {
        string sql;

        if (ddl_StatePersonal.SelectedIndex > 0)
        {
            sql = "SELECT * FROM tbl_City WHERE State_ID=" + ddl_StatePersonal.SelectedValue.ToString(); ;
            ddl_CityPersonal.DataSource = c1.SelectDs(sql);
            ddl_CityPersonal.DataTextField = "City_Name";
            ddl_CityPersonal.DataValueField = "City_Id";
            ddl_CityPersonal.DataBind();
            ddl_CityPersonal.Items.Insert(0, "Select City");
        }
    }

    protected void ddl_Desired_State_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillCityDesire();
    }

    private void fillCityDesire()
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
        fillFunctionalArea();
    }

    private void fillFunctionalArea()
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
    
    private void FillResume()
    {
        string str;
        DataTable dt;
        int i, n;

        str = " SELECT * FROM tbl_Member ";
        str = str + " WHERE MemberId=" + Session["MemberId"].ToString();

        dt = c1.SelectDT(str);
        n = dt.Rows.Count;

        if (n > 0)
        {
            if (dt.Rows[0]["Gender"].ToString() == "Male")
                Opt_Male.Checked = true;
            else
                Opt_FeMale.Checked = true;


            txt_DOB.Text = dt.Rows[0]["DOB"].ToString();
            txt_Address.Text = dt.Rows[0]["Candidate_Address"].ToString();
            ddl_StatePersonal.SelectedValue = dt.Rows[0]["State_Id"].ToString();
            fillCityPersonal();
            ddl_CityPersonal.SelectedValue = dt.Rows[0]["City_Id"].ToString();
            txt_PinCode.Text = dt.Rows[0]["Pin_Code"].ToString();

            //txt_Address.Text = dt.Rows[0]["RegDate"].ToString();
            if (dt.Rows[0]["Experience_Type"].ToString() == "Fresher")
                opt_Fresher.Checked = true;
            else
                opt_Experience.Checked = true;


            ddl_Desired_State.SelectedValue = dt.Rows[0]["Desired_State"].ToString();
            fillCityDesire();

            ddl_Desired_City.SelectedValue = dt.Rows[0]["Desired_City"].ToString();
            ddl_Sec_Board.SelectedValue = dt.Rows[0]["Sec_Board"].ToString();
            ddl_Sec_Course_Type.SelectedValue = dt.Rows[0]["Sec_Type"].ToString();
            txt_Sec_Pecentage.Text = dt.Rows[0]["Sec_Per"].ToString();
            txt_Sec_Year.Text = dt.Rows[0]["Sec_Year"].ToString();

            ddl_SrSec_Board.SelectedValue = dt.Rows[0]["SrSec_Board"].ToString();
            txt_SrSec_Pecentage.Text = dt.Rows[0]["SrSec_Per"].ToString();
            txt_SrSec_Year.Text = dt.Rows[0]["SrSec_Year"].ToString();
            txt_SrSec_Subject.Text = dt.Rows[0]["SrSec_Subject"].ToString();
            ddl_SrSec_CourseType.SelectedValue = dt.Rows[0]["SrSec_Type"].ToString();

            ddl_Exp_Years.SelectedValue = dt.Rows[0]["Experience_Year"].ToString();
            ddl_Exp_Months.SelectedValue = dt.Rows[0]["Experience_Month"].ToString();
            txt_Sallery.Text = dt.Rows[0]["OldSallery"].ToString();
            txt_reson.Text = dt.Rows[0]["Reson"].ToString();
            txt_KeySkills.Text = dt.Rows[0]["Key_Skills"].ToString();

            txt_Job_Title.Text = dt.Rows[0]["Job_Title"].ToString();
            txt_Cmpny_Name.Text = dt.Rows[0]["Company_Name"].ToString();
            ddl_Industry.SelectedValue = dt.Rows[0]["Company_Industry"].ToString();
            fillFunctionalArea();
            
            ddl_FunctionalArea.SelectedValue = dt.Rows[0]["Job_Functional_Area"].ToString();
            ddl_JobDur_Years.SelectedValue = dt.Rows[0]["Job_Duration_Year"].ToString();
            ddl_JobDur_Months.SelectedValue = dt.Rows[0]["Job_Duration_Month"].ToString();
            txt_CSallery.Text = dt.Rows[0]["Current_Salary"].ToString();

            ddl_Graduation_Uni.SelectedValue = dt.Rows[0]["Graduation_Univ"].ToString();
            txt_Graduation_Degree.Text = dt.Rows[0]["Graduation_Degree"].ToString();
            txt_Graduation_Uni_Subject.Text = dt.Rows[0]["Graduation_Subject"].ToString();
            txt_Graduation_Uni_Pecentage.Text = dt.Rows[0]["Graduation_Per"].ToString();
            txt_Graduation_Uni_Year.Text = dt.Rows[0]["Graduation_Year"].ToString();
            ddl_Graduation_Uni_Coursetype.SelectedValue = dt.Rows[0]["Graduation_Type"].ToString();

            ddl_PG_Uni.SelectedValue = dt.Rows[0]["PG_Univ"].ToString();
            txt_PG_Degree.Text = dt.Rows[0]["PG_Degree"].ToString();
            txt_PG_Subject.Text = dt.Rows[0]["PG_Subject"].ToString();
            txt_PG_Percentage.Text = dt.Rows[0]["PG_Per"].ToString();
            txt_PG_Year.Text = dt.Rows[0]["PG_Year"].ToString();
            ddl_PG_CourseType.SelectedValue = dt.Rows[0]["PG_Type"].ToString();


            ddl_Other_Uni.SelectedValue = dt.Rows[0]["Other_Univ"].ToString();
            txt_Other_Degree.Text = dt.Rows[0]["Other_Degree"].ToString();
            txt_Other_Uni_Subject.Text = dt.Rows[0]["Other_Subject"].ToString();
            txt_other_Uni_Pecentage.Text = dt.Rows[0]["Other_Per"].ToString();
            txt_other_Uni_Year.Text = dt.Rows[0]["Other_Year"].ToString();
            ddl_Other_Uni_CourseType.Text = dt.Rows[0]["Other_Type"].ToString();
                  
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
        sql = sql + " State_Id='" + ddl_StatePersonal.SelectedValue.ToString() + "',";
        sql = sql + " City_Id='" + ddl_CityPersonal.SelectedValue.ToString() + "',";
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

        
        UploadPhoto();
        UploadResume();
        c1.ExecuteQry(sql);
        lbl_Msg.Text = "Your Resume SuccessFully Updated";
      
    }

    public static string ExtractTextFromPdf(string path)
    {
        using (PdfReader reader = new PdfReader(path))
        {
            StringBuilder text = new StringBuilder();

            for (int i = 1; i <= reader.NumberOfPages; i++)
            {
                text.Append(PdfTextExtractor.GetTextFromPage(reader, i));
            }

            return text.ToString();
        }
    }

    private void UploadResume()
    {
        string sql, ext, fn, path, ResumeContent="";
        int i;
        if (FU_Resume.HasFile)
        {
            fn = FU_Resume.FileName;
            i = fn.LastIndexOf(".");

            ext = fn.Substring(i, fn.Length - i);
            path = Server.MapPath("CandidateResumes");
            path = path + "\\" + Session["MemberId"].ToString() + ext;

            FU_Resume.SaveAs(path);

            ResumeContent = ExtractTextFromPdf(Server.MapPath("CandidateResumes/" + Session["MemberId"].ToString() + ext));
            ResumeContent = c1.Clean(ResumeContent);

            sql = "UPDATE tbl_Member SET Resume_Url='CandidateResumes/" + Session["MemberId"].ToString() + ext + "',";
            sql = sql + " ResumeContent='" + ResumeContent + "'";
            sql = sql + " WHERE MemberId=" + Session["MemberId"].ToString();

            c1.ExecuteQry(sql);

             
        sql = "DELETE FROM tbl_MemberSkills WHERE MemberId=" + Session["MemberId"].ToString()+";";
        sql = sql + "INSERT INTO tbl_MemberSkills (MemberId, SkillId) SELECT '" + Session["MemberId"].ToString() + "', SkillId FROM tbl_Skills where '" + ResumeContent + "' LIKE  '%'+SkillName+'%'";
        
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