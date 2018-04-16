package com.bean;

import java.util.Date;

public class SysUser {

//	  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
//	  `LOGIN_NAME` varchar(20) NOT NULL DEFAULT '' COMMENT '登录名',
//	  `LOGIN_PWD` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
//	  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户真实姓名名',
//	  `STATUS` tinyint(1) DEFAULT '0' COMMENT '状态.0: 正常,1:冻结,2：删除',
//	  `LAST_LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
//	  `LAST_LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
//	  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
//	  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮件地址',
//	  `TEL` varchar(12) DEFAULT NULL COMMENT '手机号码',
//	  `ROLE_ID` int(11) DEFAULT '0' COMMENT '所属角色ID',
//	  PRIMARY KEY (`USER_ID`)
	
	private int user_id;            //主键
	private String login_name;      //登录名
	private String login_pwd;       //登录密码
	private String user_name;       //用户真实姓名
	private int status;             //状态.0: 正常,1:冻结,2:删除
	private String last_login_time; //最后登录时间
	private String last_login_ip;   //最后登录IP
	private Date create_time;       //创建时间
	private String email;           //邮件地址
	private String tel;             //手机号码
	private SysRole role;           //角色
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getLogin_pwd() {
		return login_pwd;
	}
	public void setLogin_pwd(String login_pwd) {
		this.login_pwd = login_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getLast_login_time() {
		return last_login_time;
	}
	public void setLast_login_time(String last_login_time) {
		this.last_login_time = last_login_time;
	}
	public String getLast_login_ip() {
		return last_login_ip;
	}
	public void setLast_login_ip(String last_login_ip) {
		this.last_login_ip = last_login_ip;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public SysRole getRole() {
		return role;
	}
	public void setRole(SysRole role) {
		this.role = role;
	}
	
	public SysUser() {
		
	}
	
	public SysUser(int user_id, String login_name, String login_pwd, String user_name, int status,
			String last_login_time, String last_login_ip, Date create_time, String email, String tel, SysRole role) {
		super();
		this.user_id = user_id;
		this.login_name = login_name;
		this.login_pwd = login_pwd;
		this.user_name = user_name;
		this.status = status;
		this.last_login_time = last_login_time;
		this.last_login_ip = last_login_ip;
		this.create_time = create_time;
		this.email = email;
		this.tel = tel;
		this.role = role;
	}
	
	public SysUser(int user_id, String login_name, String login_pwd, String user_name, int status, Date create_time,
			String tel, SysRole role) {
		super();
		this.user_id = user_id;
		this.login_name = login_name;
		this.login_pwd = login_pwd;
		this.user_name = user_name;
		this.status = status;
		this.create_time = create_time;
		this.tel = tel;
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "Sys_User [user_id=" + user_id + ", login_name=" + login_name + ", login_pwd=" + login_pwd
				+ ", user_name=" + user_name + ", status=" + status + ", create_time=" + create_time + ", tel=" + tel
				+ ", role=" + role + "]";
	}
	
}
