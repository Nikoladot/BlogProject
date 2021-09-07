package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Contact;


public interface ContactDAO {

	
	public List<Contact> getContactList();
	
	public Contact getContactById(int id);
	
	public void saveContact(Contact contact);
	
	public void deleteContact(int id);
	
	public long getUnreadMessagesCount();
	
}
