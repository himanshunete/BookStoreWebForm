using BookStoreWebForm.Model.ResquestModel;
using BusinessLayer.Interface;
using RepositoryLayer.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Service
{
    public class CustomerBL : ICustomerBL
    {
        public ICustomerRL customerRL;

        public CustomerBL(ICustomerRL customerRL)
        {
            this.customerRL = customerRL;
        }

        public int Registration(User user)
        {
            try
            {

                return this.customerRL.Registration(user);             
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int Forget(User user)
        {
            try
            {

                return this.customerRL.Forget(user);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int Login(User user)
        {
            try
            {

                return this.customerRL.Login(user);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int Reset(User user)
        {
            try
            {

                return this.customerRL.Reset(user);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int RetrieveRecord(User user)
        {
            try
            {

                return this.customerRL.RetrieveRecord(user);
            }

            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
