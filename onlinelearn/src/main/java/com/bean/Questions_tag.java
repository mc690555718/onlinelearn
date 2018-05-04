package com.bean;

import java.util.Date;

public class Questions_tag {

	private int questions_tag_id;//主键id
	private String questions_tag_name;//标签名
	private int status;//状态0默认1删除
	private Date create_time;//创建时间
	private String parent_id;//父级id
	
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public int getQuestions_tag_id() {
		return questions_tag_id;
	}
	public void setQuestions_tag_id(int questions_tag_id) {
		this.questions_tag_id = questions_tag_id;
	}
	public String getQuestions_tag_name() {
		return questions_tag_name;
	}
	public void setQuestions_tag_name(String questions_tag_name) {
		this.questions_tag_name = questions_tag_name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	
}
