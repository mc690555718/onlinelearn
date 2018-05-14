package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.EduCourse;
import com.bean.EduCourseNote;
import com.mapper.ConurseNoseMapper;
@Service
public class ConurseNoseServiceImpl implements ConurseNoseService{

	@Autowired
	private ConurseNoseMapper conurseNoseMapper;

	public List<EduCourse> listbyCourse(EduCourse course) {
		return conurseNoseMapper.listbyCourse(course);
	}

	public EduCourse byIdcourse(int courseid) {
		return conurseNoseMapper.byIdcourse(courseid);
	}

	public void addnode(EduCourseNote courseNote) {
		conurseNoseMapper.addnode(courseNote);
	}

	public void updatenode(EduCourseNote courseNote) {
		conurseNoseMapper.updatenode(courseNote);
	}

	public EduCourseNote querynode(EduCourseNote courseNote) {
		return conurseNoseMapper.querynode(courseNote);
	}
}
