package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Article;
import com.bean.Comment;
import com.mapper.ArticleMapper;

@Service
public   class ArticleServiceImpl implements ArticleService{

	@Autowired
	private ArticleMapper articleMapper;
	@Override
	public void save(Article article) {
		// TODO Auto-generated method stub
		articleMapper.save(article);
	}

	@Override
	public void delete(int article_id) {
		// TODO Auto-generated method stub
		articleMapper.delete(article_id);
	}

	@Override
	public Article getById(int article_id) {
		// TODO Auto-generated method stub
		return articleMapper.getById(article_id);
	}



	@Override
	public int getTotalCount(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public void update(Article article) {
		// TODO Auto-generated method stub
		articleMapper.update(article);
	}

	@Override
	public List<Article> listAll(Map map) {
		// TODO Auto-generated method stub
		List<Article> list = articleMapper.listAll(map);
		return list;
	}

	@Override
	public void updateContent(Article map) {
		// TODO Auto-generated method stub
		articleMapper.updateContent(map);
	}

	@Override
	public void saveContent(Article map) {
		// TODO Auto-generated method stub
		articleMapper.saveContent(map);
	}

	
}
