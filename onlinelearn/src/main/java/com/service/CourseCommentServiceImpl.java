package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.CourseCommentUser;
import com.mapper.CourseCommentMapper;

@Service
public class CourseCommentServiceImpl implements  CourseCommentService{

	@Autowired
	private CourseCommentMapper courseCommentMapper;
	
	public List<CourseCommentUser> listallCourseComment(Map map) {
		return courseCommentMapper.listallCourseComment(map);
	}

	@Override
	public List<CourseCommentUser> listallCourseCommentSon(Map map) {
		return courseCommentMapper.listallCourseCommentSon(map);
	}

}
