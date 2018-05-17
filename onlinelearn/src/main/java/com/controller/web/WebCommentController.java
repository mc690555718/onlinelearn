package com.controller.web;

import java.lang.ProcessBuilder.Redirect;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Article;
import com.bean.Comment;
import com.bean.Edu_User;
import com.service.ArticleService;
import com.service.CommentService;
import com.util.Result;

@Controller
public class WebCommentController {

	@Autowired
	CommentService commentService;
	@Autowired
	ArticleService articleService;
	//显示文章
	@RequestMapping("/front/article/articlelist")
	public ModelAndView articlelist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map map=new HashMap<>();
		List<Article> list = articleService.alistAll(map);
		mv.addObject("articleList", list);
		mv.setViewName("/web/article/article-list");
		return mv;
	}
	
//	显示文章类容
	@RequestMapping("/front/articleinfo/{article_id}")
	public ModelAndView updateValue(@PathVariable int article_id) {
		ModelAndView mv = new ModelAndView();
		Article article = articleService.getById(article_id);
		articleService.addClickNum(article_id);
		mv.addObject("article", article);
		mv.setViewName("/web/article/article-info");
		return mv;
	}
	
	@RequestMapping("/front/article/webcomment")
//  显示评论
	public ModelAndView webcomment(int otherId) {
		ModelAndView mv=new ModelAndView();
		List<Comment> listAll=commentService.listComment(otherId);
		mv.addObject("commentList",listAll);
		mv.setViewName("/web/comment/comment");
		return mv;
	}
	
//  添加评论			  
	@RequestMapping("/front/comment/ajax/addcomment")
	public String addcomment(HttpServletRequest request,HttpSession session,int pCommentId,String content,int type,int otherId) {
		Edu_User edu_User = (Edu_User) session.getAttribute("login_success");
		Comment comment = new Comment();
		comment.setAddtime(new Date());
		comment.setP_comment_id(pCommentId);
		comment.setContent(content);
		comment.setType(type);
		comment.setOther_id(otherId);
		comment.setUser(edu_User);
		articleService.addNum(otherId);
		commentService.save(comment);
		return "/web/course/comment";
	}
	

	
//  添加子评论
	@RequestMapping("/front/comment/addcomment")
	public String addCommentReply(HttpServletRequest request,HttpSession session,int pCommentId,String content,int type,int otherId) {
		Edu_User edu_User = (Edu_User) session.getAttribute("login_success");
		Comment comment = new Comment();
		comment.setAddtime(new Date());
		comment.setP_comment_id(pCommentId);
		comment.setContent(content);
		comment.setType(type);
		comment.setOther_id(otherId);
		comment.setUser(edu_User);
		commentService.addNum(otherId);
		commentService.save(comment);
		return "/web/comment/comment";
	}
	
	//显示子评论
	@RequestMapping("/front/comment/ajax/commentreply")
	public ModelAndView commentreply(int otherId,int pCommentId) {
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap<>();
		map.put("other_id", otherId);
		map.put("p_comment_id", pCommentId);
		List<Comment> listChild = commentService.childComment(map);
		mv.setViewName("/web/comment/comment_reply");
		mv.addObject("commentList", listChild);
		return mv;
	}
}
