package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.imgType;
import com.mapper.imgTypeMapper;



@Service
public class imgTypeServiceImpl implements imgTypeService{
	@Autowired
 private imgTypeMapper imgTypeMapper;
	@Override
	public List<imgType> listtype() {
	List<imgType>  list=imgTypeMapper.listtype();
		return list;
	}
	@Override
	public void delete(int typeId) {
		imgTypeMapper.delete(typeId);
		
	}
	@Override
	public void save(imgType imgType) {
		imgTypeMapper.save(imgType);
		
	}
	@Override
	public imgType getById(int typeId) {
		
		return imgTypeMapper.getById(typeId);
	}
	@Override
	public void update(imgType imgType) {
	imgTypeMapper.update(imgType);
		
	}



}
