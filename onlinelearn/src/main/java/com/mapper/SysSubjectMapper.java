package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.SysSubject;

public interface SysSubjectMapper {

	public void save(SysSubject subject);
	
	public void remove(int subject_id);
	
	public void update(SysSubject subject);
	
	public SysSubject getById(int subject_id);
	
	public List<SysSubject> query(Map<Object, Object> map);
	
}
