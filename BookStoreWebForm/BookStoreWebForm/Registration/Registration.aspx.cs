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
using Experimental.System.Messaging;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace BookStoreWebForm.Registration
{
    public partial class Registration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    
        protected void Button1_Click1(object sender, EventArgs e)
        {


            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand com = new SqlCommand("spRegister", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

        
            com.Parameters.AddWithValue("@FirstName", FirstName.Text);
            com.Parameters.AddWithValue("@LastName", LastName.Text);
            com.Parameters.AddWithValue("@EmailAddress", EmailAddress.Text);
            com.Parameters.AddWithValue("@Password", EncodePasswordToBase64(Password.Text));


            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;
            con.Open();
            int row = com.ExecuteNonQuery();
            var result = ReturnParameter.Value;
            con.Close();

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

            Session.Timeout = 1;




        }


        public static string EncodePasswordToBase64(string password)
        {
            byte[] encData_byte = new byte[password.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
            string encodedData = Convert.ToBase64String(encData_byte);
            return encodedData;
        }

    }
}