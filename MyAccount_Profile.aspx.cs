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

public partial class MyAccount_Profile : System.Web.UI.Page
{

    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberId"] == null)
        {
            Response.Redirect("LoginRegister.aspx");
        }

        if (!Page.IsPostBack)
        {
            Filldata();
        }
    }

    private void Filldata()
    {
        string sql;
        DataTable dr;
        sql = "Select * From tbl_Member Where MemberId='" + Session["MemberId"].ToString() + "'";
        dr = c1.SelectDT(sql);
        if (dr.Rows.Count > 0)
        {
            img_Member.Src = dr.Rows[0]["PhotoUrl"].ToString();
            txt_ContactNo.Text = dr.Rows[0]["ContactNo"].ToString();
            txt_Email.Text = dr.Rows[0]["EmailId"].ToString();
            txt_Name.Text = dr.Rows[0]["MemberName"].ToString();
        }

        c1.SetLoginDetails(txt_Email.Text);

    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql, cnt;
        sql = " SELECT Count(*) FROM tbl_Member WHERE MemberId='" + Session["MemberId"].ToString() + "'";
        cnt = c1.SelectScalar(sql);
        if (Convert.ToInt32(cnt) == 1)
        {
            sql = " Update  tbl_Member set MemberName='" + txt_Name.Text + "',";
            sql = sql + "ContactNo='" + txt_ContactNo.Text + "'";
            sql = sql + " Where MemberId='" + Session["MemberId"].ToString() + "'";
            c1.ExecuteQry(sql);

            lbl_Msg.Text = "Profil Update SucessFully";
        }
    }
    protected void lnk_Upload_Click(object sender, EventArgs e)
    {
        string sql, fn, path, ext;
        int dot;
        if (FileUpload1.HasFile)
        {
            fn = FileUpload1.FileName;
            dot = fn.LastIndexOf(".");
            ext = fn.Substring(dot, fn.Length - dot);
            path = Server.MapPath("MemberPhoto");
            path = path + "\\" + Session["MemberId"].ToString() + ext;
            FileUpload1.SaveAs(path);

            sql = " Update  tbl_Member set  PhotoUrl='MemberPhoto/" + Session["MemberId"].ToString() + ext + "'";
            sql = sql + " Where  MemberId='" + Session["MemberId"].ToString() + "'";
            c1.ExecuteQry(sql);
            Session["PhotoUrl"] = "MemberPhoto/" + Session["MemberId"].ToString() + ext + "";
            img_Member.Src = null;
            img_Member.Src = Session["PhotoUrl"].ToString();
        }
    }
}