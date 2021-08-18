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
    public partial class Bookstore : System.Web.UI.Page
    {
        //create new sqlconnection and connection to database by using connection string from web.config file  
        public static readonly string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        BookService bookService = new BookService();
        Bag bag = new Bag();

        public enum MessageType { Success, Error, Info, Warning };

        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                BookCount.Text = "(" + count.ToString() + " items"+ ")";


            }


        }

        protected void RepeatInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Button addToCart1 = e.Item.FindControl("AddToCart") as Button;
            Button wishlist1 = e.Item.FindControl("WishList") as Button;
            Button wishlist2 = e.Item.FindControl("WishList1") as Button;
            Button wishlisted1 = e.Item.FindControl("AddedToWishList") as Button;
            Button addedToCart1 = e.Item.FindControl("AddedToCart") as Button;
            int BookId1 = int.Parse((e.Item.FindControl("BookId") as Label).Text);
            bool stock = (e.Item.FindControl("Stock") as Label).Visible;

            Session["BookId"] = BookId1; 
          
            if (Session["CustomerId"] == null){

                ShowMessage("First Login, and then proceed to buy books", MessageType.Success);
            }

            else
            {
                int CustomerId = (int)Session["CustomerId"];
                if (e.CommandName == "addToCart")
                {
                    Button addToCart = e.Item.FindControl("AddToCart") as Button;
                    Button wishlist = e.Item.FindControl("WishList") as Button;
                    Button wishlisted = e.Item.FindControl("AddedToWishList") as Button;
                    Button addedToCart = e.Item.FindControl("AddedToCart") as Button;
                    int BookId = int.Parse((e.Item.FindControl("BookId") as Label).Text);

                    bag.BookId = BookId;
                    bag.Id = CustomerId;
                    var result = bookService.AddToCart(bag);

                    if (result != null && result.Equals(1))
                    {
                        addToCart.Visible = false;
                        wishlist.Visible = false;
                        addedToCart.Visible = true;
                        wishlisted.Visible = false;
                        ShowMessage("Book is added to cart", MessageType.Success);
                    }

                    if (result != null && result.Equals(2))
                    {
                        ShowMessage("Book is out of stock", MessageType.Warning);
                    }
                }

                if (e.CommandName == "wishList")
                {
                    Button addToCart = e.Item.FindControl("AddToCart") as Button;
                    Button wishlist = e.Item.FindControl("WishList") as Button;
                    Button wishlisted = e.Item.FindControl("AddedToWishList") as Button;
                    Button addedToCart = e.Item.FindControl("AddedToCart") as Button;
                    int BookId = int.Parse((e.Item.FindControl("BookId") as Label).Text);

                    bag.BookId = BookId;
                    bag.Id = CustomerId;
                    var result = bookService.AddToWishList(bag);

                    if (result != null && result.Equals(1))
                    {
                        wishlist.Visible = false;
                        wishlist.Enabled = false;
                        wishlisted.Visible = true;
                        wishlisted.Enabled = true;
                        ShowMessage("Book is added to wishlist", MessageType.Success);
                    }

                }
            }

            if (stock == false)
            {
                wishlist2.Visible = true;
                wishlist2.Enabled = true;
                wishlist1.Visible = false;
                addToCart1.Visible = false;

            }
        }
    }
}