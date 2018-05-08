package com.service;

import java.util.List;
import java.util.Map;
import com.bean.EduCourse;
import com.bean.TeacherBean;

public interface EduCourseService {

	public void add(EduCourse course,String teacher_id);
	
	public void remove(String course_id);
	
	public void update(EduCourse course, String teacher_id);
	
	public EduCourse getById(String course_id);
	
	public List<EduCourse> query(Map<Object,Object> map);
	
	public List<TeacherBean> getTeacherByCourseId(String course_id);

	
}
