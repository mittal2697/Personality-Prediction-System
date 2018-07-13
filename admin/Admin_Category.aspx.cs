using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Category : System.Web.UI.Page
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
         
            str = "SELECT CASE EnableStatus WHEN 0 THEN 'Enable' ELSE 'Disable' END AS EnableStatus1,  CategoryId, CategoryName, SubjectId FROM tbl_Category " ;
            //if (Session["AdminId"].ToString() != "1")
            //    str = str + " and AdminId=" + Session["AdminId"].ToString();

            Repeater1.DataSource = c1.SelectDs(str);
            Repeater1.DataBind();
        
    }

    

    protected void linkAdd_Click(object sender, EventArgs e)
    {
        lbl_Opr.Text = "Add";
        txt_Question_Title.Text = "";
        
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

            sql = "insert into tbl_Category (EnableStatus,CategoryName, AdminId) values(1,'" + txt_Question_Title.Text + "', '";
            sql = sql + Session["AdminId"].ToString() + "')";
            c1.ExecuteQry(sql);
            txt_Question_Title.Text = "";
            lbl_Msg.Text = "Q Section Added Successfully";

        }
        else
        {
            sql = "UPDATE tbl_Category SET CategoryName='" + txt_Question_Title.Text + "' ";
            sql = sql + " WHERE CategoryId=" + lbl_Id.Text;
            c1.ExecuteQry(sql);

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
            str = "delete from tbl_Category where CategoryId=" + lbl_Id.Text;
            c1.ExecuteQry(str);
            FillCategory();
        }
        else if (e.CommandName == "Edit")
        {
            txt_Question_Title.Text = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_CategoryName")).Text;
          
            lbl_Opr.Text = "Edit";
            MultiView1.ActiveViewIndex = 1;
        }
        else if (e.CommandName == "EnableStatus")
        {
            if (((LinkButton)Repeater1.Items[e.Item.ItemIndex].FindControl("lnk_Status")).Text == "Enable")
            {
                str = "update tbl_Category set EnableStatus=1";
                str = str + " WHERE CategoryId=" + lbl_Id.Text;
            }
            else
            {
                str = "update tbl_Category set EnableStatus=0";
                str = str + " WHERE CategoryId=" + lbl_Id.Text;
            }
            c1.ExecuteQry(str);
            FillCategory();
        }
    }


    

    

   
}
