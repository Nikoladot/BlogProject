package cubes.main.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Slider;

@Repository
public class SliderDAOImpl implements SliderDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public void saveSlider(Slider slider) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(slider);
		
	}
	@Transactional
	@Override
	public void deleteSlider(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Slider s = session.get(Slider.class, id);
		
		session.delete(s);
	}
	@Transactional
	@Override
	public List<Slider> sliderList() {
		
		Session session = sessionFactory.getCurrentSession();
		Query<Slider> query = session.createQuery("from Slider", Slider.class);
			
		return query.getResultList();
	}
	@Transactional
	@Override
	public Slider getSliderById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Slider s = session.get(Slider.class, id);

		return s;
	}
	@Transactional
	@Override
	public List<Slider> getSliderListForMainPage() {
		
		Session session = sessionFactory.getCurrentSession();
		Query<Slider> query = session.createQuery("select s from Slider s where s.isVisible=1 order by position asc", Slider.class);
			
		return query.getResultList();
		
	}

}
