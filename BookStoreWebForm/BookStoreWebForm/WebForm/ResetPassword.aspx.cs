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
    public partial class ResetPassword : System.Web.UI.Page
    {
        ICustomerBL customerBL;
        User user = new User();

        public ResetPassword(ICustomerBL customerBL)
        {
            this.customerBL = customerBL;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public enum MessageType { Success, Error, Info, Warning };

        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            user.EmailAddress = (string)Session["EmailAddress"];
            user.Password = NewPassword.Text;
            var result = customerBL.Reset(user);

            if (result != null && result.Equals(1))
            {
                ShowMessage("Password reset is successful, Go to Login", MessageType.Success);
            }

            else
            {
                ShowMessage("Password reset is not successful, Please reset again", MessageType.Error);
            }
        }
    }
}