using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blogs.DataTransferObject;
using Blogs.BusinessLogicLayer;
namespace GrapeCityTest.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            UserLogic userLogic = new UserLogic();
            //bool isValidUser=userLogic.ValidateUser()
            return View();
        }

        public JsonResult ValidateUser(UserModel userModel)
        {
            try
            {
                UserLogic userLogic = new UserLogic();
                bool isValid = false;
                var userObj = userLogic.ValidateUser(userModel);
                if (userObj.Id > 0)
                {
                    isValid = true;
                    Session["UserID"] = userModel.Id;
                }
                return Json(isValid, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Something Went wrong.", JsonRequestBehavior.AllowGet);
            }

        }
    }
}
