package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.Article;
import com.bean.Comment;

public interface ArticleMapper {

	public void save(Article article);
	public void delete(int article_id);
	public void update(Article article);
	public Article getById(int article_id);
	public List<Article> listAll(Map map);
	public int getTotalCount(Map map);
	public void updateContent(Article map);
	public void saveContent(Article map);
	public void praiseEdit(int article_id);
	
	public List<Article> alistAll(Map map);
	public void releaseEdit(Article article);
}
