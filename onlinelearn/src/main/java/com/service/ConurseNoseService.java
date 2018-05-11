package com.service;

import java.util.List;

import com.bean.EduCourse;

public interface ConurseNoseService {

	List<EduCourse> listbyCourse(EduCourse course);
	EduCourse byIdcourse(int courseid);
}
