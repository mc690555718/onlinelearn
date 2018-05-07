package com.service;

import java.util.List;
import java.util.Map;

import com.bean.img;

public interface imgService {

	public void save(img img);
	public List<img> listAll(Map map);
	public void delete(int imageId);
	public void update(img img);
	public img  getById(int imageId);
	public List<img > checkName(Map map);
}
