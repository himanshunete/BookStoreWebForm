﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStoreWebForm.Service
{
    public class Encryption
    {
        public string EncodePasswordToBase64(string password)
        {
            byte[] encData_byte = new byte[password.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
            string encodedData = Convert.ToBase64String(encData_byte);
            return encodedData;
        }
    }
}