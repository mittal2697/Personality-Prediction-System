using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrivacyPolicy : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            FillDetails();
        }
    }

    private void FillDetails()
    {
        string sql;
        DataSet ds = new DataSet();
        sql = "SELECT * FROM tbl_Privacy ";

        ds = c1.SelectDs(sql);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_AboutUs.Text = ds.Tables[0].Rows[0]["Privacy"].ToString();
        }


    }

}
