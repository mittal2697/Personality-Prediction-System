using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Net;
using System.Web.Script.Serialization;


public partial class LoginRegister : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{

        //}

    }


    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql, cnt;

        sql = " SELECT Count(*) FROM tbl_Member WHERE EmailId='" + txt_EmailId.Text + "'";
        cnt = c1.SelectScalar(sql);
        if (Convert.ToInt32(cnt) == 1)
        {
            lbl_Msg_Reg.Text = "This EmailId is Already Registered.";
        }
        else
        {
            sql = " INSERT INTO tbl_Member (MemberName, EmailId, ContactNo, Password, RegDate,EnableStatus) VALUES (";
            sql = sql + " '" + txt_MemberName.Text + "',";
            sql = sql + " '" + txt_EmailId.Text + "',";
            sql = sql + " '" + txt_ContactNo.Text + "',";
            sql = sql + " '" + txt_Password.Text + "',";
            sql = sql + " '" + DateTime.Now.ToShortDateString() + "',1)";

            c1.ExecuteQry(sql);
            //c1.SetLoginDetails(txt_EmailId.Text);

            txt_ContactNo.Text = "";
            txt_EmailId.Text = "";
            txt_MemberName.Text = "";
            txt_Password.Text = "";
            txt_ConfirmPassword.Text = "";

            lbl_Msg_Reg.Text = "Registration Completed Successfully.";

        }
    }

    protected void btn_Submit_Login_Click(object sender, EventArgs e)
    {
        string sql = "", cnt, path;

        sql = " SELECT Count(*) FROM tbl_Member WHERE EmailId='" + c1.Clean(txt_EmailId_Login.Text) + "'";
        sql = sql + " AND Password='" + c1.Clean(txt_Password_Login.Text) + "'";
        sql = sql + " AND EnableStatus=1";
        cnt = c1.SelectScalar(sql);

        if (Convert.ToInt32(cnt) == 1)
        {
            c1.SetLoginDetails(txt_EmailId_Login.Text);
            if (Session["RefUrl"] != null)
            {
                path = Session["RefUrl"].ToString();
                if (Session["RefUrl"].ToString() == "TakeExam")
                {
                    Session.Remove("RefUrl");
                    Response.Redirect("Test_Insturction.aspx");
                    //ScriptManager.RegisterStartupScript(this, typeof(string), "New_Window", "window.open( 'TakeExamI.aspx', null, 'resizable=no,height=800,width=1280,status=no,toolbar=no,menubar=no,location=no' );", true);
                }
                else
                {
                    Session.Remove("RefUrl");
                    Response.Redirect(path);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

            //lbl_Msg.Text = "Success";
        }
        else
        {
            lbl_Msg_Login.Text = "Either Email Id / Password is Wrong or Not Activated.";
        }
    }
}
