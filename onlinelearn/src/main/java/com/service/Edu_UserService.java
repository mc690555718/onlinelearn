package com.service;

import java.util.List;
import java.util.Map;

import com.bean.Edu_User;

public interface Edu_UserService {
	
	 public List<Edu_User> listUser(Map map);
	 public void update(Map map);
	 public void updateZZ(Map map);
	 public Edu_User getById(int user_id);
	 public void save(Edu_User user);

}
