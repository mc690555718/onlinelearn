package com.service;

import java.util.List;
import java.util.Map;
import com.bean.EduCourse;

public interface EduCourseService {

	public void add(EduCourse course,String teacher_id);
//	
//	public void remove(int course_id);
//	
//	public void update(EduCourse course);
//	
//	public EduCourse getById();
	
	public List<EduCourse> query(Map<Object,Object> map);
	
}
