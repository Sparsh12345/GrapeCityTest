using Blogs.DataTransferObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogs.DataAccessLayer
{
    public class BlogsHelper
    {
        BlogsTestGrapeCityEntities objBlogsTestGrapeCityEntities;
        public bool AddBlog(BlogsModel blogsModel)
        {
            using (var objBlogsTestGrapeCityEntities = new BlogsTestGrapeCityEntities())
            {
                var addBlog = objBlogsTestGrapeCityEntities.tbl_Blog.Add(new tbl_Blog()
                {
                    Blog_Content = blogsModel.Blog_Content,
                    CreatedDate = DateTime.Now,
                    Title = blogsModel.Title,
                    UpdatedDate = blogsModel.UpdatedDate,
                    CreatedUserID = blogsModel.CreatedUserID
                });
                objBlogsTestGrapeCityEntities.SaveChanges();
            }
            return true;
        }

        public bool UpdateBlog(BlogsModel blogsModel)
        {
            using (var objBlogsTestGrapeCityEntities = new BlogsTestGrapeCityEntities())
            {
                var objBlogs = objBlogsTestGrapeCityEntities.tbl_Blog.Where(m => m.Id == blogsModel.Id).FirstOrDefault();
                if (objBlogs != null)
                {
                    objBlogs.Blog_Content = blogsModel.Blog_Content;
                    objBlogs.Title = blogsModel.Title;
                    objBlogs.UpdatedDate = DateTime.Now;
                }
                objBlogsTestGrapeCityEntities.SaveChanges();
            }
            return true;
        }

        public BlogsModel GetBlogById(int blogId)
        {
            BlogsModel blogsModel = new BlogsModel();
            using (var objBlogsTestGrapeCityEntities = new BlogsTestGrapeCityEntities())
            {
                var objBlogs = objBlogsTestGrapeCityEntities.tbl_Blog.Where(m => m.Id == blogId).FirstOrDefault();
                if (objBlogs != null)
                {
                    blogsModel.Blog_Content = objBlogs.Blog_Content;
                    blogsModel.CreatedDate = objBlogs.CreatedDate;
                    blogsModel.Title = objBlogs.Title;
                    blogsModel.UpdatedDate = objBlogs.UpdatedDate;
                    blogsModel.CreatedUserID = objBlogs.CreatedUserID;
                    blogsModel.Id = objBlogs.Id;
                }
            }
            return blogsModel;
        }

        public List<BlogsModel> GetBlogList()
        {
            List<BlogsModel> lstBlogsModel = new List<BlogsModel>();
            using (var objBlogsTestGrapeCityEntities = new BlogsTestGrapeCityEntities())
            {
                var blogsModel = objBlogsTestGrapeCityEntities.tbl_Blog.ToList();
                if (blogsModel != null)
                {
                    foreach (var blog in blogsModel)
                    {
                        lstBlogsModel.Add(new BlogsModel()
                        {
                            Blog_Content = blog.Blog_Content,
                            CreatedDate = blog.CreatedDate,
                            Title = blog.Title,
                            UpdatedDate = blog.UpdatedDate,
                            CreatedUserID = blog.CreatedUserID,
                            Id = blog.Id
                        });
                    }

                }
            }
            return lstBlogsModel;
        }

        public bool DeleteBlog(int id)
        {
            using (var objBlogsTestGrapeCityEntities = new BlogsTestGrapeCityEntities())
            {
                var objBlogs = objBlogsTestGrapeCityEntities.tbl_Blog.Where(m => m.Id == id).FirstOrDefault();
                if (objBlogs != null)
                {
                    objBlogsTestGrapeCityEntities.tbl_Blog.Remove(objBlogs);
                }
                objBlogsTestGrapeCityEntities.SaveChanges();
            }
            return true;
        }
    }
}
