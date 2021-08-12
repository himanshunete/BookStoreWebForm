using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace BookStoreWebForm.Service
{
    public class SMTP
    {
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
    }
} 