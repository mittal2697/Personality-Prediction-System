using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inner : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberId"] == null)
        {
            Response.Redirect("LoginRegister.aspx");
        }

        else
        {
            imgMember.Src = Session["PhotoUrl"].ToString();
            lbl_WelCome.Text = Session["MemberName"].ToString();
        }
    }
    protected void btn_LogoutUser_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();     
        Response.Redirect("Default.aspx");
    }
}
