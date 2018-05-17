package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Questions_tag;
import com.bean.ZtreeNode;
import com.mapper.Questions_tagMapper;

@Service
public class Questions_tagServiceImpl implements Questions_tagService{

	@Autowired
	private Questions_tagMapper Questions_tagMapper;
	@Override
	public List<Questions_tag> listAll() {
		return Questions_tagMapper.listAll();
	}
	@Override
	public void save(Questions_tag tag) {
		Questions_tagMapper.save(tag);
		
	}
	@Override
	public void update(Questions_tag tag) {
		Questions_tagMapper.update(tag);
		
	}
	@Override
	public Questions_tag getById(int id) {
		return Questions_tagMapper.getById(id);
	}
	@Override
	public void updateStatus(int id) {
		Questions_tagMapper.updateStatus(id);
	}
	@Override
	public List<Questions_tag> getBylistId(int id) {
		return Questions_tagMapper.getBylistId(id);
	}
	@Override
	public List<ZtreeNode> listAll1() {
		List<Questions_tag> list=Questions_tagMapper.listAll();
		List<ZtreeNode> notes=new ArrayList<ZtreeNode>();
		for (int i = 0; i < list.size(); i++) {
			 Questions_tag qTag=list.get(i);
			 ZtreeNode ztreeNode=new ZtreeNode();
			 ztreeNode.setId(qTag.getQuestions_tag_id());
			 ztreeNode.setName(qTag.getQuestions_tag_name());
			 ztreeNode.setPid(Integer.parseInt(qTag.getParent_id()));
			 notes.add(ztreeNode);
		}
		return notes;
	}

}
