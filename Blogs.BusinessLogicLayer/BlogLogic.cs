using Blogs.DataAccessLayer;
using Blogs.DataTransferObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogs.BusinessLogicLayer
{
    public class BlogLogic
    {
        BlogsHelper blogsHelper;

        public bool AddBlog(BlogsModel blogsModel)
        {
            blogsHelper = new BlogsHelper();
            return blogsHelper.AddBlog(blogsModel);
        }

        public bool UpdateBlog(BlogsModel blogsModel)
        {
            blogsHelper = new BlogsHelper();
            return blogsHelper.UpdateBlog(blogsModel);
        }

        public BlogsModel GetBlogById(int blogId)
        {
            blogsHelper = new BlogsHelper();
            return blogsHelper.GetBlogById(blogId);
        }

        public List<BlogsModel> GetBlogList()
        {
            blogsHelper = new BlogsHelper();
            return blogsHelper.GetBlogList();
        }

        public bool DeleteBlog(int id)
        {
            blogsHelper = new BlogsHelper();
            return blogsHelper.DeleteBlog(id);
        }
    }
}
