using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyAccount_ChangePass : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberId"] == null)
        {
            Response.Redirect("LoginRegister.aspx");
        }
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql,cnt;
        sql="SElECT count(*) from tbl_Member WHERE EmailId='"+Session["EmailId"] +"' AND Password='"+txt_OldPassword.Text+"' ";
        cnt =c1.SelectScalar(sql);

        if (Convert.ToInt32(cnt) == 1)
        {
            sql = "UPDATE tbl_Member SET Password='"+ txt_NewPassword.Text+"'";
            sql = sql + " WHERE MemberId=" + Session["MemberId"];
            c1.ExecuteQry(sql);
            lbl_Msg.Text = "Your Password Has Changed.";
            txt_OldPassword.Text = "";
            txt_ConfirmPassword.Text = "";
            txt_NewPassword.Text = "";
        }
        else
        {
            lbl_Msg.Text = "Somthing Wrong! Pasword Can't be Changed.";
        }
    }
}