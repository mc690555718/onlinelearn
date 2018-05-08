package com.mapper;

import java.util.List;
import java.util.Map;
import com.bean.EduCourse;
import com.bean.TeacherBean;

public interface EduCourseMapper {
	
	public void remove(int course_id);
	
	public void update(EduCourse course);
	
	public EduCourse getById(int course_id);
	
	public List<EduCourse> query(Map<Object, Object> map);
	
	public void add(EduCourse course);

	public int setTeacher(Map<Object, Object> map);
	
	public List<TeacherBean> getTeacherByCourseId(int course_id);
	
	public void removeCourseTeacher(int course_id);


}
