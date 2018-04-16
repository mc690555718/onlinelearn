package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.SysFunction;;

public interface SysFunctionMapper {

//	public void add(SysFunction funcion);
//	
//	public void remove(int function_id);
//	
//	public void edit(SysFunction funcion);
//	
//	public SysFunction getById(int function_id);
	
	public List<SysFunction> getByRoleId(int role_id);
	
	public List<SysFunction> query(Map<Object,Object> map);
	
}
