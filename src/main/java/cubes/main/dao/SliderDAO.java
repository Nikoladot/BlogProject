package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Slider;


public interface SliderDAO {

	public void saveSlider(Slider slider);
	
	public void deleteSlider(int id);
	
	public List<Slider> sliderList();
	
	public Slider getSliderById(int id);
	
	public List<Slider> getSliderListForMainPage();
}
