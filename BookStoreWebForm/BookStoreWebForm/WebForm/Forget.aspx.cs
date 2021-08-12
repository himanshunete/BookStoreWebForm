﻿using BookStoreWebForm.Model.ResquestModel;
using BookStoreWebForm.Service;
using Experimental.System.Messaging;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
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

namespace BookStoreWebForm.WebForm
{
    public partial class Forget : System.Web.UI.Page
    {
        UserAccount forget = new UserAccount();
        User user = new User();
        SMTP smtp = new SMTP();
        private readonly Random _random = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {

            
            user.EmailAddress = EmailAddress.Text;
            Session["EmailAddress"] = EmailAddress.Text;
            var result = forget.Forget(user);

            if (result != null && result.Equals(1))
            {
                ForgetMessage.Text = "Account doesnt exist, Please Register";
                ForgetMessage.Visible = true;
            }
            else if (result != null && result.Equals(2))
            {
                string email = EmailAddress.Text;
                int otp = RandomNumber();
                Session["email"] = otp;

                // Checking Session variable is not empty  
                if (Session["email"] == null)
                {
                    snackbar.InnerText = "Otp is not generated, again generate an otp";
                }
                else {

                    smtp.EmailService(email, otp);
                    card1.Visible = false;
                    card2.Visible = true;
                }
            }

             
        }

        // Generates a random number within a range.      
        public int RandomNumber()
        {
            int min = 1000;
            int max = 9999;
            return _random.Next(min, max);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            
                // Convert  integers to string
                String s1 = One.Text.ToString();
                String s2 = Two.Text.ToString();
                String s3 = Three.Text.ToString();
                String s4 = Four.Text.ToString();

                // Concatenate both strings
                var otpString = s1 + s2 + s3 + s4;

                // Convert the concatenated string
                // to integer
                var otpInt = int.Parse(otpString);

                if (Session["email"].Equals(otpInt))
                {

                snackbar.InnerText = "Otp verification is done, you can proceed to reset your password ";
                    title.Visible = false;
                    One.Enabled = false;
                    Two.Enabled = false;
                    Three.Enabled = false;
                    Four.Enabled = false;
                    Button2.Enabled = false;
                    VerifyButton.Enabled = false;
                    LinkButton1.Enabled = true;
                }

                else
                {
                snackbar.InnerText = "Incorrect otp, send again ";
                }

            
            
        }

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44313/WebForm/ResetPassword.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44313/WebForm/Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int otp = RandomNumber();
            Session["email"] = otp;
            string email = Session["EmailAddress"].ToString();

            // Checking Session variable is not empty  
            if (Session["email"] == null)
            {
                OtpMessage.Text = "Otp is not generated, again generate an otp";
            }
            else
            {
                smtp.EmailService(email, otp);
            }
        }
    }
}