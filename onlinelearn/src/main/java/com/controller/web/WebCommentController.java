package com.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.ArticleComment;
import com.bean.Comment;

import com.service.ArticleService;

@Controller
public class WebCommentController {
	@Autowired
	ArticleService articleService;
	@RequestMapping("/front/article/webcomment")
	public ModelAndView webcomment(int otherId) {
		ModelAndView mv=new ModelAndView();
		List<Comment> listAll=articleService.listComment(otherId);
		mv.addObject("commentList",listAll);
		mv.setViewName("/web/comment/comment");
		return mv;
	}

}
