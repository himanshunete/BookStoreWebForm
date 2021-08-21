using BookStoreWebForm.Model.ResquestModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface IBookStoreBL
    {
        object DisplayBook();

        object DisplayBookInACart(int CustomerId);

        int DisplayBookCount();

        int AddToCart(Bag bag);

        int AddToWishList(Bag bag);

        void BookQuantityPlus(int value, int BookId, int id);
        void BookQuantityMinus(int value, int BookId, int id);

        void BookAllQuantity(int value, int BookId, int id);

        int RemoveBookFromCart(int CartId);

        int Order(int CartId, int BookId);

        int BookMaximumCount(int count, int BookId, int id);
    }
}
