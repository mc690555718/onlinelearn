package com.bean;
import java.util.Date;

public class Edu_Emailesend_History {

	private int id; // 邮箱id
	private String email;// 邮箱
	private Edu_User user;// 用户id外键
	private String title;// 邮箱标题
	private String content;// 邮箱正文
	private Date create_time;// 编辑时间
	private Date send_time;// 发送时间
	private int status;// 1已发送，2未发送
	private int type;// 1普通，2定时
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getSend_time() {
		return send_time;
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Edu_User getUser() {
		return user;
	}
	public void setUser(Edu_User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Edu_Emailesend_History [id=" + id + ", email=" + email + ", user=" + user + ", title=" + title
				+ ", content=" + content + ", create_time=" + create_time + ", send_time=" + send_time + ", status="
				+ status + ", type=" + type + "]";
	}
	


	

}
