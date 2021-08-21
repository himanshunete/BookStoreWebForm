using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStoreWebForm.WebForm
{
    public partial class CustomerRecords : System.Web.UI.Page
    {
        //create new sqlconnection and connection to database by using connection string from web.config file  
        public static readonly string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //var books =  bookService.DisplayBook();
                this.BindGrid();

             
            }
        }

        private void BindGrid()
        {
            SqlCommand com = new SqlCommand("spRetrieveAllCustomerRecords", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            int result = (int)ReturnParameter.Value;

            con.Close();

            con.Open();
            var customers = com.ExecuteReader();
            GridView1.DataSource = customers;
            GridView1.DataBind();
            con.Close();

            if (result.Equals(2))
            {
                ShowMessage("Customer Records", MessageType.Success);
            }

            if (result.Equals(1))
            {
                ShowMessage("No Records", MessageType.Error);
            }
        }


    
        public enum MessageType { Success, Error, Info, Warning };

        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }
    }
}