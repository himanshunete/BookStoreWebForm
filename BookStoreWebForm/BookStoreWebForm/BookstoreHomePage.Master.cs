using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreWebForm
{
    public partial class BookstoreHomePage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Session["CartCount"].ToString() == "0") {
            //    notification.Text = Session["CartCount"].ToString();
            //}
            //else if (notification.Text = Session["CartCount"].ToString())
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BookStore/Login");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BookStore/Registration");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BookStore/Cart");
        }
    }
}