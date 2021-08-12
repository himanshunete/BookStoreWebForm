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
    public partial class ResetPassword : System.Web.UI.Page
    {
        UserAccount reset = new UserAccount();
        User user = new User();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            user.EmailAddress = (string)Session["EmailAddress"];
            user.Password = NewPassword.Text;
            var result = reset.Reset(user);

            if (result != null && result.Equals(1))
            {
                ResetMessage.Text = "Password reset is successful, Go to Login";
                ResetMessage.Visible = true;
            }
            else
            {
                ResetMessage.Text = "Password reset is not successful, Please reset again";
                ResetMessage.Visible = true;
            }
        }
    }
}