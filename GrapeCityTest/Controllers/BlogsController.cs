using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blogs.BusinessLogicLayer;
using Blogs.DataTransferObject;

namespace GrapeCityTest.Controllers
{
    public class BlogsController : Controller
    {
        // GET: Blogs
        BlogLogic blogLogic;
        public ActionResult Index()
        {
            if (Session["UserID"] == null)
            {
               return RedirectToAction("Index","Home");
            }
            return View();
        }


        public ActionResult AddNewBlog()
        {
            return View();
        }

        [HttpGet]
        public JsonResult GetBlogList()
        {
            try
            {
                List<BlogsModel> blogsModels = new List<BlogsModel>();
                blogLogic = new BlogLogic();
                blogsModels = blogLogic.GetBlogList();
                return Json(blogsModels, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Something Went wrong.", JsonRequestBehavior.AllowGet);
            }
        }


        public JsonResult GetBlogById(int id)
        {
            try
            {
                BlogsModel blogsModels = new BlogsModel();
                blogLogic = new BlogLogic();
                blogsModels = blogLogic.GetBlogById(id);
                return Json(blogsModels, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Something Went wrong.", JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult SaveBlog(BlogsModel blogsModel)
        {
            try
            {
                bool success = false;
                blogLogic = new BlogLogic();
                if (Session["UserID"] != null && blogsModel.Id == 0)
                {
                    blogsModel.CreatedUserID = Convert.ToInt32(Session["UserID"]);
                    blogsModel.UpdatedDate = DateTime.Now;
                    success = blogLogic.AddBlog(blogsModel);
                }
                else
                {
                    blogsModel.UpdatedDate = DateTime.Now;
                    success = blogLogic.UpdateBlog(blogsModel);
                }

                return Json(success, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Something Went wrong.", JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult DeleteBlog(int id)
        {
            try
            {
                blogLogic = new BlogLogic();
                return Json(blogLogic.DeleteBlog(id), JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json("Something Went wrong.", JsonRequestBehavior.AllowGet);
            }
        }
    }
}