package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.Questions;
import com.bean.Questions_comment;

public interface Questions_commentMapper {

	public void save(Questions_comment comment);
	public void update(int id);
	public List<Questions_comment> listAll(Map map);
	public void delete(int id);
	public Questions_comment getById(int id);
	public List<Questions_comment> getById1(int id);
	public void updatePraise(int id);
	public List<Questions_comment> getById2(int id);
	public List<Questions_comment> getById3(int id);
	public List<Questions_comment> getListById(int commentId);
	public void addReply_count(int id);
	public void deleteAll(Questions_comment comment);
	public void deleteSubreview(int id);
	public List<Questions_comment> getId(Questions_comment comment);
	public int getQuestions_Id(int id);
}
