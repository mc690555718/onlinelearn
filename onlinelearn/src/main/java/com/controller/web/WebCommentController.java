package com.controller.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Comment;
import com.bean.Edu_User;
import com.service.CommentService;
import com.util.Result;

@Controller
public class WebCommentController {

	@Autowired
	CommentService commentService;
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
		commentService.save(comment);
		return "/web/course/comment";
	}
	
////  显示子评论框
//	@RequestMapping("/web/comment/ajax/commentreply")
//	public Result commentreply() {
//		System.out.println("1234");
//		Result result = new Result();
//		return result;
//	}
	
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
		commentService.save(comment);
		return "/web/comment/comment";
	}
	
}
