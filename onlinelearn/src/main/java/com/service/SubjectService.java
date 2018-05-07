package com.service;

import java.util.List;

import com.bean.SubjectBean;

public interface SubjectService {
	
	SubjectBean getByIdSM(int id);
	
	List<SubjectBean> listAll();

}
