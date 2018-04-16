package com.bean;

import java.util.List;

public class SysRole {

	
//	  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
//	  `ROLE_NAME` varchar(100) DEFAULT NULL COMMENT '角色名',
//	  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
	
	private int role_id;         //角色ID
	private String role_name;    //角色名
	private String create_time;  //创建时间
	private List<SysFunction> functions;
	
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public List<SysFunction> getFunctions() {
		return functions;
	}
	public void setFunctions(List<SysFunction> functions) {
		this.functions = functions;
	}
	
	public SysRole(int role_id, String role_name, String create_time, List<SysFunction> functions) {
		super();
		this.role_id = role_id;
		this.role_name = role_name;
		this.create_time = create_time;
		this.functions = functions;
	}
	
	public SysRole(int role_id, String role_name, String create_time) {
		super();
		this.role_id = role_id;
		this.role_name = role_name;
		this.create_time = create_time;
	}
	
	public SysRole() {
		
	}
	
	@Override
	public String toString() {
		return "SysRole [role_id=" + role_id + ", role_name=" + role_name + ", create_time=" + create_time
				+ ", functions=" + functions + "]";
	}
	
}
