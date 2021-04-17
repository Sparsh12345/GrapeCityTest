using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Blogs.DataAccessLayer;
using Blogs.DataTransferObject;

namespace Blogs.BusinessLogicLayer
{
    public class UserLogic
    {
        UserHelper userHelper;

        public UserModel ValidateUser(UserModel userModel)
        {
            userHelper = new UserHelper();
            return userHelper.ValidateUser(userModel);
        }
    }
}
