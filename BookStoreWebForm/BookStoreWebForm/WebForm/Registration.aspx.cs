using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStoreWebForm.Model.ResquestModel;
using BookStoreWebForm.Service;
using BusinessLayer.Interface;
using Experimental.System.Messaging;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace BookStoreWebForm.WebForm
{
    public partial class Registration : System.Web.UI.Page
    {
        ICustomerBL customerBL;
        User user = new User();

        public Registration(ICustomerBL customerBL)
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

        protected void Button1_Click1(object sender, EventArgs e)
        {
            user.FirstName = FirstName.Text;
            user.LastName = LastName.Text;
            user.EmailAddress = EmailAddress.Text;
            user.Password = Password.Text;
            var result = customerBL.Registration(user);

            if (result != null && result.Equals(1))
            {
                ShowMessage("Registration is  successful", MessageType.Success);
            }
            else
            {
                ShowMessage("Email already exist", MessageType.Warning);
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BookStore/Login");
        }
    }
}