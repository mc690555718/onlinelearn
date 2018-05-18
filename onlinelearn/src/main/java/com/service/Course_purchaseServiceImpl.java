package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Course_purchase;
import com.mapper.Course_purchaseMapper;
@Service
public class Course_purchaseServiceImpl implements Course_purchaseService {

	@Autowired
	private Course_purchaseMapper course_purchaseMapper;
	
	public Boolean queryStatus(Course_purchase course_purchase) {
		return course_purchaseMapper.queryStatus(course_purchase);
	}

	public void addCourse_purchase(Course_purchase course_purchase) {
		course_purchaseMapper.addCourse_purchase(course_purchase);
	}

}
