package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Edu_User;
import com.mapper.Edu_UserDao;
@Service
public class Edu_UserServiceImpl  implements Edu_UserService{

	@Autowired
	private Edu_UserDao Edu_UserDao;

	@Override
	public List<Edu_User> listUser(Map map) {
		return Edu_UserDao.listUser(map);
	}


	@Override
	public void updateZZ(Map map) {
		Edu_UserDao.updateZZ(map);

	}
	@Override
	public void save(Edu_User user) {
		Edu_UserDao.save(user);

	}

	@Override
	public Edu_User getById(int user_id) {
      System.out.println(Edu_UserDao.getById(user_id));
		return Edu_UserDao.getById(user_id);
	}

	@Override
	public Edu_User getPwd(String email) {
		
		return Edu_UserDao.getPwd(email);
	}

	@Override
	public void updatepwd(Edu_User edu_User) {
		Edu_UserDao.updatepwd(edu_User);
		
	}

	@Override
	public void updateUser(Edu_User edu_User) {
		Edu_UserDao.updateUser(edu_User);
		
	}


	@Override
	public void updateImg(Edu_User edu_User) {
		Edu_UserDao.updateImg(edu_User);
		
	}



}
