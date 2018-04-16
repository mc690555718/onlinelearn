package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.SysFunction;
import com.mapper.SysFunctionMapper;

@Service
public class SysFunctionServiceImpl implements SysFunctionService{
	
//	private int function_id;
//	private int parent_id;        //权限父ID
//	private String function_name; //权限名
//	private String function_url;  //权限URL
//	private int function_type;    //权限类型 1菜单 2功能
//	private Date create_time;     //创建时间
//	private int sort;             //排序
//	private String function_alias;//别名
	@Autowired
	private SysFunctionMapper mapper;

	@Override
	public List<SysFunction> getByRoleId(int role_id) {
		if (role_id > 0) {
			return mapper.getByRoleId(role_id);
		}
		return null;
	}
	
	
	@Override
	public List<SysFunction> query() {
		return mapper.query(null);
	}

	@Override
	public List<SysFunction> queryMenu() {
		Map<Object,Object> map = new HashMap<>();
		map.put("function_type",1);
		return mapper.query(map);
	}

	@Override
	public List<SysFunction> queryFunction() {
		Map<Object,Object> map = new HashMap<>();
		map.put("function_type",2);
		List<SysFunction> functions = mapper.query(map);
		return functions;
	}

}
