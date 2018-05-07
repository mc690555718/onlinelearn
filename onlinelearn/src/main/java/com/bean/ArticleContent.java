package com.bean;

public class ArticleContent {
	
	private int article_id;
	private String content;
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ArticleContent [article_id=" + article_id + ", content=" + content + "]";
	}

}
