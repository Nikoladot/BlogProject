package cubes.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="sliders")
public class Slider {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private String title;
	@Column(name = "url")
	private String linkPath;
	@Column
	private String image;
	@Column
	private String position;
	@Column(name = "is_visable")
	private boolean isVisible;
	@Column(name = "link_name")
	private String linkName;
	
	
	public Slider() {
		
	}
	public Slider(String title, String liknPath, String image, String position, boolean isVisible, String linkName) {
		super();
		this.title = title;
		this.linkPath = liknPath;
		this.image = image;
		this.position = position;
		this.isVisible = isVisible;
		this.linkName = linkName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLinkPath() {
		return linkPath;
	}

	public void setLinkPath(String liknPath) {
		this.linkPath = liknPath;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public boolean getIsVisible() {
		return isVisible;
	}

	public void setIsVisible(boolean isVisible) {
		this.isVisible = isVisible;
	}
	

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "Slider [title=" + title + ", position=" + position + ", isVisible=" + isVisible + "]";
	}
	
	
}
