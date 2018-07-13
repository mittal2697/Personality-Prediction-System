using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgetPassword : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
             
        }

    }

    protected void lnk_ForgetPassword_Click(object sender, EventArgs e)
    {
        String sql, cnt, Msg;
        DataTable dr;

        sql = " SELECT * FROM tbl_Member WHERE EmailId='" + txt_MailForgetPass.Text + "'";
        dr = c1.SelectDT(sql);  
        if (dr.Rows.Count == 0)
        {
            lbl_Msg.Text = "This EmailId is Not Registered.";
        }
        else
        {
            Msg = "Your Password is "+ dr.Rows[0]["Password"].ToString();
            
            c1.SendMailHTMLGmail(txt_MailForgetPass.Text,"Your Password ", Msg);
            lbl_Msg.Text = "Your Password is sent";
        }
       
    }
}
