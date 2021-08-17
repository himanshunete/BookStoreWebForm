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
        Cart cart = new Cart();

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
            int CustomerId = (int)Session["CustomerId"];
            if (e.CommandName == "addToCart")
            {
                Button addToCart = e.Item.FindControl("AddToCart") as Button;
                Button wishlist = e.Item.FindControl("WishList") as Button;
                Button wishlisted = e.Item.FindControl("AddedToWishList") as Button;
                Button addedToCart = e.Item.FindControl("AddedToCart") as Button;
                int BookId = int.Parse((e.Item.FindControl("BookId") as Label).Text);

                cart.BookId = BookId;
                cart.Id = CustomerId;
                var result = bookService.AddToCart(cart);

                if (result != null && result.Equals(1))
                {
                    addToCart.Visible = false;
                    wishlist.Visible = false;
                    addToCart.Enabled = false;
                    wishlist.Enabled = false;
                    addedToCart.Visible = true;
                    addedToCart.Enabled = false;
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

                cart.BookId = BookId;
                cart.Id = CustomerId;
                var result = bookService.AddToWishList(cart);


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
    }
}