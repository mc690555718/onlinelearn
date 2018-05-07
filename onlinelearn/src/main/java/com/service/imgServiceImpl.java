package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.img;
import com.mapper.imgMapper;



@Service
public class imgServiceImpl implements imgService{

	@Autowired
	private imgMapper imgMapper;

	@Override
	public void save(img img) {
		imgMapper.save(img);
		
	}

	@Override
	public List<img> listAll(Map map) {
	List<img> list=imgMapper.listAll(map);
		return list;
	}

	@Override
	public void delete(int imageId) {
	imgMapper.delete(imageId);
		
	}

	@Override
	public void update(img img) {
	imgMapper.update(img);
		
	}

	@Override
	public img getById(int imageId) {
		
		return imgMapper.getById(imageId);
	}

	@Override
	public List<img> checkName(Map map) {
		// TODO Auto-generated method stub
		return imgMapper.checkName(map);
	}

	


	

}
