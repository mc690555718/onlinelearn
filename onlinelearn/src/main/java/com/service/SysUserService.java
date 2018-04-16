package com.service;

import java.util.List;
import java.util.Set;
import com.bean.SysUser;


public interface SysUserService {
	
	public void add(SysUser user);
	
	public void remove(int user_id);
	
	public void edit(SysUser user);
	
	public SysUser getById(int user_id);
	
	public SysUser getByName(String login_name);
	
	public List<SysUser> query(String qname);

	public Set<String> getRoleNameSet(SysUser user);

	public Set<String> getPermissionNamesSet(SysUser user);

}
