package com.service;

import java.util.List;

import com.bean.Questions_tag;
import com.bean.ZtreeNode;

public interface Questions_tagService {

	public List<Questions_tag> listAll();
	public List<ZtreeNode> listAll1();
	public void save(Questions_tag tag);
	public void update(Questions_tag tag);
	public Questions_tag getById(int id);
	public void updateStatus(int id);
	public List<Questions_tag> getBylistId(int id);
}
