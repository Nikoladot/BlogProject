package cubes.main.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Blog;


@Repository
public class BlogDAOImpl implements BlogDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public void saveBlog(Blog blog) {

		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(blog);

	}

	@Transactional
	@Override
	public void deleteBlog(int id) {

		Session session = sessionFactory.getCurrentSession();

		Blog blog = session.get(Blog.class, id);
		session.delete(blog);

	}

	@Transactional
	@Override
	public List<Blog> getBlogList() {

		Session session = sessionFactory.getCurrentSession();
		Query<Blog> query = session.createQuery("from Blog");

		List<Blog> blogList = query.getResultList();

		return blogList;
	}

	@Transactional
	@Override
	public Blog getBlog(int id) {

		Session session = sessionFactory.getCurrentSession();

		Blog blog = session.get(Blog.class, id);
		Hibernate.initialize(blog.getTags());

		return blog;
	}

	@Transactional
	@Override
	public List<Blog> getThreeImportantBlogs() {

		Session session = sessionFactory.getCurrentSession();
		Query<Blog> query = session.createQuery("select b from Blog b where b.important=1 order by id desc");
				query.setMaxResults(3);
		List<Blog> blogList = query.getResultList();

		return blogList;
	}

	@Transactional
	@Override
	public List<List<Blog>> getTwelveBlogsForIndexPage() {

		Session session = sessionFactory.getCurrentSession();
		Query<Blog> query = session.createQuery("select b from Blog b order by id desc", Blog.class);
		query.setMaxResults(12);
		List<List<Blog>> list = new ArrayList<List<Blog>>();
		List<Blog> first = new ArrayList<Blog>();
		List<Blog> second = new ArrayList<Blog>();
		List<Blog> third = new ArrayList<Blog>();
		List<Blog> fourth = new ArrayList<Blog>();

		for (Blog blog : query.getResultList()) {

			if (first.size() <= 2) {
				first.add(blog);
			} else if (second.size() <= 2) {
				second.add(blog);
			} else if (third.size() <= 2) {
				third.add(blog);
			} else if (fourth.size() <= 2) {
				fourth.add(blog);
			} else {
				break;
			}

		}
		list.add(first);
		if (second.size() > 0) {
			list.add(second);
		}
		if (third.size() > 0) {
			list.add(third);
		}
		return list;
	}

	@Transactional
	@Override
	public List<Blog> getMostReviewBlogs() {

		Session session = sessionFactory.getCurrentSession();
		Query<Blog> query = session.createQuery("select b from Blog b order by review desc", Blog.class);
		query.setMaxResults(3);
		List<Blog> list = query.getResultList();

		return list;
	}

	@Transactional
	@Override
	public List<Blog> getTwelveBlogsBySearch(String word, int page) {

		Session session = sessionFactory.getCurrentSession();

		Query<Blog> query = session.createQuery("select b from Blog b where b.title like'%" + word + "%' OR "
				+ "b.description like '%" + word + "%' OR b.introduction like'%" + word + "%' OR b.subtitle like'%"
				+ word + "%' OR " + "b.text like'%" + word + "%' order by id desc", Blog.class);

		List<Blog> blogList = query.setFirstResult(page * 12).setMaxResults(12).getResultList();

		return blogList;

	}

	@Transactional
	@Override
	public List<Blog> blogListForPagination(int page) {

		Session session = sessionFactory.getCurrentSession();

		List<Blog> blogList = session.createQuery("from Blog order by id desc", Blog.class).setFirstResult(page * 12).setMaxResults(12)
				.getResultList();

		return blogList;
	}

	@Transactional
	@Override
	public List<Blog> bligListByCategory(int id, int page) {

		Session session = sessionFactory.getCurrentSession();

		Query<Blog> query = session.createQuery("select b from Blog b where b.category.id=:id order by id desc", Blog.class);
		query.setParameter("id", id);

		List<Blog> blogList = query.setFirstResult(page * 12).setMaxResults(12).getResultList();

		return blogList;
	}

	@Transactional
	@Override
	public long getCountBlogs() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(blog.id) from Blog blog");
		
		return (long) query.uniqueResult();
	}

	@Transactional
	@Override
	public long getCountBlogsForSearch(String word) {
		
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("select count(b.id) from Blog b where b.title like'%" + word + "%' OR "
				+ "b.description like '%" + word + "%' OR b.introduction like'%" + word + "%' OR b.subtitle like'%"
				+ word + "%' OR " + "b.text like'%" + word + "%' order by id desc");

		return (long) query.uniqueResult();
	}
	@Transactional
	@Override
	public long getCountBlogsForCategory(int id) {
		
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("select count(b.id)  from Blog b where b.category.id=:id order by id desc");
		query.setParameter("id", id);
		
		return (long) query.uniqueResult();
	}

	@Transactional
	@Override
	public Blog getBlogLeft(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
	
		
		Query<Blog> query = session.createQuery("select b from Blog b where b.id<:id", Blog.class);
		query.setParameter("id", id);		
		
		Blog blog =  (Blog) query.getResultList().get(query.getResultList().size()-1);
		
		Hibernate.initialize(blog.getTags());
		
		return blog;
	}
	@Transactional
	@Override
	public Blog getBlogRight(int id) {
		
		Session session = sessionFactory.getCurrentSession();

		Query<Blog> query = session.createQuery("select b from Blog b where b.id>:id", Blog.class);
		query.setParameter("id", id);		
		
		Blog blog =  (Blog) query.getResultList().get(0);
		
		Hibernate.initialize(blog.getTags());
		
		return blog;
		
	}

	@Transactional
	@Override
	public List<Blog> getBlogListByAuthor(String username, int page) {
		

		Session session = sessionFactory.getCurrentSession();

		List<Blog> blogList = session.createQuery("select b from Blog b where b.user.username=:username order by id desc", Blog.class)
				.setParameter("username", username)
				.setFirstResult(page * 12).setMaxResults(12)
				.getResultList();

		return blogList;
		
	}

	@Transactional
	@Override
	public long getCountBlogByAuthor(String username) {
		
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("select count(b.id)  from Blog b where b.user.username=:username order by id desc");
		query.setParameter("username", username);
		
		return (long) query.uniqueResult();
	}
	@Transactional
	@Override
	public List<Blog> getBlogListOrder(int order) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Blog> query;
		
		if(order == 1) {
			
			 query = session.createQuery("from Blog b order by b.id", Blog.class);
			
		}else if(order == 2) {
			
			query = session.createQuery("from Blog b order by b.title", Blog.class);
			
		}else if(order == 3) {
			
			query = session.createQuery("from Blog b order by b.user.name", Blog.class);
			
		}else if(order == 4) {
			
			query = session.createQuery("from Blog b order by b.review desc", Blog.class);
			
		}else if(order == 5) {
			
			query = session.createQuery("select b from Blog b where b.important=1", Blog.class);
			
		}else if(order == 6) {
			
			query = session.createQuery("select b from Blog b where b.important=0", Blog.class);
			
		}else {
			
			query = session.createQuery("from Blog b order by b.id", Blog.class);
		}
		
		List<Blog> blogList = query.getResultList();
		
		return blogList;
	}
	
	@Transactional
	@Override
	public List<Blog> getBlogListSearchBack(String word) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Blog> query = session.createQuery("select b from Blog b where b.title like '%" + word + "%' OR "
				+ "b.category.name like '%" + word + "%' OR b.user.name like '%" + word + "%' OR b.user.surname like '%"
				+ word + "%' order by id desc", Blog.class);

		List<Blog> blogList = query.getResultList();

		
		return blogList;
	}

	@Transactional
	@Override
	public List<Blog> getPrevAndNext(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Blog> query = session.createQuery("from Blog where ( id = IFNULL ((select min(id) from Blog where id > :id),0)"
				+ " or id = IFNULL((select max(id) from Blog where id < :id),0))", Blog.class);
		query.setParameter("id", id);
		
		return query.getResultList();
	}
	

}
