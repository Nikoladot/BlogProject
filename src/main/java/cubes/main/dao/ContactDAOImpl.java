package cubes.main.dao;


import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Contact;


@Repository
public class ContactDAOImpl implements ContactDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Transactional
	@Override
	public List<Contact> getContactList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		List<Contact> query = session.createQuery("from Contact order by id desc", Contact.class).getResultList();
		
		
		return query;
	}


	@Transactional
	@Override
	public Contact getContactById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Contact contact = session.get(Contact.class, id);
		
		return contact;
	}
	@Transactional
	@Override
	public void saveContact(Contact contact) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(contact);
		
	}
	@Transactional
	@Override
	public void deleteContact(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Contact c = session.get(Contact.class, id);
		
		session.delete(c);
		
	}
	
	@Transactional
	@Override
	public long getUnreadMessagesCount() {

		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(*) from Contact c where c.isSeen = 0");
		
		return (long) query.executeUpdate();
	}


}
