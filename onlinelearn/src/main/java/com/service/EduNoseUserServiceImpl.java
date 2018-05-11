package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Edu_User;
import com.mapper.EduNoseUserMapper;

@Service
public class EduNoseUserServiceImpl implements EduNoseUserService{

	@Autowired
	private EduNoseUserMapper eduNoseUserMapper;
	
	public List<Edu_User> SomeoneHas(int courseid) {
		return eduNoseUserMapper.SomeoneHas(courseid);
	}

}
