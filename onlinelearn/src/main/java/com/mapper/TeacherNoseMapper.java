package com.mapper;

import java.util.List;

import com.bean.TeacherBean;

public interface TeacherNoseMapper {

	List<TeacherBean> listbyTeacher();
	List<TeacherBean> bysubjectTeacher(int subjectid);
}
