using Blogs.DataTransferObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogs.DataAccessLayer
{
    public class UserHelper
    {
        BlogsTestGrapeCityEntities objBlogsTestGrapeCityEntities;
        public UserModel ValidateUser(UserModel userModel)
        {
            objBlogsTestGrapeCityEntities = new BlogsTestGrapeCityEntities();
            var userObj = objBlogsTestGrapeCityEntities.tbl_User.Where(m => m.Email == userModel.Email && m.Password == userModel.Password).FirstOrDefault();
            if (userObj != null)
            {
                userModel.Id = userObj.Id;
            }
            return userModel;
        }
    }
}
