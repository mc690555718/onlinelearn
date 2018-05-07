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
}
