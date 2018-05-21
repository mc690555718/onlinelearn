package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.Edu_User;

public interface Edu_UserDao {
	
	 public List<Edu_User> listUser(Map  map);
	 public void updateZZ(Map map);
	 public Edu_User getById(int user_id);
	 public void save(Edu_User user);
	 public Edu_User getPwd(String email);
	 public void updatepwd(Edu_User edu_User);
	 public void updateUser(Edu_User edu_User);
	 public void updateImg(Edu_User edu_User);
         
}
