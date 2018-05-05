package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.TeacherBean;
import com.mapper.TeacherMapper;

@Service
public  class TeacherServiceImpl implements TeacherService{
	@Autowired
	private TeacherMapper teacherMapper;
	@Override
	public void save(TeacherBean teacherBean) {
		teacherMapper.save(teacherBean);
		
	}

	@Override
	public void update(TeacherBean teacherBean) {
		teacherMapper.update(teacherBean);
	}

	@Override
	public List<TeacherBean> listAll(Map map) {
		List<TeacherBean>list=teacherMapper.listAll(map);
		return list;
	}

	@Override
	public void delete(int id) {
		teacherMapper.delete(id);
		
	}

	@Override
	public TeacherBean getById(int id) {
		return teacherMapper.getById(id);
	}

	

}
