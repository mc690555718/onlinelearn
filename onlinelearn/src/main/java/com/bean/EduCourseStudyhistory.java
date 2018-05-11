package com.bean;

import java.util.Date;

public class EduCourseStudyhistory {

	private int id;
	private int user_id;
	private int course_id;
	private int kpoint_id;
	private int playercount;
	private String course_name;
	private String kpoint_name;
	private String databack;
	private Date update_time;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public int getKpoint_id() {
		return kpoint_id;
	}
	public void setKpoint_id(int kpoint_id) {
		this.kpoint_id = kpoint_id;
	}
	public int getPlayercount() {
		return playercount;
	}
	public void setPlayercount(int playercount) {
		this.playercount = playercount;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getKpoint_name() {
		return kpoint_name;
	}
	public void setKpoint_name(String kpoint_name) {
		this.kpoint_name = kpoint_name;
	}
	public String getDataback() {
		return databack;
	}
	public void setDataback(String databack) {
		this.databack = databack;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	
}
