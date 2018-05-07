package com.service;

import java.util.List;

import com.bean.SubjectBean;
import com.bean.SysSubject;

public interface SubjectService {
	
	SubjectBean getByIdSM(int id);
	
	List<SubjectBean> listAll();
	
	List<SubjectBean> getById(int id);

}
