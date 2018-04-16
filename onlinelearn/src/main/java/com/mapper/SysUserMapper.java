package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.SysUser;

public interface SysUserMapper {

	public void add(SysUser user);
	
	public void remove(int user_id);
	
	public void edit(SysUser user);
	
	public SysUser getById(int user_id);
	
	public SysUser getByName(String login_name);
	
	public List<SysUser> query(Map<Object,Object> map);
	
}
