using Experimental.System.Messaging;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
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

        MessageQueue queue = new MessageQueue(@".\private$\tokenQueue");

       

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Sends the password reset link to MSMQ 
        /// </summary>
        /// <param name="link"></param>
        public void MSMQSender(string email)
        {
            try
            {
                if (!MessageQueue.Exists(queue.Path))
                {
                    MessageQueue.Create(queue.Path);
                }
                queue.Formatter = new XmlMessageFormatter(new Type[] { typeof(string) });
                Message msg = new Message
                {
                    Label = "password reset link",
                    Body = JsonConvert.SerializeObject(email),
                };
                queue.Send(msg);
                queue.ReceiveCompleted += MSMQReceiver;
                queue.BeginReceive(TimeSpan.FromSeconds(5));
                queue.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// Handles the ReceiveCompleted event of the Queue control.
        /// sends email when message received from queue
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void MSMQReceiver(object sender, ReceiveCompletedEventArgs e)
        {
            try
            {
                MessageQueue queue = (MessageQueue)sender;
                Message msg = queue.EndReceive(e.AsyncResult);
                string email = JsonConvert.DeserializeObject<string>(msg.Body.ToString());

                EmailService(email);

                queue.BeginReceive(TimeSpan.FromSeconds(5));
            }
            catch (Exception ex)
            {

            }
        }


        public void EmailService(string email)
        {
            try
            {
                string HtmlBody = "";

                using (StreamReader streamReader = new StreamReader(@"C:\\Users\\Himansu\\source\\repos\\FundooNotes_Application\\RepositoryLayer\\Services\\ResetPassword.html"))
                {
                    HtmlBody = streamReader.ReadToEnd();
                }

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
            string email = EmailAddress.Text;
            MSMQSender(email);

        }
    }
}