package cubes.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Blog;
import cubes.main.entity.Comment;



@Repository
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Transactional
	@Override
	public List<Comment> getCommentList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Comment> query = session.createQuery("from Comment", Comment.class);
		
		
		return query.getResultList();
	}

	@Transactional
	@Override
	public Comment getCommentById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		Comment c = session.get(Comment.class, id);
		return c;
	}

	@Transactional
	@Override
	public void saveComment(Comment comment) {
		
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(comment);
		
		
	}
	@Transactional
	@Override
	public void deleteComment(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		Comment c = session.get(Comment.class, id);
		session.delete(c);
	}

	@Transactional
	@Override
	public List<Comment> getCommentListByBlog(Blog blog) {
			
		List<Comment> list = blog.getComments();
		return list;
	}
}
