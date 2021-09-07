package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Blog;
import cubes.main.entity.Comment;



public interface CommentDAO {

	
	public List<Comment> getCommentList();
	
	public Comment getCommentById(int id);
	
	public void saveComment(Comment comment);
	
	public void deleteComment(int id);
	
	public List<Comment> getCommentListByBlog(Blog blog);
}
