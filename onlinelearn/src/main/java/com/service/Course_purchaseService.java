package com.service;

import com.bean.Course_purchase;

public interface Course_purchaseService {

	Boolean queryStatus(Course_purchase course_purchase);
	void addCourse_purchase(Course_purchase course_purchase);
}
