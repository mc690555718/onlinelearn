package com.controller.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Article;
import com.bean.ArticleContent;
import com.bean.Comment;
import com.service.ArticleContentService;
import com.service.ArticleService;
import com.service.CommentService;


@Controller
public class WebArticleController {

	@Autowired
	ArticleService articleService;
	@Autowired
	ArticleContentService articleContentService;
	@RequestMapping("/front/article/articlelist")
	public ModelAndView articlelist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map map=new HashMap<>();
		List<Article> list = articleService.listAll(map);
		mv.addObject("articleList", list);
		mv.setViewName("/web/article/article-list");
		return mv;
	}
	
//	œ‘ æŒƒ’¬¿‡»›
	@RequestMapping("front/articleinfo/{article_id}")
	public ModelAndView updateValue(@PathVariable int article_id) {
		ModelAndView mv = new ModelAndView();
		Article article = articleService.getById(article_id);
		mv.addObject("article", article);
		mv.setViewName("/web/article/article-info");
		return mv;
	}
}
