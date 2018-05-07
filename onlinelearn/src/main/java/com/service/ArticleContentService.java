package com.service;

import java.util.List;

import com.bean.ArticleContent;

public interface ArticleContentService {

	public void save(ArticleContent articleContent);
	public void delete(int article_id);
	public void update(ArticleContent articleContent);
	public ArticleContent getById(int article_id);
	public List<ArticleContent> listAll();

}
