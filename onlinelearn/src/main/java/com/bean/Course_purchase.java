package com.bean;

import java.util.Date;

//¿Î³Ì¹ºÂò±í
public class Course_purchase {

	private int id;
	private int userId;
	private int courseId;
	private Date addTime; 
	private Date Term_of_validity;
	private int Purchase_status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public Date getTerm_of_validity() {
		return Term_of_validity;
	}
	public void setTerm_of_validity(Date term_of_validity) {
		Term_of_validity = term_of_validity;
	}
	public int getPurchase_status() {
		return Purchase_status;
	}
	public void setPurchase_status(int purchase_status) {
		Purchase_status = purchase_status;
	}
	
}
