package com.Entity;

import java.util.Date;


import javax.persistence.*;

@Entity
@Table(name="attendence")
public class Attendence {
	@Id
	private int id;
	private String name;
	private String email;
	private String password;
	private String category;
	private Date date;
	private int userclass;
	
	
	
	public Attendence() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Attendence( String name, String email, String password, String category,int userclass) {
		super();
		this.id = new  java.util.Random().nextInt(10000);
		this.name = name;
		this.email = email;
		this.password = password;
		this.category = category;
		this.date=new java.util.Date();
		this.userclass=userclass;
	}
	public Attendence(String name,String email,int userclass) {
		super();
		this.name=name;
		this.email=email;
		this.userclass=userclass;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getUserclass() {
		return userclass;
	}
	public void setUserclass(int userclass) {
		this.userclass = userclass;
	}
	
	
	
}
