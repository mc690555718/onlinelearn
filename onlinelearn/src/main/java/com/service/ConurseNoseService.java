package com.service;

import java.util.List;

import com.bean.EduCourse;
import com.bean.EduCourseNote;

public interface ConurseNoseService {

	List<EduCourse> listbyCourse(EduCourse course);
	EduCourse byIdcourse(int courseid);
	void addnode(EduCourseNote courseNote);
	void updatenode(EduCourseNote courseNote);
	EduCourseNote querynode(EduCourseNote courseNote);
}
