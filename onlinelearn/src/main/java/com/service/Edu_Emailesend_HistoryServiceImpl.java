package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Edu_Emailesend_History;
import com.mapper.Edu_Emailesend_HistoryMapper;

@Service
public class Edu_Emailesend_HistoryServiceImpl implements Edu_Emailesend_HistoryService{

	@Autowired
	private Edu_Emailesend_HistoryMapper eMapper;
	
	@Override
	public List<Edu_Emailesend_History> list(Map map) {
		List<Edu_Emailesend_History> list = eMapper.list(map);
		return list;
	}

	@Override
	public void save(Edu_Emailesend_History edu_Emailesend_History) {
		eMapper.save(edu_Emailesend_History);
	}

	@Override
	public void delete(int id) {
		eMapper.delete(id);
	}

	@Override
	public void update(Edu_Emailesend_History edu_Emailesend_History) {
		eMapper.update(edu_Emailesend_History);
	}

	@Override
	public Edu_Emailesend_History getById(int id) {
		Edu_Emailesend_History list = eMapper.getById(id);
		return list;
	}
}
