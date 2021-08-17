using BookStoreWebForm.Model.ResquestModel;
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

namespace BookStoreWebForm.BookStoreApp
{
    public partial class Cart : System.Web.UI.Page
    {
        //create new sqlconnection and connection to database by using connection string from web.config file  
        public static readonly string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        BookService bookService = new BookService();
        Bag bag = new Bag();
        public int value = 0;

        public enum MessageType { Success, Error, Info, Warning };

        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            int CustomerId = (int)Session["CustomerId"];
            if (!IsPostBack)
            {
                //var books =  bookService.DisplayBook();

                SqlCommand com = new SqlCommand("spDisplayBookInACart", con);
                com.CommandType = System.Data.CommandType.StoredProcedure;


                com.Parameters.AddWithValue("@id", CustomerId);
                var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
                ReturnParameter.Direction = ParameterDirection.ReturnValue;

                con.Open();
                var books = com.ExecuteReader();
                RepeatInformation.DataSource = books;
                RepeatInformation.DataBind();
                con.Close();


            }
        }

        protected void RepeatInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox plus_minus = e.Item.FindControl("TextBox1") as TextBox;
            Button minus = e.Item.FindControl("Minus") as Button;
            Button plus = e.Item.FindControl("Plus") as Button;
            int BookId1 = int.Parse((e.Item.FindControl("BookId") as Label).Text);


            if (e.CommandName == "minus")
            {
                if (plus_minus.Text.Equals("0"))
                {
              
                    value = 0;

                }
                else
                {
                  
                    value = Convert.ToInt32(plus_minus.Text);
                }

                value--;
                bookService.BookQuantityMinus(value, BookId1);


            }

            if (e.CommandName == "plus")
            {
                if (plus_minus.Text.Equals("0"))
                {
                    plus_minus.Text = plus.Text.ToString();
                    value = 0;

                }
                else
                {
                   
                    value = Convert.ToInt32(plus_minus.Text);
                }

                value++;
                bookService.BookQuantityPlus(value, BookId1);
            }

            plus_minus.Text = value.ToString();

          


        }

    }
}