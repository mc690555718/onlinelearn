package com.service;

import java.util.List;
import com.bean.SysFunction;

public interface SysFunctionService {

	public List<SysFunction> getByRoleId(int role_id);
	
	public List<SysFunction> queryMenu();
	
	public List<SysFunction> queryFunction();

	public List<SysFunction> query();
	
}
