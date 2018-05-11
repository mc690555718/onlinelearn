package com.mapper;

import java.util.List;

import com.bean.EduCourse;

public interface ConurseNoseMapper {

	List<EduCourse> listbyCourse(EduCourse course);
	EduCourse byIdcourse(int courseid);
}
