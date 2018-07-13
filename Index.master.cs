using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberId"] != null)
        {
            MySec1.Visible = true;
            MySec2.Visible = true;
            MySec0.Visible = false;

            TopMenu1Index.Visible = false;
            TopMenu1Inner.Visible = true;

            lbl_WelCome.Text = Session["MemberName"].ToString();
            imgMember.Src = Session["PhotoUrl"].ToString();
            
        }
        else
        {
            MySec1.Visible = false;
            MySec2.Visible = false;
            MySec0.Visible = true;

            TopMenu1Index.Visible = true;
            TopMenu1Inner.Visible = false;

            lbl_WelCome.Text = "Guest";
        }
    }
     
    protected void btn_LogoutUser_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
}
