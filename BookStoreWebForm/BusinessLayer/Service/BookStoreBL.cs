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
    public class BookStoreBL : IBookStoreBL
    {
        public IBookStoreRL bookStoreRL;

        public BookStoreBL(IBookStoreRL bookStoreRL)
        {
            this.bookStoreRL = bookStoreRL;
        }

        public object DisplayBook()
        {
            try
            {
                return this.bookStoreRL.DisplayBook();
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public object DisplayBookInACart(int CustomerId)
        {
            try
            {
                return this.bookStoreRL.DisplayBookInACart(CustomerId);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int DisplayBookCount()
        {
            try
            {
                return this.bookStoreRL.DisplayBookCount();
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int AddToCart(Bag bag)
        {
            try
            {
                return this.bookStoreRL.AddToCart(bag);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int AddToWishList(Bag bag)
        {
            try
            {
                return this.bookStoreRL.AddToWishList(bag);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public void BookQuantityPlus(int value, int BookId, int id)
        {
            try
            {
                this.bookStoreRL.BookQuantityPlus(value, BookId, id);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public void BookQuantityMinus(int value, int BookId, int id)
        {
            try
            {
                this.bookStoreRL.BookQuantityMinus(value,BookId,id);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public void BookAllQuantity(int value, int BookId, int id)
        {
            try
            {
                this.bookStoreRL.BookAllQuantity( value, BookId, id);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int RemoveBookFromCart(int CartId)
        {
            try
            {
                return this.bookStoreRL.RemoveBookFromCart(CartId);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int Order(int CartId, int BookId)
        {
            try
            {
                return this.bookStoreRL.Order(CartId, BookId);
            }

            catch (Exception e)
            {
                throw e;
            }
        }

        public int BookMaximumCount(int count, int BookId, int id)
        {
            try
            {
                return this.bookStoreRL.BookMaximumCount(count,BookId, id);
            }

            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
