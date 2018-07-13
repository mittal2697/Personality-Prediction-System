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


public partial class about_Us : System.Web.UI.Page
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
    //    sql = "SELECT * FROM tbl_AboutUs ";

    //    ds = c1.SelectDs(sql);
    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        lbl_AboutUs.Text = ds.Tables[0].Rows[0]["AboutUs"].ToString();
    //    }


    //}

}
