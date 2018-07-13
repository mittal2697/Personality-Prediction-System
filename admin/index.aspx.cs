using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_index : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Submit_Click1(object sender, EventArgs e)
    {
        string sql, cnt, pass, user;

        user = c1.Clean(txt_Email_Id.Text);
        pass = c1.Clean(txt_Password.Text);

        sql = "SELECT count(*) FROM tbl_AdminLogin WHERE LoginId='" + user + "' AND Password='" + pass + "'";

        cnt = c1.SelectScalar(sql);
        if (Convert.ToInt32(cnt) == 0)
        {
            lbl_Msg.Text = "Either Login Id or Password is Wrong";
        }
        else
        {
            c1.SetAdminLoginDetails(user);
            Response.Redirect("Admin_Home.aspx");
        }

    }
}
