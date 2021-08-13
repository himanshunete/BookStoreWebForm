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

        public enum MessageType { Success, Error, Info, Warning };

        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            user.EmailAddress = EmailAddress.Text;
            user.Password = Password.Text;
            var result = login.Login(user);

            if (result != null && result.Equals(1))
            {
                ShowMessage("Account doesnt exist", MessageType.Error);
            }
            else if (result != null && result.Equals(2))
            {
                ShowMessage("Wrong Password </br> Failed to Login", MessageType.Error);
            }
            else
            {
                ShowMessage("Login is successful", MessageType.Success);
            }
        }

        protected void CreateButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44313/WebForm/Registration.aspx");
        }

        protected void ForgetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44313/WebForm/Forget.aspx");
        }
    }
}