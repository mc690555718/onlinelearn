package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.TeacherBean;
import com.bean.WebTeacherBean;

public interface TeacherMapper {
	
	public void save(TeacherBean teacherBean);
	public void update(TeacherBean teacherBean);
	public List<TeacherBean> listAll(Map map);
	public void delete(int id);
	public TeacherBean getById(int id);
	public TeacherBean getByIdSM(int id);
	List<TeacherBean> listTea(int id);
	
}
