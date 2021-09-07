package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Blog;


public interface BlogDAO {

	
	public void saveBlog(Blog blog);
	
	public void deleteBlog(int id);
	
	public List<Blog> getBlogList();
	
	public Blog getBlog(int id);
	
	public List<Blog> getThreeImportantBlogs();
	
	public List<List<Blog>> getTwelveBlogsForIndexPage();
		
	public List<Blog> getMostReviewBlogs();
		
	public List<Blog> getTwelveBlogsBySearch(String word, int page);
	
	public List<Blog> blogListForPagination(int page);
	
	public List<Blog> bligListByCategory(int id, int page);
	
	public List<Blog> getBlogListByAuthor(String username, int page);
	
	public long getCountBlogs();
	
	public long getCountBlogsForSearch(String word);
	
	public long getCountBlogsForCategory(int id);
	
	public long getCountBlogByAuthor(String username);
	
	public Blog getBlogLeft(int id);
	
	public Blog getBlogRight(int id);
	
	public List<Blog> getBlogListOrder(int order);
	
	public List<Blog> getBlogListSearchBack(String word);
	
	public List<Blog> getPrevAndNext(int id);
	
	
	
}
