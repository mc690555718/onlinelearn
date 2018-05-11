package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Questions;
import com.mapper.QuestionsMapper;

@Service
public class QuestionsServiceImpl implements QuestionsService{

	@Autowired
	private QuestionsMapper QuestionsMapper;

	@Override
	public void save(Questions questions) {
		QuestionsMapper.save(questions);
		
	}

	@Override
	public void update(Questions questions) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Questions> listAll(Map map) {
		return QuestionsMapper.listAll(map);
	}

	@Override
	public void delete(int id) {
		QuestionsMapper.delete(id);
	}

	@Override
	public Questions getById(int id) {
		return QuestionsMapper.getById(id);
	}

	@Override
	public void updatePraise(int id) {
		QuestionsMapper.updatePraise(id);
	}

	@Override
	public void saveRelation(Map map) {
		QuestionsMapper.saveRelation(map);
		
	}
}
