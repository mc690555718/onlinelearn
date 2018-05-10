package com.mapper;

import java.util.List;

import com.bean.EduCourse;
import com.bean.EduCourseKpoint;

public interface KpointNoseMapper {

	List<EduCourseKpoint> listbyKpoint(int courseId);
}
