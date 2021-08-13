using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BookStoreWebForm.Service
{
    public class BookService
    {
        //create new sqlconnection and connection to database by using connection string from web.config file  
        public static readonly string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);

        public object DisplayBook()
        {

            SqlCommand com = new SqlCommand("spDisplayBook", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            var books = com.ExecuteReader();
            var result = ReturnParameter.Value;
            con.Close();
            return books;
        }
    }
}