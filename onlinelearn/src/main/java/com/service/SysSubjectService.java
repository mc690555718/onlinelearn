package com.service;

import java.util.List;
import java.util.Map;

import com.bean.SysSubject;

public interface SysSubjectService {

	public void save(SysSubject subject);
	
	public void remove(int subject_id);
	
	public SysSubject getById(int subject_id);
	
	public List<SysSubject> query(Map<Object, Object> map);
	
	public List<SysSubject> queryParent(Map<Object, Object> map);

	public void update(SysSubject subject);
	
}
