using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreWebForm.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            int Result = 0;
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand com = new SqlCommand("spLogin", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;


        
            com.Parameters.AddWithValue("@EmailAddress", EmailAddress.Text);
            com.Parameters.AddWithValue("@Password", Password.Text);


            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;
            con.Open();
            int row = com.ExecuteNonQuery();
            var result = ReturnParameter.Value;


            if (result != null && result.Equals(1))
            {
                LoginMessage.Text = "Account doesnt exist";
                LoginMessage.Visible = true;

            }

            else if (result != null && result.Equals(2))
            {
                LoginMessage.Text = "Wrong Password </br> Failed to Login";
                LoginMessage.Visible = true;
            }

            else
            {
                LoginMessage.Text = "Login is successful";
                LoginMessage.Visible = true;
            }
            con.Close();
        }

        protected void CreateButton_Click(object sender, EventArgs e)
        {
           
        }
    }
}