package com.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.SysFunction;
import com.bean.SysUser;
import com.mapper.SysUserMapper;
import com.util.Encryption;

@Service
public class SysUserServiceImpl implements SysUserService{
	
	@Autowired
	private SysUserMapper mapper;

	@Override
	public void add(SysUser user) {
		if (user!= null) {
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				user.setCreate_time(sdf.parse(sdf.format(now)));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String pwd =  Encryption.encryptionByMD5(user.getLogin_name(), user.getLogin_pwd());
			user.setLogin_pwd(pwd);
			mapper.add(user);
		}
	}

	@Override
	public void remove(int user_id) {
		if (user_id > 0) {
			mapper.remove(user_id);
		}
	}

	@Override
	public void edit(SysUser user) {
		if (user!= null) {
			mapper.edit(user);
		}
	}

	@Override
	public SysUser getById(int user_id) {
		if (user_id != 0) {
			return mapper.getById(user_id);
		}
		return null;
	}

	@Override
	public SysUser getByName(String login_name) {
		if (login_name != null) {
			return mapper.getByName(login_name);
		}
		return null;
	}

	@Override
	public List<SysUser> query(String qname) {
		if (qname != null) {
			Map<Object,Object> map = initMap(qname);
			return mapper.query(map);
		}
		return mapper.query(null);
	}
	
	public Map<Object,Object> initMap(String qname){
		Map<Object,Object> map = new HashMap<>();
		map.put("qname", qname);
		return map;
	}

	@Override
	public Set<String> getRoleNameSet(SysUser user) {
		Set<String> set = new HashSet<>();
		set.add(user.getRole().getRole_name());
		return set;
	}

	@Override
	public Set<String> getPermissionNamesSet(SysUser user) {
		Set<String> set = new HashSet<>();
		for (SysFunction function : user.getRole().getFunctions()) {
			if (function.getFunction_type() == 2) {
				set.add(function.getFunction_alias());
			}
		}
		return set;
	}

}
