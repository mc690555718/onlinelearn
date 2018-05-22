package com.service;

import java.util.List;
import java.util.Map;

import com.bean.EduCourse;
import com.bean.EduCourseFavorites;
import com.bean.EduCourseNote;

public interface ConurseNoseService {

	List<EduCourse> listbyCourse(EduCourse course);
	EduCourse byIdcourse(int courseid);
	void addnode(EduCourseNote courseNote);
	void updatenode(EduCourseNote courseNote);
	EduCourseNote querynode(EduCourseNote courseNote);
	boolean isNull(EduCourseFavorites courseFavorites);
	void addLove(EduCourseFavorites courseFavorites);
	List<EduCourse> bytime();
	List<EduCourse> byprice();
	List<EduCourse> byall();
	//高级检索,主要用于免费课程
	public List<EduCourse> listCourses(Map<Object, Object> map);
	//根据用户id 查询用户 的  收藏  课程
	public List<EduCourse> getFavoriteCourse(int user_id);
	//根据用户  id   课程id  删除  收藏课程
	public void deleteFaveoriteById(int user_id, int course_id);
	//根据课程字符串链批量删除
	public void deleteFaveorite(int user_id, String courseIdStr);
}
