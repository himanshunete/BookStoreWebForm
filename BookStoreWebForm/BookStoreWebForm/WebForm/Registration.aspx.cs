﻿using System;
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
using Experimental.System.Messaging;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace BookStoreWebForm.WebForm
{
    public partial class Registration : System.Web.UI.Page
    {
        UserAccount registration = new UserAccount();
        User user = new User();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            user.FirstName = FirstName.Text;
            user.LastName = LastName.Text;
            user.EmailAddress = EmailAddress.Text;
            user.Password = Password.Text;
            var result = registration.Registration(user);

            if (result != null && result.Equals(1))
            {
                RegistrationMessage.Text = "Registration is  successful";
                RegistrationMessage.Visible = true;
            }
            else
            {
                RegistrationMessage.Text = "Email already exist";
                RegistrationMessage.Visible = true;
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44313/WebForm/Login.aspx");
        }
    }
}