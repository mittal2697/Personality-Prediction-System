using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin_Contact_Mange : System.Web.UI.Page
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

            FillSubject();
        }
    }

    public void FillSubject()
    {
        string str;
        str = "SELECT * FROM tbl_ContactUs ";
        Repeater1.DataSource = c1.SelectDs(str);
        Repeater1.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string str, id;
        id = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Id")).Text;

        if (e.CommandName == "Delete")
        {
            str = "delete from tbl_ContactUs where ID1=" + id;
            c1.ExecuteQry(str);
            FillSubject();
        }
       
    }

}