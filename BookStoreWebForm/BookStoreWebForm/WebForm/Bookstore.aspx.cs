using BookStoreWebForm.Model.ResquestModel;
using BookStoreWebForm.Service;
using BusinessLayer.Interface;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreWebForm.WebForm
{
    public partial class Bookstore : System.Web.UI.Page
    {
        //create new sqlconnection and connection to database by using connection string from web.config file  
        public static readonly string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        IBookStoreBL bookStoreBL;
        Bag bag = new Bag();

        public Bookstore(IBookStoreBL bookStoreBL)
        {
            this.bookStoreBL = bookStoreBL;
        }

        public enum MessageType { Success, Error, Info, Warning };

        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand com = new SqlCommand("spDisplayBook", con);
                com.CommandType = System.Data.CommandType.StoredProcedure;

                var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
                ReturnParameter.Direction = ParameterDirection.ReturnValue;

                con.Open();
                var books = com.ExecuteReader();
                RepeatInformation.DataSource = books;
                RepeatInformation.DataBind();
                con.Close();

                var count = bookStoreBL.DisplayBookCount();
                BookCount.Text = "(" + count.ToString() + " items"+ ")";
            }
        }

        protected void RepeatInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Button addToCart = e.Item.FindControl("AddToCart") as Button;
            Button wishlist = e.Item.FindControl("WishList") as Button;
            Button wishlist2 = e.Item.FindControl("WishList1") as Button;
            Button wishlisted = e.Item.FindControl("AddedToWishList") as Button;
            Button addedToCart = e.Item.FindControl("AddedToCart") as Button;
            int BookId = int.Parse((e.Item.FindControl("BookId") as Label).Text);
            Session["BookId"] = BookId; 
            int CustomerId = (int)Session["CustomerId"];

            if (Session["CustomerId"] == null)
            {
                ShowMessage("First Login, and then proceed to buy books", MessageType.Success);
            }

            else
            {
                if (e.CommandName == "addToCart")
                {
                    int count = 0;
                    count = count + 1;
                    Session["CartCount"] = count; 
                    bag.BookId = BookId;
                    bag.Id = CustomerId;
                    var result = bookStoreBL.AddToCart(bag);

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
                    bag.BookId = BookId;
                    bag.Id = CustomerId;
                    var result = bookStoreBL.AddToWishList(bag);

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
}