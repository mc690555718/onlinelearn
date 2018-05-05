package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.TeacherBean;

public interface TeacherMapper {
	
	public void save(TeacherBean teacherBean);
	public void update(TeacherBean teacherBean);
	public List<TeacherBean> listAll(Map map);
	public void delete(int id);
	public TeacherBean getById(int id);
	public TeacherBean getByIdSM(int id);
}
