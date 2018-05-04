package com.mapper;

import java.util.List;

import com.bean.Questions_tag;

public interface Questions_tagMapper {

	public List<Questions_tag> listAll();
	public void save(Questions_tag tag);
	public void update(Questions_tag tag);
	public Questions_tag getById(int id);
	public void updateStatus(int id);
}
