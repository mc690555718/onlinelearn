package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.Questions;

public interface QuestionsMapper {
	public void save(Questions questions);
	public void update(Questions questions);
	public List<Questions> listAll(Map map);
	public void delete(int id);
	public Questions getById(int id);
	public void updatePraise(int id);
	public void saveRelation(Map map);
	public int getMaxId();
	public void addBrowse_count(int id);
	public void addReply_count(int id);
	public void deleteById(int id);
	public void updateReply_count(int id);
	public List<Questions> listById(int id);
}
