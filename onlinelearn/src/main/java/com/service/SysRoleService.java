package com.service;

import java.util.List;
import com.bean.SysRole;

public interface SysRoleService {
	
	public void add(SysRole role);
	
	public void remove(int role_id);
	
	public void edit(SysRole role);
	
	public SysRole getById(int role_id);
	
	public List<SysRole> query();

	public SysRole getfirstRole();

}
