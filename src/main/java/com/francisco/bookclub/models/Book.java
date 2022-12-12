package com.francisco.bookclub.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "books")
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // generates an auto incrementing
	private Long id;

	@NotEmpty(message="Title is required!")
	@Size(min = 2, max = 70, message = "Title needs to be more than 2 chracters and less then 70")
	private String title;

	@NotEmpty(message="Author is required!")
	@Size(min = 2, message = "Author needs to be more than 2 chracters")
	private String author;
	
	@NotEmpty(message="Your thoughts is required!")
	@Size(min = 2, message = "Your thoughts needs to be more than 2 chracters")
	private String thoughts;


	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	@Column(updatable = false)
	private Date createdAt;
	@Column(updatable = false)
	private Date updatedAt;

	public Book() {
		// TODO Auto-generated constructor stub
	}
	
	@PrePersist // adds the created at date and time to sql on creation 
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate // add the updated at date and time when being updated
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getThoughts() {
		return thoughts;
	}

	public void setThoughts(String thoughts) {
		this.thoughts = thoughts;
	}



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}


}
