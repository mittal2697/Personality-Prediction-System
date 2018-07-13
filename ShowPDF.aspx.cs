using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;



public partial class ShowPDF : System.Web.UI.Page
{
    static string PDF;
    static string TEXT2;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public static string ExtractTextFromPdf(string path)
    {
        using (PdfReader reader = new PdfReader(path))
        {
            StringBuilder text = new StringBuilder();

            for (int i = 1; i <= reader.NumberOfPages; i++)
            {
                text.Append(PdfTextExtractor.GetTextFromPage(reader, i));
            }

            return text.ToString();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = ExtractTextFromPdf(Server.MapPath("a.pdf"));
    }
}

