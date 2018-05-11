package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.TeacherBean;
import com.mapper.TeacherNoseMapper;
@Service
public class TeacherNoseServiceImpl implements TeacherNoseService{

	@Autowired
	private TeacherNoseMapper teacherNoseMapper;

	@Override
	public List<TeacherBean> listbyTeacher() {
		return teacherNoseMapper.listbyTeacher();
	}

	@Override
	public List<TeacherBean> bysubjectTeacher(int subjectid) {
		return teacherNoseMapper.bysubjectTeacher(subjectid);
	}
}
