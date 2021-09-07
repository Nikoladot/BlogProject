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
import cubes.main.entity.Tag;


@Repository
public class TagDAOImpl implements TagDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public List<Tag> getTagList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Tag> query = session.createQuery("from Tag", Tag.class);
		
		List<Tag> tagList = query.getResultList();
		
		return tagList;
	}
	
	@Transactional
	@Override
	public void saveTag(Tag tag) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(tag);
		
	}

	@Transactional
	@Override
	public Tag getTag(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		Tag tag = session.get(Tag.class, id);
		return tag;
	}

	@Transactional
	@Override
	public void deleteTag(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("delete from Tag where id=:id");
		
		query.setParameter("id", id);
		
		query.executeUpdate();
		
	}

	@Transactional
	@Override
	public List<Tag> getTagListByIds(List<Integer> ids) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Tag> query = session.createQuery("select t from Tag t where t.id IN (:ids)", Tag.class);
		query.setParameter("ids", ids);
		List<Tag> tags = query.getResultList();
		
		return tags;
	}

	@Transactional
	@Override
	public List<Tag> getTagsForFilter() {
		
		Session session = sessionFactory.getCurrentSession();

		Query<Tag> query = session.createQuery("from Tag", Tag.class);

		List<Tag> list = query.getResultList();

		for (Tag tag : list) {

			tag.setCount(tag.getBlogList().size());
		
		}

		return list;

	}
	@Transactional
	@Override
	public List<List<Blog>> getTagWithBlogs(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Tag tag = session.get(Tag.class, id);
		
		Hibernate.initialize(tag.getBlogList());
				
		List<List<Blog>> list = new ArrayList<>();
		
		List<Blog> first = new ArrayList<Blog>();
		List<Blog> second = new ArrayList<Blog>();
		List<Blog> third = new ArrayList<Blog>();

		for (Blog blog : tag.getBlogList()) {

			if (first.size() <= 3) {
				first.add(blog);
			} else if (second.size() <= 3) {
				second.add(blog);
			} else if (third.size() <= 3) {
				third.add(blog);
			} else {
				break;
			}

		}

		list.add(first);		
			list.add(second);
			list.add(third);
	
		return list;
		
	}
}
