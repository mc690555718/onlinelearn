package com.util;

public class Result {
	private boolean success;
	private String message;
	private Object entity;
	
	public Result() {
		// TODO Auto-generated constructor stub
	}
	
	public Result(boolean success, String message, Object entity) {
		super();
		this.success = success;
		this.message = message;
		this.entity = entity;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getEntity() {
		return entity;
	}
	public void setEntity(Object entity) {
		this.entity = entity;
	}
	@Override
	public String toString() {
		return "Result [success=" + success + ", message=" + message + ", entity=" + entity + "]";
	}
	
	
	
	
}
