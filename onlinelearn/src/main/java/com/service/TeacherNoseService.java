package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bean.TeacherBean;
@Service
public interface TeacherNoseService {

	List<TeacherBean> listbyTeacher();
	List<TeacherBean> bysubjectTeacher(int subjectid);
}
