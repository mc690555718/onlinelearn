package com.controller.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Article;
import com.bean.ArticleContent;
import com.service.ArticleContentService;
import com.service.ArticleService;


@Controller
@RequestMapping("/front/article")
public class WebArticleController {

	@Autowired
	ArticleService articleService;
	@Autowired
	ArticleContentService articleContentService;
	@RequestMapping("/articlelist")
	public ModelAndView listAll(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap<>();
		map=initMap(request, map);
		List<Article> list = articleService.listAll(map);
		mv.addObject("list", list);
		mv.setViewName("/web/article/article-list");
		return mv;
	}
	
	public Map initMap(HttpServletRequest request,Map map) {
		return map;
	}
	
	
//	œ‘ æŒƒ’¬¿‡»›
	@RequestMapping("/listContent")
	public ModelAndView updateValue(int article_id) {
		ModelAndView mv = new ModelAndView();
		Article article = articleService.getById(article_id);
		List<ArticleContent> list = articleContentService.listAll();
		mv.addObject("article", article);
		mv.addObject("list", list);
		mv.setViewName("/web/article/article-info");
		return mv;
	}
}
