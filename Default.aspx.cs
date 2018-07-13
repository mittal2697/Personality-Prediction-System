using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    ClsConnection c1 = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            c1.FillImages();
             
            //FillNotification();
        }
    }

    //private void FillNotification()
    //{
    //    string str;
    //    str = "select * from tbl_Notification ";
    //    str = str + " WHERE EnableStatus =1 ";
    //    dl_Notification.DataSource = c1.SelectDs(str);
    //    dl_Notification.DataBind();
    //}

    
    
}
