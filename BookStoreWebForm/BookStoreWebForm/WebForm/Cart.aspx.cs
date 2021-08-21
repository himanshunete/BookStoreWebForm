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
    public partial class Cart : System.Web.UI.Page
    {
        //create new sqlconnection and connection to database by using connection string from web.config file  
        public static readonly string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        IBookStoreBL bookStoreBL;
        Bag bag = new Bag();
        public int value = 0;

        public Cart(IBookStoreBL bookStoreBL)
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
                if (Session["CustomerId"] == null)
                {
                    ShowMessage("First Login, and then proceed ", MessageType.Success);
                }
                else
                {
                    int CustomerId = (int)Session["CustomerId"];
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
                    var bookOrder = com.ExecuteReader();
                    Repeater1.DataSource = bookOrder;
                    Repeater1.DataBind();
                    con.Close();
                }
            }
        }

        protected void RepeatInformation_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox plus_minus = e.Item.FindControl("Count") as TextBox;
            Button minus = e.Item.FindControl("Minus") as Button;
            Button plus = e.Item.FindControl("Plus") as Button;
            Button removeBookFromCart = e.Item.FindControl("Remove") as Button;
            int BookId1 = int.Parse((e.Item.FindControl("BookId") as Label).Text);
            int CartId = int.Parse((e.Item.FindControl("CartId") as Label).Text);
            int id = (int)Session["CustomerId"];
            string encrypt = Session["EncryptCustomerId"].ToString();

            if (e.CommandName == "removeBookFromCart")
            {
               int result = bookStoreBL.RemoveBookFromCart(CartId);

                if (result != null && result.Equals(1))
                {
                    ShowMessage("Book is removed from cart", MessageType.Success);
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

                if (value >=0 )
                {
                    bookStoreBL.BookQuantityMinus(value, BookId1, id);
                    plus_minus.Text = value.ToString();
                    plus_minus.Enabled = true;
                }

                else
                {
                    plus_minus.Enabled = false;
                }
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
                    int result = bookStoreBL.BookMaximumCount(value, BookId1, id);
                    if ( result.Equals(1))
                    {
                        plus_minus.Enabled = false;
                    }
                    if (result.Equals(2))
                    {
                    bookStoreBL.BookQuantityPlus(value, BookId1, id);
                        plus_minus.Text = value.ToString();
                    }
                if (result.Equals(3))
                {
                    plus_minus.Text = value.ToString();
                    plus_minus.Enabled = false;
                }
            }
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
            Repeater1.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                int BookId1 = int.Parse((Repeater1.Items[i].FindControl("BookId1") as Label).Text);
                int CartId1 = int.Parse((Repeater1.Items[i].FindControl("CartId1") as Label).Text);
                int Count = int.Parse((Repeater1.Items[i].FindControl("Count") as Label).Text);
                bookStoreBL.Order(CartId1, BookId1);
            }
            Response.Redirect("/BookStore/Order");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            customer.Visible = true;
            PlaceOrder.Visible = false;
        }
    }
}