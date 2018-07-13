using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_TestInstruction : System.Web.UI.Page
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
            FillPaper();
            if (opt_QuestionType.SelectedIndex == 0)
            {
                div_text.Visible = false;
                div_Image.Visible = true;
            }
            else
            {

                div_text.Visible = true;
                div_Image.Visible = false;
            }
        }
    }

    public void FillPaper()
    {
        string str, sql;
        int cnt;

        str = "SELECT *,'../'+ PhotoUrl as PhotoUrl1 FROM tbl_TestInstruction where Id1 > 0 ";

        if (Session["AdminId"].ToString() != "1")
            str = str + " and AdminId=" + Session["AdminId"].ToString();


        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();

    }

   

    protected void linkAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
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
        {
            string sql, fn, path, id, ext;

            if (lbl_Opr.Text == "Add")
            {
                if (opt_QuestionType.SelectedIndex == 0)
                {
                    if (FU_Question.HasFile)
                    {
                        sql = "insert into tbl_TestInstruction (InstructionType,Title,AdminId) values ";
                        sql = sql + " ('Image','" + txt_Title.Text + "','" + Session["AdminId"].ToString() + "') ";
                        c1.ExecuteQry(sql);

                        sql = "SELECT MAX(Id1) FROM tbl_TestInstruction ";
                        id = c1.SelectScalar(sql);

                        fn = FU_Question.FileName;
                        ext = fn.Substring(fn.LastIndexOf("."), fn.Length - fn.LastIndexOf("."));

                        fn = id + ext;
                        path = Server.MapPath("../TestInstruction");
                        path = path + "\\" + id + ext;

                        FU_Question.SaveAs(path);

                        sql = "UPDATE tbl_TestInstruction SET PhotoUrl ='TestInstruction/" + id + ext + "' ";
                        sql = sql + " WHERE Id1=" + id;
                        c1.ExecuteQry(sql);

                        txt_QuestionText.Content = "";
                        txt_Title.Text = "";

                        lbl_Msg.Text = "Instruction Added Successfully";
                    }
                    else
                    {
                        lbl_Msg.Text = "Select File to Upload";
                    }
                }
                else
                {
                    sql = "insert into tbl_TestInstruction (InstructionType,TestInstruction,Title,AdminId) values(";
                    sql = sql + "'Text','" + c1.Clean(txt_QuestionText.Content) + "','" + txt_Title.Text + "','" + Session["AdminId"].ToString() + "') ";
                    c1.ExecuteQry(sql);
                    txt_QuestionText.Content = "";
                    txt_Title.Text = "";
                    
                    lbl_Msg.Text = "Question Added Successfully";
                }
            }
            else
            {
                if (opt_QuestionType.SelectedIndex == 0)
                {
                    if (FU_Question.HasFile)
                    {
                        id = lbl_Id.Text;

                        fn = FU_Question.FileName;
                        ext = fn.Substring(fn.LastIndexOf("."), fn.Length - fn.LastIndexOf("."));

                        fn = id + ext;
                        path = Server.MapPath("../TestInstruction");
                        path = path + "\\" + id + ext;

                        FU_Question.SaveAs(path);

                        sql = "UPDATE tbl_TestInstruction set ";
                        sql = sql + " InstructionType='Image',TestInstruction='', ";
                        sql = sql + " PhotoUrl ='TestInstruction/" + id + ext + "', ";
                        sql = sql + " Title='" + txt_Title.Text + "'";
                        sql = sql + " where Id1=" + lbl_Id.Text;
                        c1.ExecuteQry(sql);
                    }
                    else
                    {
                        sql = "UPDATE tbl_TestInstruction set ";
                        sql = sql + " Title='" + txt_Title.Text + "'";
                        sql = sql + " where Id1=" + lbl_Id.Text;
                        c1.ExecuteQry(sql);
                    }
                }
                else
                {
                    sql = "UPDATE tbl_TestInstruction set ";
                    sql = sql + " InstructionType='Text',PhotoUrl='',";
                    sql = sql + " TestInstruction ='" + c1.Clean(txt_QuestionText.Content) + "', ";
                    sql = sql + " Title='" + txt_Title.Text + "'";
                    sql = sql + " where Id1=" + lbl_Id.Text;
                    c1.ExecuteQry(sql);
                }
                

                txt_QuestionText.Content = "";
                txt_Title.Text = "";
                FillPaper();
                MultiView1.ActiveViewIndex = 0;
            }
        }


    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string str, id;
        lbl_Id.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_QId")).Text;

        if (e.CommandName == "Delete")
        {
            str = "delete from tbl_TestInstruction where Id1=" + lbl_Id.Text;
            c1.ExecuteQry(str);
            FillPaper();
        }
        else if (e.CommandName == "Edit")
        {
            string sql, cnt;
            sql = "Select count(*) InstructionType from tbl_TestInstruction where InstructionType= 'Text' And  Id1=" + lbl_Id.Text;
            cnt = c1.SelectScalar(sql);
            if (Convert.ToInt16(cnt) > 0)
            {
                opt_QuestionType.SelectedIndex = 1;
                div_text.Visible = true;
                div_Image.Visible = false;

            }
            else
            {
                opt_QuestionType.SelectedIndex = 0;
                div_text.Visible = false;
                div_Image.Visible = true;

            }
            txt_QuestionText.Content = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_TestInstruction")).Text;
            txt_Title.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Title")).Text;
         
            lbl_Opr.Text = "Edit";
            MultiView1.ActiveViewIndex = 1;
        }
        //else if (e.CommandName == "EnableStatus")
        //{
        //    if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
        //    {
        //        str = "update tbl_paper set EnableStatus=1";
        //        str = str + " WHERE CategoryId=" + lbl_Id.Text;
        //    }
        //    else
        //    {
        //        str = "update tbl_paper set EnableStatus=0";
        //        str = str + " WHERE CategoryId=" + lbl_Id.Text;
        //    }
        //    c1.ExecuteQry(str);
        //    FillPaper();
        //}
    }
   

    protected void opt_QuestionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (opt_QuestionType.SelectedIndex == 0)
        {
            div_text.Visible = false;
            div_Image.Visible = true;
        }
        else
        {

            div_text.Visible = true;
            div_Image.Visible = false;
        }
    }
}
