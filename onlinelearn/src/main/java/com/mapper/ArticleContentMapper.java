package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.ArticleContent;

public interface ArticleContentMapper {
	
	public void save(ArticleContent articleContent);
	public void delete(int article_id);
	public void update(ArticleContent articleContent);
	public ArticleContent getById(int article_id);
	public List<ArticleContent> listAll();


}
