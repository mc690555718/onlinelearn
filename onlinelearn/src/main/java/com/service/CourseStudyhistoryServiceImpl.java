package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.EduCourseStudyhistory;
import com.mapper.CourseStudyhistoryMapper;
@Service
public class CourseStudyhistoryServiceImpl implements CourseStudyhistoryService{

	@Autowired
	private CourseStudyhistoryMapper courseStudyhistoryMapper;
	
	public EduCourseStudyhistory threeSelect(EduCourseStudyhistory EduCourseStudyhistory) {
		return courseStudyhistoryMapper.threeSelect(EduCourseStudyhistory);
	}

}
