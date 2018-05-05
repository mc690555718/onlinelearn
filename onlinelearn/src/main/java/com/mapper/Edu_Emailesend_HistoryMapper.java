package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.Edu_Emailesend_History;

public interface Edu_Emailesend_HistoryMapper {
	
	public List<Edu_Emailesend_History> list(Map map);
	public Edu_Emailesend_History getById(int id);
	public void save(Edu_Emailesend_History edu_Emailesend_History);
	public void delete(int id);
	public void update(Edu_Emailesend_History edu_Emailesend_History);
	

}
