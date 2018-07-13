using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_ContactUsUpdate : System.Web.UI.Page
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
            FillGridTopic();
        }
    }

    public void FillGridTopic()
    {
        string str;
        str = "select CPhone from tbl_CompanyInfo ";
        txt_Phone.Content = c1.SelectScalar(str);

        str = "select CEmail from tbl_CompanyInfo ";
        txt_Email.Content = c1.SelectScalar(str);

        str = "select CAddress from tbl_CompanyInfo ";
        txt_Address.Content = c1.SelectScalar(str);
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql;

        sql = "update tbl_CompanyInfo set CPhone='" + txt_Phone.Content + "',";
        sql = sql + " CEmail='" + txt_Email.Content + "',";
        sql = sql + " CAddress='" + txt_Address.Content + "'";
        c1.ExecuteQry(sql);

    }

}

