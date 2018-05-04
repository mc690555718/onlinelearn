package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Questions_comment;
import com.mapper.Questions_commentMapper;
@Service
public class Questions_commentServiceImpl implements Questions_commentService{

	@Autowired
	private Questions_commentMapper Questions_commentMapper;
	@Override
	public void save(Questions_comment comment) {
		// TODO Auto-generated method stub
		
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
}
