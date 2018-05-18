package com.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.SysRole;
import com.mapper.SysRoleMapper;
import com.util.CharTool;

@Service
public class SysRoleServiceImpl implements SysRoleService{
	
	@Autowired
	private SysRoleMapper mapper;

	@Override
	public void add(SysRole role) {
		if (role != null) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date = df.format(new Date());
			try {
				Date now = df.parse(date);
				role.setCreate_time(now);
			} catch (ParseException e) {
				e.printStackTrace();
			}
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

	@Override
	public SysRole getByName(String role_name) {
		if (role_name != null && role_name.trim().length() != 0) {
			return mapper.getByName(CharTool.setCharEncoding(role_name));
		}
		return null;
	}

}
