using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Data.OleDb;

/// <summary>
/// Summary description for Class1
/// </summary>
public class ClsConnection
{
    public ClsConnection()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter adpt = new SqlDataAdapter();

    string ConStr = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
    
    public string Clean(string str)
    {
        str = str.Replace("'", "");
        str = str.Replace("//", "");
        str = str.Replace("http", "");
        str = str.Replace("www", "");
        return str;
    }


    public DataSet SelectDs(string str)
    {
        DataSet ds = new DataSet();
        //try
        //{
            if (con.State == ConnectionState.Closed)
            {
                con.ConnectionString = ConStr;
                con.Open();
            }
            cmd.Connection = con;
            cmd.CommandText = str;

            adpt.SelectCommand = cmd;
            adpt.Fill(ds);
            con.Close();
            return ds;
        //}
        //catch (Exception ex)
        //{
        //    return null;
        //}

        
    }

    public DataTable SelectDT(string str)
    {
        DataTable ds = new DataTable();
        //try
        //{
            if (con.State == ConnectionState.Closed)
            {
                con.ConnectionString = ConStr;
                con.Open();
            }
            cmd.Connection = con;
            cmd.CommandText = str;

            adpt.SelectCommand = cmd;
            adpt.Fill(ds);
            con.Close();
            return ds;
        //}
        //catch (Exception ex)
        //{
        //    return null;
        //}

       
    }

    public SqlDataReader SelectDr1(string str)
    {
        SqlDataReader dr;
        //try
        //{
            if (con.State == ConnectionState.Closed)
            {
                con.ConnectionString = ConStr;
                con.Open();
            }
            cmd.Connection = con;
            cmd.CommandText = str;

            dr = cmd.ExecuteReader();

            return dr;
        //}
        //catch (Exception ex)
        //{
        //    return null;
        //}

        
    }

    public void ExecuteQry(string str)
    {
        //try
        //{
            if (con.State == ConnectionState.Closed)
            {
                con.ConnectionString = ConStr;
                con.Open();
            }
            cmd.Connection = con;
            cmd.CommandText = str;

            cmd.ExecuteNonQuery();

            con.Close();
        //}
        //catch (Exception ex)
        //{

        //}
    }

    public string SelectScalar(string str)
    {
        string v;
        //try
        //{
            if (con.State == ConnectionState.Closed)
            {
                con.ConnectionString = ConStr;
                con.Open();
            }

            cmd.Connection = con;
            cmd.CommandText = str;

            v = cmd.ExecuteScalar().ToString();

            con.Close();
            return v;
        //}
        //catch (Exception ex)
        //{
        //    return null;
        //}

       
    }


    public void SendMailHTMLGmail(string toMail, string Subject, string MailContent)
    {
        MailMessage message = new MailMessage();

        var fromAddress = "sharma04anjali@gmail.com";
        string fromPassword = "Asdfghjkl04";
        message.From = new MailAddress(fromAddress, "Support Desk");
        message.To.Clear();
        message.To.Add(new MailAddress(toMail));
        message.Subject = Subject;
        message.IsBodyHtml = true;
        message.Body = "<html><body>" + MailContent + "</body></html>";

        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 20000;
        }

        smtp.Send(message);
    }


    public DataSet ReadExcel(string sql, string path)
    {
        string connString = "Provider=Microsoft.Jet.OLEDB.4.0;" +
   "Data Source=" + path + ";" +
   "Extended Properties=Excel 8.0;";

        string connString1 = "Provider=Microsoft.ACE.OLEDB.12.0;" +
   "Data Source=" + path + ";" +
   "Extended Properties=Excel 12.0;";

        DataSet ds = new DataSet();

        OleDbConnection oledbConn = new OleDbConnection(connString);
        oledbConn.Open();
        OleDbCommand cmd = new OleDbCommand(sql, oledbConn);
        OleDbDataAdapter oleda = new OleDbDataAdapter();
        oleda.SelectCommand = cmd;
        oleda.Fill(ds);
        oledbConn.Close();
        return ds;
    }

    public string Encryptdata(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
    }

    public string Decryptdata(string encryptpwd)
    {
        string decryptpwd = string.Empty;
        UTF8Encoding encodepwd = new UTF8Encoding();
        Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        return decryptpwd;
    }

    public void SetAdminLoginDetails(string LoginId)
    {
        string sql;
        SqlDataReader rd;

        sql = " SELECT * FROM tbl_AdminLogin WHERE LoginId='" + LoginId + "'";
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr;
            con.Open();
        }

        cmd.CommandText = (sql);
        cmd.Connection = con;
        rd = cmd.ExecuteReader();

        if (rd.Read())
        {
            System.Web.HttpContext.Current.Session.Add("AdminId", rd["AdminId"].ToString());
            System.Web.HttpContext.Current.Session.Add("LoginId", rd["LoginId"].ToString());
        }
        rd.Close();
    }


    public void SetLoginDetails(string EmailId)
    {
        string sql;
        SqlDataReader rd;

        sql = " SELECT * FROM tbl_Member WHERE EmailId='" + EmailId + "'";
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr;
            con.Open();
        }

        cmd.CommandText = (sql);
        cmd.Connection = con;
        rd = cmd.ExecuteReader();

        if (rd.Read())
        {
            System.Web.HttpContext.Current.Session.Add("PhotoUrl", rd["PhotoUrl"].ToString());
            System.Web.HttpContext.Current.Session.Add("MemberName", rd["MemberName"].ToString());
            System.Web.HttpContext.Current.Session.Add("MemberId", rd["MemberId"].ToString());
            System.Web.HttpContext.Current.Session.Add("EmailId", rd["EmailId"].ToString());

        }
        rd.Close();
    }


    public void FillImages()
    {
        string sql;
        SqlDataReader rd;

        sql = " SELECT * FROM tbl_CompanyInfo ";
        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = ConStr;
            con.Open();
        }

        cmd.CommandText = (sql);
        cmd.Connection = con;
        rd = cmd.ExecuteReader();

        if (rd.Read())
        {
            System.Web.HttpContext.Current.Session.Add("DeshBoard", rd["DeshBoard"].ToString());
            System.Web.HttpContext.Current.Session.Add("AboutUS", rd["AboutUS"].ToString());
            System.Web.HttpContext.Current.Session.Add("ContactUs", rd["ContactUs"].ToString());
            System.Web.HttpContext.Current.Session.Add("Prices", rd["Prices"].ToString());
            System.Web.HttpContext.Current.Session.Add("Banner1", rd["Banner1"].ToString());
            System.Web.HttpContext.Current.Session.Add("Banner2", rd["Banner2"].ToString());
            System.Web.HttpContext.Current.Session.Add("Banner3", rd["Banner3"].ToString());
            System.Web.HttpContext.Current.Session.Add("Banner4", rd["Banner4"].ToString());
            System.Web.HttpContext.Current.Session.Add("Subject", rd["Subject"].ToString());
            System.Web.HttpContext.Current.Session.Add("Login", rd["Login"].ToString());
            System.Web.HttpContext.Current.Session.Add("Retake", rd["Test"].ToString());
            System.Web.HttpContext.Current.Session.Add("Negative", rd["Negative"].ToString());

        }
        rd.Close();

    }
}
