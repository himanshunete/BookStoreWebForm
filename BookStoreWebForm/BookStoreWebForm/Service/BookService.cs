﻿using BookStoreWebForm.Model.ResquestModel;
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
        Bag bag = new Bag();

        public object DisplayBookCount()
        {

            SqlCommand com = new SqlCommand("spDisplayBookCount", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            var result = ReturnParameter.Value;
            con.Close();

            return result;
        }

        public object AddToCart(Bag bag)
        {

            SqlCommand com = new SqlCommand("spAddToCart", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@BookId", bag.BookId);
            com.Parameters.AddWithValue("@Id", bag.Id);
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            var result = ReturnParameter.Value;
            con.Close();

            return result;
        }

        public object AddToWishList(Bag bag)
        {
            SqlCommand com = new SqlCommand("spAddToWishList", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@BookId", bag.BookId);
            com.Parameters.AddWithValue("@Id", bag.Id);
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            var result = ReturnParameter.Value;
            con.Close();

            return result;
        }

        public void BookQuantityPlus(int value, int BookId, int id)
        {
            SqlCommand com = new SqlCommand("spBookQuantityPlus", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@value", value);
            com.Parameters.AddWithValue("@BookId", BookId);
            com.Parameters.AddWithValue("@id", id);


            con.Open();
            com.ExecuteNonQuery();
           
            con.Close();

        }

        public void BookQuantityMinus(int value, int BookId, int id)
        {
            SqlCommand com = new SqlCommand("spBookQuantityMinus", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@value", value);
            com.Parameters.AddWithValue("@BookId", BookId);
            com.Parameters.AddWithValue("@id", id);

            con.Open();
            com.ExecuteNonQuery();
          
            con.Close();

       
        }

        public void BookAllQuantity(int value, int BookId, int id)
        {
            SqlCommand com = new SqlCommand("spBookAllQuantity", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@value", value);
            com.Parameters.AddWithValue("@BookId", BookId);
            com.Parameters.AddWithValue("@id", id);

            con.Open();
            com.ExecuteNonQuery();

            con.Close();


        }

        public int RemoveBookFromCart(int CartId)
        {
            SqlCommand com = new SqlCommand("spRemoveBookFromCart", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@CartId", CartId);
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            int result = (int)ReturnParameter.Value;
            con.Close();

            return result;


        }

        public int Order(int CartId, int BookId)
        {
            SqlCommand com = new SqlCommand("spOrderSummary", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@CartId", CartId);
            com.Parameters.AddWithValue("@BookId", BookId);
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            int result = (int)ReturnParameter.Value;
            con.Close();

            return result;


        }

        public int BookMaximumCount(int count, int BookId, int id)
        {
            SqlCommand com = new SqlCommand("spMaximumCount", con);
            com.CommandType = System.Data.CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@count", count);
            com.Parameters.AddWithValue("@BookId", BookId);
            com.Parameters.AddWithValue("@id", id);
            var ReturnParameter = com.Parameters.Add("@Result", SqlDbType.Int);
            ReturnParameter.Direction = ParameterDirection.ReturnValue;

            con.Open();
            com.ExecuteNonQuery();
            int result = (int)ReturnParameter.Value;

            con.Close();

            return result;


        }
    }
}