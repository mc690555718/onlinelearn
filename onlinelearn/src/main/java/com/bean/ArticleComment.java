package com.bean;

import java.util.Date;

public class ArticleComment {
	
	private int comment_id;
	private Edu_User edu_User;
	private int user_id;
	private int pcomment_id;
	private String content;
	private Date addtime;
	private int other_id;
	private int praise_count;
	private int reply_count;
	private int type;
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public Edu_User getEdu_User() {
		return edu_User;
	}
	public void setEdu_User(Edu_User edu_User) {
		this.edu_User = edu_User;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPcomment_id() {
		return pcomment_id;
	}
	public void setPcomment_id(int pcomment_id) {
		this.pcomment_id = pcomment_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	public int getOther_id() {
		return other_id;
	}
	public void setOther_id(int other_id) {
		this.other_id = other_id;
	}
	public int getPraise_count() {
		return praise_count;
	}
	public void setPraise_count(int praise_count) {
		this.praise_count = praise_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	

}
