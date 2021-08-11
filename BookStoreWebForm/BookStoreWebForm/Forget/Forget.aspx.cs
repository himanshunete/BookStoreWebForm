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
            if (!IsPostBack)
            {
                
            }

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
                Session["SessionExpiry"] = DateTime.Now.AddSeconds(30);
                Session["email"] = otp;
                EmailService(email, otp);

               



               

               

              



                Session["email"] = otp;
               

                // Checking Session variable is not empty  
               

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
            if (Session["email"] == null)
            {
                OtpMessage.Text = "First generate an otp and send through email";
            }

            else
            {
                DateTime expiry = (DateTime)base.Context.Session["SessionExpiry"];
                if (expiry > DateTime.Now)
                {

                    // Convert  integers to string
                    String s1 = One.TextMode.ToString();
                    String s2 = Two.TextMode.ToString();
                    String s3 = Three.TextMode.ToString();
                    String s4 = Four.TextMode.ToString();

                    // Concatenate both strings
                    String otpString = s1 + s2 + s3 + s4;

                    // Convert the concatenated string
                    // to integer
                    var otpInt = int.Parse(otpString);

                    if (Session["email"].Equals(otpInt))
                    {
                        OtpMessage.Text = "Otp verification is done, you can proceed to reset your password ";
                    }

                    else
                    {
                        OtpMessage.Text = "Incorrect otp, send again ";
                    }

                }

                else
                {
                    OtpMessage.Text = "Otp is expired , send new otp";
                }
            }
        }
    }
}