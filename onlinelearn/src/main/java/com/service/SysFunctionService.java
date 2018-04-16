package com.service;

import java.util.List;

import com.bean.SysFunction;

public interface SysFunctionService {

	public List<SysFunction> getByRoleId(int role_id);
	
	public List<SysFunction> query();
	
	public void removeRoleFunctions(int role_id);
	
	void addRoleFunctions(int role_id, String[] function_ids);
	
}
