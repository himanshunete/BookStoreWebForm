
using BookStoreWebForm.Model.ResquestModel;
using RepositoryLayer.Interface;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.WebForm
{
    public class CustomerRL : ICustomerRL
    {
        //create new sqlconnection and connection to database by using connection string from web.config file  
        public static readonly string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);

        public int Registration(User user)
        {
            SqlCommand com = new SqlCommand("spRegister", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@FirstName", user.FirstName);
            com.Parameters.AddWithValue("@LastName", user.LastName);
            com.Parameters.AddWithValue("@EmailAddress", user.EmailAddress);
            com.Parameters.AddWithValue("@Password", EncodePasswordToBase64(user.Password));
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            int result = (int)ReturnParameter.Value;
            con.Close();

            return result;
        }

        public int Login(User user)
        {
            SqlCommand com = new SqlCommand("spLogin", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@EmailAddress", user.EmailAddress);
            com.Parameters.AddWithValue("@Password", EncodePasswordToBase64(user.Password));
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            int result = (int)ReturnParameter.Value;
            con.Close();

            return result;
        }

        public int RetrieveRecord(User user)
        {
            SqlCommand com = new SqlCommand("spRetrieveRecord", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@EmailAddress", user.EmailAddress);
            com.Parameters.AddWithValue("@Password", EncodePasswordToBase64(user.Password));

            con.Open();
            int record = (int)com.ExecuteScalar();
            con.Close();

            return record;
        }

        public int Forget(User user)
        {
            SqlCommand com = new SqlCommand("spForget", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@EmailAddress", user.EmailAddress);
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            int result = (int)ReturnParameter.Value;
            con.Close();

            return result;
        }

        public int Reset(User user)
        {
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand com = new SqlCommand("spReset", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@EmailAddress", user.EmailAddress);
            com.Parameters.AddWithValue("@Password", EncodePasswordToBase64(user.Password));
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            int result = (int)ReturnParameter.Value;
            con.Close();

            return result;
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
