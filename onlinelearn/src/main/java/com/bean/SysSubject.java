package com.bean;

import java.util.Date;

public class SysSubject {

	//	  `SUBJECT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
	//	  `SUBJECT_NAME` varchar(50) NOT NULL DEFAULT '' COMMENT '专业名称',
	//	  `STATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0:默认 1:删除',
	//	  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
	//	  `sort` int(11) DEFAULT '0' COMMENT '排序字段',

	private int subject_id;
	private String subject_name;
	private int status;
	private Date create_time;
	private int sort;
	private SysSubject sub;
	public SysSubject getSub() {
		return sub;
	}
	public void setSub(SysSubject sub) {
		this.sub = sub;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}

	public SysSubject() {
		// TODO Auto-generated constructor stub
	}

	public SysSubject(int subject_id, String subject_name, int status, Date create_time, int sort) {
		super();
		this.subject_id = subject_id;
		this.subject_name = subject_name;
		this.status = status;
		this.create_time = create_time;
		this.sort = sort;
	}
	@Override
	public String toString() {
		return "SysSubject [subject_id=" + subject_id + ", subject_name=" + subject_name + ", status=" + status
				+ ", create_time=" + create_time + ", sort=" + sort + ", sub=" + sub + "]";
	}

}
