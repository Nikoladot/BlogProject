package cubes.main.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "comments")
public class Comment {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private String name;
	@Column
	private String email;
	@Column(name="content")
	private String message;
	@Column(name = "enable_disable")
	private boolean showOnPage;
	@Column
	private String date;
	@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "blog_id")
	private Blog idBlog;

	public Comment() {
	}

	public Comment(String name, String email, String message, boolean showOnPage, String date, Blog idBlog) {
		super();
		this.name = name;
		this.email = email;
		this.message = message;
		this.showOnPage = showOnPage;
		this.idBlog = idBlog;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean getShowOnPage() {
		return showOnPage;
	}

	public void setShowOnPage(boolean showOnPage) {
		this.showOnPage = showOnPage;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Blog getIdBlog() {
		return idBlog;
	}

	public void setIdBlog(Blog idBlog) {
		this.idBlog = idBlog;
	}

	@Override
	public String toString() {
		return "Coment [name=" + name + ", email=" + email + "]";
	}
	
	public void setDate() {
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		this.setDate(sf.format(date));
	}

}
