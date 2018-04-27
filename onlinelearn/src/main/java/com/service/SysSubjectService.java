package com.service;

import java.util.List;

import com.bean.SysSubject;

public interface SysSubjectService {

	public void save(String subject_name);
	
	public void remove(int subject_id);
	
	public SysSubject getById(int subject_id);
	
	public List<SysSubject> query(String qname);

	void update(String subject_name, String sort, String subject_id);
	
}
