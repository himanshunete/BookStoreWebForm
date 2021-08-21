using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreWebForm.WebForm
{
    public partial class Order : System.Web.UI.Page
    {
        DataTable tb = new DataTable();
        DataRow dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Email Us", typeof(string)),
                    new DataColumn("Contact Us", typeof(string)),
                    new DataColumn("Address",typeof(string)) });
                dt.Rows.Add("admin@bookstore.com", "+91 8163475881", "42, 14th Main, 15th Cross, Sector4, opp to BDA" + "\r\n"
                + "complex, near Kumarakom restaurant, HSR Layout," + "\r\n"
                + "Banglore 560034");
               
                StringBuilder sb = new StringBuilder();
                //Table start.
                sb.Append("<table cellpadding='5' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;font-family:Arial;'>");

                //Adding HeaderRow.
                sb.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    sb.Append("<th style='background-color: #DCDCDC;border: 1px solid #ccc'>" + column.ColumnName + "</th>");
                }
                sb.Append("</tr>");

                //Adding DataRow.
                foreach (DataRow row in dt.Rows)
                {
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<td style='width:300px;border: 1px solid #ccc'>" + row[column.ColumnName].ToString() + "</td>");
                    }
                    sb.Append("</tr>");
                }

                //Table end.
                sb.Append("</table>");
                ltTable.Text = sb.ToString();
            }
        }

        protected void PlaceOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BookStore/Home");
        }
    }
}


