package com.service;

import java.util.List;
import java.util.Map;

import com.bean.CourseCommentUser;

public interface CourseCommentService {

	List<CourseCommentUser> listallCourseComment(Map map);
	List<CourseCommentUser> listallCourseCommentSon(Map map);
}
