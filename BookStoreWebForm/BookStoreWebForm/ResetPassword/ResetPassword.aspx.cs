using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreWebForm.ResetPassword
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {

            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand com = new SqlCommand("spLogin", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;



            com.Parameters.AddWithValue("@Password", NewPassword.Text);
        


            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;
            con.Open();
            int row = com.ExecuteNonQuery();
            var result = ReturnParameter.Value;
            con.Close();

            if (result != null && result.Equals(1))
            {
                ResetMessage.Text = "Account doesnt exist";
                ResetMessage.Visible = true;

            }

            else if (result != null && result.Equals(2))
            {
                ResetMessage.Text = "Wrong Password </br> Failed to Login";
                ResetMessage.Visible = true;
            }

            else
            {
                ResetMessage.Text = "Login is successful";
                ResetMessage.Visible = true;
            }


        }
    }
}