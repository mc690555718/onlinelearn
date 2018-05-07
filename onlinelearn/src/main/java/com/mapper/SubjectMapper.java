package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.SubjectBean;
import com.bean.TeacherBean;

public interface SubjectMapper {
	
	SubjectBean getByIdSM(int id);

	List<SubjectBean> listAll();
	
	List<SubjectBean> getById(int id);

}
