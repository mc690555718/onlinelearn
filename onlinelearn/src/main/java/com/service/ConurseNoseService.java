package com.service;

import java.util.List;
import java.util.Map;

import com.bean.EduCourse;
import com.bean.EduCourseNote;

public interface ConurseNoseService {

	List<EduCourse> listbyCourse(EduCourse course);
	EduCourse byIdcourse(int courseid);
	void addnode(EduCourseNote courseNote);
	void updatenode(EduCourseNote courseNote);
	EduCourseNote querynode(EduCourseNote courseNote);
	
	//高级检索,主要用于免费课程
	public List<EduCourse> listCourses(Map<Object, Object> map);
	//根据用户id 查询用户 的  收藏  课程
	public List<EduCourse> getFavoriteCourse(int user_id);
}
