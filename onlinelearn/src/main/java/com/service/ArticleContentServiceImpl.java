package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.ArticleContent;
import com.mapper.ArticleContentMapper;
@Service
public class ArticleContentServiceImpl implements ArticleContentService{

	@Autowired
	private ArticleContentMapper articleContentMapper;
	@Override
	public void save(ArticleContent articleContent) {
		// TODO Auto-generated method stub
		articleContentMapper.save(articleContent);
	}

	@Override
	public void delete(int article_id) {
		// TODO Auto-generated method stub
		articleContentMapper.delete(article_id);
	}

	@Override
	public ArticleContent getById(int article_id) {
		// TODO Auto-generated method stub
		return articleContentMapper.getById(article_id);
	}

	@Override
	public List<ArticleContent> listAll() {
		// TODO Auto-generated method stub
		List<ArticleContent> list = articleContentMapper.listAll();
		return list;
	}

	@Override
	public void update(ArticleContent articleContent) {
		// TODO Auto-generated method stub
		articleContentMapper.update(articleContent);
	}

}
