package com.bean;

import java.util.Date;

public class Questions {

	private int id;//����
	private Edu_User edu_user;
	private String title;//�ʴ����
	private String content;//�ʴ�����
	private int type;//���� 1�γ��ʴ� 2 ѧϰ����
	private int status;//״̬ 0�ɻظ�1���ɻظ���������Ѵ𰸺��Ϊ1 ��
    private int reply_count;//�ʴ�ظ�����
    private int browse_count;//�ʴ��������
    private int praise_count;//�ʴ��������
    private Date add_time;//����ʱ��
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	public int getBrowse_count() {
		return browse_count;
	}
	public void setBrowse_count(int browse_count) {
		this.browse_count = browse_count;
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
    
}