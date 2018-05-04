package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.Questions_comment;

public interface Questions_commentMapper {

	public void save(Questions_comment comment);
	public void update(int id);
	public List<Questions_comment> listAll(Map map);
	public void delete(int id);
	public Questions_comment getById(int id);
	public List<Questions_comment> getById1(int id);
}
