package com.bean;

import java.util.Date;

public class Questions_comment {

	private int id;//主键id
	private Edu_User edu_user;
	private Questions questions;
	private String content;//评论内容
	private int is_best;//是否最佳答案 0否1是
	private int reply_count;//回复数量
	private int praise_count;//点赞数
	private Date add_time;//回复时间
	private int comment_id;//父级评论id
	private String start;
    private String end;
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Edu_User getEdu_user() {
		return edu_user;
	}
	public void setEdu_user(Edu_User edu_user) {
		this.edu_user = edu_user;
	}
	public Questions getQuestions() {
		return questions;
	}
	public void setQuestions(Questions questions) {
		this.questions = questions;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIs_best() {
		return is_best;
	}
	public void setIs_best(int is_best) {
		this.is_best = is_best;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	public int getPraise_count() {
		return praise_count;
	}
	public void setPraise_count(int praise_count) {
		this.praise_count = praise_count;
	}
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	
}
