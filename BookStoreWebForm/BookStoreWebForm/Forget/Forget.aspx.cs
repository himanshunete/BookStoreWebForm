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

namespace BookStoreWebForm.Forget
{
    public partial class Forget : System.Web.UI.Page
    {

        private readonly Random _random = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Timeout = 1;

        }

        public void EmailService(string email, int otp)
        {
            try
            {
                string HtmlBody = "";

                using (StreamReader streamReader = new StreamReader(@"C:\\Users\\Himansu\\source\\repos\\FundooNotes_Application\\RepositoryLayer\\Services\\ResetPassword.html"))
                {
                    HtmlBody = streamReader.ReadToEnd();
                }

                string OTP = Convert.ToString(otp);
                HtmlBody = HtmlBody.Replace("OTP", OTP);
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress(email);
                message.To.Add(new MailAddress(email));
                message.Subject = "Reset Password";
                message.IsBodyHtml = true;
                message.Body = HtmlBody;
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(email, "nete1831");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand com = new SqlCommand("spForget", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@EmailAddress", EmailAddress.Text);
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;
            con.Open();
            var result = ReturnParameter.Value;
            con.Close();

            if (result != null && result.Equals(1))
            {
                ForgetMessage.Text = "Account doesnt exist, Please Register";
                ForgetMessage.Visible = true;

            }

            else if (result != null && result.Equals(2))
            {
                string email = EmailAddress.Text;
                int otp = RandomNumber();

                Session.Timeout = 1;
                Session["email"] = otp;
               

                // Checking Session variable is not empty  
                if (Session["email"] != null)
                {
                    EmailService(email, otp);
                    ForgetMessage.Text = "Email is being sent, Please check your email";
                    ForgetMessage.Visible = true;
                   
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
    }
}