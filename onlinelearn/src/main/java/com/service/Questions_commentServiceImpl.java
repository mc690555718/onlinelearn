package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Questions;
import com.bean.Questions_comment;
import com.mapper.Questions_commentMapper;
@Service
public class Questions_commentServiceImpl implements Questions_commentService{

	@Autowired
	private Questions_commentMapper Questions_commentMapper;
	@Override
	public void save(Questions_comment comment) {
	     Questions_commentMapper.save(comment);
	}

	@Override
	public void update(int id) {
		Questions_commentMapper.update(id);
		
	}

	@Override
	public List<Questions_comment> listAll(Map map) {
		return Questions_commentMapper.listAll(map);
	}

	@Override
	public void delete(int id) {
		Questions_commentMapper.delete(id);
	}

	@Override
	public Questions_comment getById(int id) {
		return Questions_commentMapper.getById(id);
	}

	@Override
	public List<Questions_comment> getById1(int id) {
		return Questions_commentMapper.getById1(id);
	}

	@Override
	public void updatePraise(int id) {
		Questions_commentMapper.updatePraise(id);
	}

	@Override
	public List<Questions_comment> getById2(int id) {
		return Questions_commentMapper.getById2(id);
	}

	@Override
	public List<Questions_comment> getById3(int id) {
		return Questions_commentMapper.getById3(id);
	}

	@Override
	public List<Questions_comment> getListById(int commentId) {
		return Questions_commentMapper.getListById(commentId);
	}

	@Override
	public void addReply_count(int id) {
		Questions_commentMapper.addReply_count(id);
	}

	@Override
	public void deleteAll(Questions_comment comment) {
		Questions_commentMapper.deleteAll(comment);
	}

	@Override
	public void deleteSubreview(int id) {
		Questions_commentMapper.deleteSubreview(id);
	}

	@Override
	public List<Questions_comment> getId(Questions_comment comment) {
		return Questions_commentMapper.getId(comment);
	}

	@Override
	public int getQuestions_Id(int id) {
		return Questions_commentMapper.getQuestions_Id(id);
	}

	@Override
	public List<Questions_comment> getByCid(int cid) {
		return Questions_commentMapper.getByCid(cid);
	}
}
