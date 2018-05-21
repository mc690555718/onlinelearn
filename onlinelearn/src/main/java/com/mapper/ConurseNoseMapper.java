package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.EduCourse;
import com.bean.EduCourseNote;

public interface ConurseNoseMapper {

	List<EduCourse> listbyCourse(EduCourse course);
	EduCourse byIdcourse(int courseid);
	void addnode(EduCourseNote courseNote);
	void updatenode(EduCourseNote courseNote);
	EduCourseNote querynode(EduCourseNote courseNote);
	
	//高级检索,主要用于查询免费课程
	public List<EduCourse> listCourses(Map<Object, Object> map);
	//用户id 查询  收藏  课程
	public List<EduCourse> getFavoriteCourse(int user_id);
}
