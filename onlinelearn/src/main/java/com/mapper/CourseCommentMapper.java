package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.CourseCommentUser;

public interface CourseCommentMapper {

	List<CourseCommentUser> listallCourseComment(Map map);
	List<CourseCommentUser> listallCourseCommentSon(Map map);
}
