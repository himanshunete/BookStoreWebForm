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

                con.Open();
                var books1 = com.ExecuteReader();
                Repeater1.DataSource = books1;
                Repeater1.DataBind();
                con.Close();


            }
        }

        protected void RepeatInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox plus_minus = e.Item.FindControl("TextBox1") as TextBox;
            Button minus = e.Item.FindControl("Minus") as Button;
            Button plus = e.Item.FindControl("Plus") as Button;
            Button removeBookFromCart = e.Item.FindControl("Remove") as Button;
            int BookId1 = int.Parse((e.Item.FindControl("BookId") as Label).Text);
            int CartId = int.Parse((e.Item.FindControl("CartId") as Label).Text);

            if (e.CommandName == "removeBookFromCart")
            {
               int result = bookService.RemoveBookFromCart(CartId);

                if (result != null && result.Equals(1))
                {
                    ShowMessage("Book is removed from cart", MessageType.Success);
                    Response.Redirect("https://localhost:44313/BookStoreApp/Cart.aspx");
                }

                if (result != null && result.Equals(2))
                {
                    ShowMessage("Book doesnt exist in a cart", MessageType.Error);
                
                }


            }


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

        protected void Button1_Click(object sender, EventArgs e)
        {
            FirstName.Text = "Himanshu Nete";
            PhoneNumber.Text = "8805956103";
            PinCode.Text = "440024";
            Locality.Text = "Ladikar Layout";
            Address.Text = "27, Ladikar Layout, Manewada Road, Nagpur";
            City.Text = "Nagpur";
            Landmark.Text = "Shiv Mandir";
            Work.Checked = true;

            Continue.Visible = false;
            Edit.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            customer.Visible = true;
            PlaceOrder.Visible = false;
        }
    }
}