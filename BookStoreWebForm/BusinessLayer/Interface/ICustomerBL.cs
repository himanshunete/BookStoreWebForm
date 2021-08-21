using BookStoreWebForm.Model.ResquestModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Interface
{
    public interface ICustomerBL
    {
        int Registration(User user);

        int Login(User user);

        int RetrieveRecord(User user);

        int Forget(User user);

        int Reset(User user);
    }
}
