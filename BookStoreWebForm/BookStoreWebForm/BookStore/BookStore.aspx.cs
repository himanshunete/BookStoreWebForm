using BookStoreWebForm.Service;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreWebForm.BookStore
{
    public partial class BookStore : System.Web.UI.Page
    {
        //create new sqlconnection and connection to database by using connection string from web.config file  
        public static readonly string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        BookService bookService = new BookService();
        protected void Page_Load(object sender, EventArgs e)
        {
           //var books =  bookService.DisplayBook();

            SqlCommand com = new SqlCommand("spDisplayBook", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            var books = com.ExecuteReader();
            RepeatInformation.DataSource = books;
            RepeatInformation.DataBind();
            con.Close();

            var count = bookService.DisplayBookCount();
            BookCount.Text = count.ToString() + " items";
        }
    }
}