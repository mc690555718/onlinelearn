package com.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.EduCourse;
import com.mapper.EduCourseMapper;;

@Service
public class EduCourseServiceImpl implements EduCourseService{
	
	@Autowired
	private EduCourseMapper mapper;

//	public void add(EduCourse course);
//	
//	public void remove(int course_id);
//	
//	public void update(EduCourse course);
//	
//	public EduCourse getById();
	
	public List<EduCourse> query(Map<Object, Object> map){
		return mapper.query(map);
	}
	
}
