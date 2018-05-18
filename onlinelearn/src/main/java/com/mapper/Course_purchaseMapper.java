package com.mapper;

import com.bean.Course_purchase;

public interface Course_purchaseMapper {

	Boolean queryStatus(Course_purchase course_purchase);
	void addCourse_purchase(Course_purchase course_purchase);
}
