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
	public void update(Map map) {
		Edu_UserDao.update(map);

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



}
