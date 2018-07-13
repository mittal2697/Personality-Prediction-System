using System;
using System.Collections;
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

public partial class contact : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //FillDetails();
        }
    }

    //private void FillDetails()
    //{
    //    string sql;
    //    DataSet ds = new DataSet();

    //    sql = "SELECT * FROM tbl_CompanyInfo ";

    //    ds = c1.SelectDs(sql);
    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        lbl_Phone.Text = ds.Tables[0].Rows[0]["CPhone"].ToString();
    //        lbl_MailUs.Text = ds.Tables[0].Rows[0]["CEmail"].ToString();
    //        lbl_Address.Text = ds.Tables[0].Rows[0]["CAddress"].ToString();
    //    }
    //}


    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        string sql;

        sql = " INSERT INTO tbl_ContactUs (CName, EmailId, Message, Subject, PhoneNo) VALUES (";
        sql = sql + "'" + txt_Name.Text + "',";
        sql = sql + "'" + txt_EmailId.Text + "',";
        sql = sql + "'" + txt_Message.Text + "',";
        sql = sql + "'" + txt_Subject.Text + "',";
        sql = sql + "'" + txt_Phone.Text + "')";

        c1.ExecuteQry(sql);
        lbl_Msg.Text = "Your Request Sbumitted Successfully. Our Executives will contact you soon.";

        txt_EmailId.Text = "";
        txt_Name.Text = "";
        txt_Message.Text = "";
        txt_Subject.Text = "";
        txt_Phone.Text = "";
    }
    
}
