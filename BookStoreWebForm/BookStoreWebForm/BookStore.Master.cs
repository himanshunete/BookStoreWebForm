using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreWebForm.BookStoreMaster
{
    public partial class BookStore : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BookStore/Login");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BookStore/Registration");
        }
    }
}