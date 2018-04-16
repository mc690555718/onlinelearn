package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.SysRole;
import com.mapper.SysRoleMapper;

@Service
public class SysRoleServiceImpl implements SysRoleService{
	
	@Autowired
	private SysRoleMapper mapper;

	@Override
	public void add(SysRole role) {
		if (role != null) {
			mapper.add(role);
		}
	}

	@Override
	public void remove(int role_id) {
		if (role_id > 0) {
			mapper.remove(role_id);
		}
	}

	@Override
	public void edit(SysRole role) {
		if (role!=null) {
			mapper.edit(role);
		}
	}

	@Override
	public SysRole getById(int role_id) {
		if (role_id > 0) {
			return mapper.getById(role_id);
		}
		return null;
	}

	@Override
	public List<SysRole> query() {
		return mapper.query();
	}

	@Override
	public SysRole getfirstRole() {
		return mapper.getfirstRole();
	}

}
