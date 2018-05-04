package com.bean;

import java.util.Date;

public class Edu_User {
	private int user_id;//用户Id
	private String mobile;//手机号
	private String email;//邮箱号
	private int class_id;//班级编号
	private String password;//密码
	private String user_name;//用户名
	private String show_name;//显示名 （昵称）
	private int sex;//性别  1男  2女
	private int age;//年龄
	private Date create_time;//注册时间
	private int is_avalible;//是否可用 1正常  2冻结
	private String pic_img;//用户头像
	private String banner_url;//个人中心用户背景图片
	private int msg_num;//站内信未读消息数
	private int sys_msg_num;//0
	private Date last_system_time;//上传统计系统消息时间
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getShow_name() {
		return show_name;
	}
	public void setShow_name(String show_name) {
		this.show_name = show_name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public int getIs_avalible() {
		return is_avalible;
	}
	public void setIs_avalible(int is_avalible) {
		this.is_avalible = is_avalible;
	}
	public String getPic_img() {
		return pic_img;
	}
	public void setPic_img(String pic_img) {
		this.pic_img = pic_img;
	}
	public String getBanner_url() {
		return banner_url;
	}
	public void setBanner_url(String banner_url) {
		this.banner_url = banner_url;
	}
	public int getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}
	public int getSys_msg_num() {
		return sys_msg_num;
	}
	public void setSys_msg_num(int sys_msg_num) {
		this.sys_msg_num = sys_msg_num;
	}
	public Date getLast_system_time() {
		return last_system_time;
	}
	public void setLast_system_time(Date last_system_time) {
		this.last_system_time = last_system_time;
	}
	
	
}
