using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Admin_Paper : System.Web.UI.Page
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
            FillInstructionAdd();
            FillStream();

            DataTable dtCategory = new DataTable();
            dtCategory.Columns.AddRange(new DataColumn[6] { new DataColumn("CategoryId"), new DataColumn("CategoryName"), new DataColumn("EasyQuestion"), new DataColumn("ModQuestion"), new DataColumn("DifQuestion"), new DataColumn("TotalQuestion") });
            Session["Category"] = dtCategory;

        }
    }

    public void FillPaper()
    {
        string str;
        if (ddl_SubjectShow.SelectedIndex > -1)
        {
            str = "SELECT CASE EnableStatus WHEN 0 THEN 'Enable' ELSE 'Disable' END AS EnableStatus1, * FROM tbl_Paper WHERE SubjectId=" + ddl_SubjectShow.SelectedValue.ToString();

            //if (Session["AdminId"].ToString() != "1")
            //    str = str + " and AdminId=" + Session["AdminId"].ToString();

            Repeater1.DataSource = c1.SelectDs(str);
            Repeater1.DataBind();
        }
    }
    public void FillStream()
    {
        string sql;
        sql = "select * from tbl_Stream ";
        sql = sql + " WHERE EnableStatus =1 ";
        if (Session["AdminId"].ToString() != "1")
            sql = sql + " and AdminId=" + Session["AdminId"].ToString();

        ddl_StreamShow.DataSource = c1.SelectDs(sql);
        ddl_StreamShow.DataTextField = "StreamName";
        ddl_StreamShow.DataValueField = "StreamId";
        ddl_StreamShow.DataBind();
        ddl_StreamShow.Items.Insert(0, new ListItem("--Select Category--", "0"));

        ddl_StreamAdd.DataSource = c1.SelectDs(sql);
        ddl_StreamAdd.DataTextField = "StreamName";
        ddl_StreamAdd.DataValueField = "StreamId";
        ddl_StreamAdd.DataBind();
        ddl_StreamAdd.Items.Insert(0, new ListItem("--Select Category--", "0"));

    }
    protected void linkAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
        clearTextboxes();
        ddl_StreamAdd.SelectedIndex = -1;
        ddl_SubjectAdd.Items.Clear();
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        FillPaper();
        MultiView1.ActiveViewIndex = 0;
        lbl_Msg.Text = "";
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql, fn, path, id, ext;
        if (ddl_SubjectAdd.SelectedIndex > 0)
        {
            if (grd_Category.Rows.Count != 0)
            {
                if (lbl_Opr.Text == "Add")
                {
                    sql = "insert into tbl_paper (PaperName, SubjectId,InstructionId,FixPaper, Description, MinTime, QuestionMarks, NegativeMarks, EnableStatus, AdminId)";
                    sql = sql + " Output Inserted.PaperId  values('"
                        + txt_PaperName.Text + "','" + ddl_SubjectAdd.SelectedValue.ToString() + "','" + ddl_InstructionAdd.SelectedValue.ToString() + "', '"
                        + dl_PaperType.SelectedValue.ToString() + "','" + txt_Description.Text + "','" + txt_PaperTime.Text + "', '"
                        + txt_QuestionMarks.Text + "','" + txt_NegativeMarks.Text + "', '0','"
                        + Session["AdminId"].ToString() + "')";
                    id = c1.SelectScalar(sql);
                    savePaperQuestionCategory(id);
                    clearTextboxes();
                    grd_Category.DataSource = null;
                    grd_Category.DataBind();
                    lbl_Msg.Text = "Paper Added Successfully";
                }
                else
                {
                    sql = "UPDATE tbl_paper SET PaperName='" + txt_PaperName.Text + "',";
                    sql = sql + " SubjectId='" + ddl_SubjectAdd.SelectedValue.ToString() + "',";
                    sql = sql + " FixPaper='" + dl_PaperType.SelectedValue.ToString() + "',";
                    sql = sql + " Description='" + txt_Description.Text + "',";
                    sql = sql + " MinTime='" + txt_PaperTime.Text + "',";
                    sql = sql + " QuestionMarks='" + txt_QuestionMarks.Text + "',";
                    sql = sql + " InstructionId='" + ddl_InstructionAdd.SelectedValue.ToString() + "',";
                    sql = sql + " NegativeMarks='" + txt_NegativeMarks.Text + "'";
                    sql = sql + " WHERE paperId=" + lbl_Id.Text;
                    c1.ExecuteQry(sql);
                    savePaperQuestionCategory(lbl_Id.Text);
                    clearTextboxes();
                    grd_Category.DataSource = null;
                    grd_Category.DataBind();
                    FillPaper();
                    MultiView1.ActiveViewIndex = 0;
                }
            }
            else
            {
                lbl_Msg.Text = "Please Insert Q Section";
            }

        }
        else
        {
            lbl_Msg.Text = "Please Select Category/Subcategory";
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        ListItem itm = new ListItem();
        ListItem pprType = new ListItem();

        string str, id, InstructionId,PaperType;
        lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Id")).Text;

        if (e.CommandName == "Delete")
        {
            str = "delete from tbl_paper where CategoryId=" + lbl_Id.Text;
            c1.ExecuteQry(str);
            FillPaper();
        }
        else if (e.CommandName == "Edit")
        {
            txt_PaperName.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_CategoryName")).Text;

            txt_Description.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Description")).Text;
            txt_PaperTime.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_PaperTime")).Text;
            txt_QuestionMarks.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_QuestionMarks")).Text;
            txt_NegativeMarks.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_NegativeMarks")).Text;
            txt_PaperTime.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_PaperTime")).Text;
            InstructionId = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_InstructionId")).Text;
            PaperType = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_PaperType")).Text;

            ddl_StreamAdd.SelectedIndex = ddl_StreamShow.SelectedIndex;
            FillSubjectAdd();
            ddl_SubjectAdd.SelectedIndex = ddl_SubjectShow.SelectedIndex;
            itm = ddl_InstructionAdd.Items.FindByValue(InstructionId);
            if (itm != null)
            {
                ddl_InstructionAdd.SelectedValue = InstructionId;
            }
            pprType = dl_PaperType.Items.FindByValue(PaperType);
            if (pprType != null)
            {
                dl_PaperType.SelectedValue = PaperType;
            }
            FillCategoryAdd();
            string Sql = "SELECT tbl_Category.CategoryId, CategoryName, EasyQuestion ,ModQuestion,DifQuestion, (tbl_PaperQuestionCategory.EasyQuestion +tbl_PaperQuestionCategory.ModQuestion+tbl_PaperQuestionCategory.DifQuestion) as TotalQuestion ,tbl_Category.CategoryName as CategoryName FROM tbl_PaperQuestionCategory,tbl_Category";
            Sql = Sql + "  WHERE tbl_Category.CategoryId= tbl_PaperQuestionCategory.CategoryId And  tbl_PaperQuestionCategory.PaperId=" + lbl_Id.Text;

            grd_Category.DataSource = c1.SelectDs(Sql);
            grd_Category.DataBind();


            DataTable dtItem = (DataTable)Session["Category"];
            dtItem = c1.SelectDT(Sql);
            Session["Category"] = dtItem;


            lbl_Opr.Text = "Edit";
            MultiView1.ActiveViewIndex = 1;
        }
        else if (e.CommandName == "EnableStatus")
        {
            if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
            {
                str = "update tbl_paper set EnableStatus=1";
                str = str + " WHERE PaperId=" + lbl_Id.Text;
            }
            else
            {
                str = "update tbl_paper set EnableStatus=0";
                str = str + " WHERE PaperId=" + lbl_Id.Text;
            }
            c1.ExecuteQry(str);
            FillPaper();
        }
    }
    protected void ddl_TopicShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql;
        sql = "select * from tbl_Subject ";
        sql = sql + " WHERE EnableStatus =1 and StreamId=" + ddl_StreamShow.SelectedValue.ToString();
        ddl_SubjectShow.DataSource = c1.SelectDs(sql);
        ddl_SubjectShow.DataTextField = "SubjectName";
        ddl_SubjectShow.DataValueField = "SubjectId";
        ddl_SubjectShow.DataBind();
        ddl_SubjectShow.Items.Insert(0, new ListItem("--Select Subcategory--", "0"));
    }
    protected void ddl_SubjectShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillPaper();
    }
    protected void ddl_StreamAdd_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillSubjectAdd();
    }
    protected void ddl_SubjectAdd_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillCategoryAdd();
    }
    private void FillSubjectAdd()
    {
        string sql;
        sql = "select * from tbl_Subject ";
        sql = sql + " WHERE EnableStatus =1 and StreamId=" + ddl_StreamAdd.SelectedValue.ToString();
        ddl_SubjectAdd.DataSource = c1.SelectDs(sql);
        ddl_SubjectAdd.DataTextField = "SubjectName";
        ddl_SubjectAdd.DataValueField = "SubjectId";
        ddl_SubjectAdd.DataBind();
        ddl_SubjectAdd.Items.Insert(0, new ListItem("--Select Subcategory--", "0"));
    }
    private void FillCategoryAdd()
    {
        string sql;
        sql = "select * from tbl_Category";
        sql = sql + " WHERE EnableStatus =1 and SubjectId=" + ddl_SubjectAdd.SelectedValue.ToString();
        ddl_Category.DataSource = c1.SelectDs(sql);
        ddl_Category.DataTextField = "CategoryName";
        ddl_Category.DataValueField = "CategoryId";
        ddl_Category.DataBind();
        ddl_Category.Items.Insert(0, new ListItem("--Select Q Section--", "0"));
    }
    private void FillInstructionAdd()
    {
        string sql;
        sql = "select * from tbl_TestInstruction";
        //  sql = sql + " WHERE EnableStatus =1 and SubjectId=" + ddl_SubjectAdd.SelectedValue.ToString();
        ddl_InstructionAdd.DataSource = c1.SelectDs(sql);
        ddl_InstructionAdd.DataTextField = "Title";
        ddl_InstructionAdd.DataValueField = "Id1";
        ddl_InstructionAdd.DataBind();
        ddl_InstructionAdd.Items.Insert(0, new ListItem("--Select Test Instruction--", "0"));
    }
    private void clearTextboxes()
    {
        txt_Description.Text = "";
        txt_Diff.Text = "";
        txt_Easy.Text = "";
        txt_Mod.Text = "";
        txt_NegativeMarks.Text = "";
        txt_PaperName.Text = "";
        txt_PaperTime.Text = "";
        txt_QuestionMarks.Text = "";
    }
    protected void btn_AddCategory_Click(object sender, EventArgs e)
    {
        string dublicate = "", TotalQuestion = "";
        int n, i, flag = 0, position = 0;
        DataTable dtCategory = (DataTable)Session["Category"];

        if (ddl_Category.SelectedIndex > 0)
        {

            if (btn_AddCategory.Text == "Add")
            {
                TotalQuestion = Convert.ToString(Convert.ToInt32(txt_Diff.Text) + Convert.ToInt32(txt_Easy.Text) + Convert.ToInt32(txt_Mod.Text));

                dtCategory.Rows.Add(ddl_Category.SelectedValue.ToString(), ddl_Category.SelectedItem.Text.Trim(), txt_Easy.Text.Trim(), txt_Mod.Text, txt_Diff.Text, TotalQuestion);
                Session["Category"] = dtCategory;

                grd_Category.DataSource = dtCategory;
                grd_Category.DataBind();

            }
            else
            {
                TotalQuestion = Convert.ToString(Convert.ToInt32(txt_Diff.Text) + Convert.ToInt32(txt_Easy.Text) + Convert.ToInt32(txt_Mod.Text));

                dtCategory.Rows[Convert.ToInt16(lbl_EditRowId.Text)][0] = ddl_Category.SelectedValue.ToString();
                dtCategory.Rows[Convert.ToInt16(lbl_EditRowId.Text)][1] = ddl_Category.SelectedItem.Text.ToString();
                dtCategory.Rows[Convert.ToInt16(lbl_EditRowId.Text)][2] = txt_Easy.Text;
                dtCategory.Rows[Convert.ToInt16(lbl_EditRowId.Text)][3] = txt_Mod.Text;
                dtCategory.Rows[Convert.ToInt16(lbl_EditRowId.Text)][4] = txt_Diff.Text;
                dtCategory.Rows[Convert.ToInt16(lbl_EditRowId.Text)][5] = TotalQuestion;

                Session["Category"] = dtCategory;
                grd_Category.DataSource = dtCategory;
                grd_Category.DataBind();
                //this.FillItem();
                //CalculateTax();

                btn_AddCategory.Text = "Add";
                lbl_EditRowId.Text = "";
            }
            txt_Easy.Text = "";
            txt_Mod.Text = "";
            txt_Diff.Text = "";
            TotalQuestion = "";
            ddl_Category.SelectedIndex = -1;
        }
        else
        {
            lbl_Msg.Text = "Please Select Q Section";
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string dublicate = "";
        int n, i, flag = 0, position = 0, items = 0, j;
        double gst;

        DataTable dtCategory = (DataTable)Session["Category"];
        dtCategory.Rows.RemoveAt(e.RowIndex);
        Session["Category"] = dtCategory;


        grd_Category.EditIndex = -1;
        grd_Category.DataSource = (DataTable)Session["Category"];
        grd_Category.DataBind();

        Session["Tax"] = dtCategory;
        //this.FillItem();
        // CalculateFinalAmount();
    }
    protected void grd_Items_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        lbl_EditRowId.Text = e.NewSelectedIndex.ToString();

        DataTable dt = (DataTable)Session["Category"];
        ddl_Category.SelectedValue = grd_Category.DataKeys[e.NewSelectedIndex].Value.ToString();
        txt_Easy.Text = grd_Category.Rows[e.NewSelectedIndex].Cells[1].Text;
        txt_Mod.Text = grd_Category.Rows[e.NewSelectedIndex].Cells[2].Text;
        txt_Diff.Text = grd_Category.Rows[e.NewSelectedIndex].Cells[3].Text;
        grd_Category.EditIndex = -1;

        btn_AddCategory.Text = "Update";

    }
    protected void FillItem()
    {
        grd_Category.EditIndex = -1;
        grd_Category.DataSource = (DataTable)Session["Category"];
        grd_Category.DataBind();
    }

    private void savePaperQuestionCategory(string Id)
    {

        int i, n, TotalQuestions = 0;
        string sql;
        DataTable dtCategory = (DataTable)Session["Category"];

        sql = "DELETE FROM tbl_PaperQuestionCategory WHERE PaperId=" + Id;
        c1.ExecuteQry(sql);
        n = grd_Category.Rows.Count;
        for (i = 0; i < n; i++)
        {
            sql = " INSERT INTO tbl_PaperQuestionCategory (PaperId,CategoryId, EasyQuestion,ModQuestion,DifQuestion) VALUES (";
            sql = sql + " '" + Id + "','" + grd_Category.DataKeys[i].Value.ToString() + "','" + grd_Category.Rows[i].Cells[1].Text + "',";
            sql = sql + "'" + grd_Category.Rows[i].Cells[2].Text + "',";
            sql = sql + " '" + grd_Category.Rows[i].Cells[3].Text + "');";
            c1.ExecuteQry(sql);

            TotalQuestions = TotalQuestions + Convert.ToInt32(grd_Category.Rows[i].Cells[4].Text);
        }

        sql = "UPDATE tbl_paper SET Questions='" + TotalQuestions + "' ";
        sql = sql + " WHERE paperId=" + Id;
        c1.ExecuteQry(sql);

    }

}
