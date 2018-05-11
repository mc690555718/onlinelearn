package com.service;

import java.util.List;

import com.bean.EduCourse;
import com.bean.EduCourseKpoint;

public interface KpointNoseService {

	List<EduCourseKpoint> listbyKpoint(int courseId);
	EduCourseKpoint bykopint(int kopintid);
}
