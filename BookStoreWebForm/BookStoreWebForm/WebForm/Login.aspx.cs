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

namespace BookStoreWebForm.WebForm
{
    public partial class Login : System.Web.UI.Page
    {
        UserAccount login = new UserAccount();
        User user = new User();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            user.EmailAddress = EmailAddress.Text;
            user.Password = Password.Text;
            var result = login.Login(user);

            if (result != null && result.Equals(1))
            {
                LoginMessage.Text = "Account doesnt exist";
                LoginMessage.Visible = true;

            }
            else if (result != null && result.Equals(2))
            {
                LoginMessage.Text = "Wrong Password </br> Failed to Login";
                LoginMessage.Visible = true;
            }
            else
            {
                LoginMessage.Text = "Login is successful";
                LoginMessage.Visible = true;
            }
        }

        protected void CreateButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44313/WebForm/Registration.aspx");
        }
    }
}