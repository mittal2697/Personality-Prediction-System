using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_AboutUs : System.Web.UI.Page
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

    public void FillDetails()
    {
        string str;
        str = "select * from tbl_AboutUs ";
        txt_Editor.Content = c1.SelectScalar(str);
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql;

        sql = "update tbl_AboutUs set AboutUs='" + txt_Editor.Content + "'";
        c1.ExecuteQry(sql);
    }

}

