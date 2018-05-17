package com.controller.web;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Edu_User;
import com.bean.Questions;
import com.bean.Questions_comment;
import com.bean.Questions_tag;
import com.service.ArticleService;
import com.service.CommentService;
import com.service.QuestionsService;
import com.service.Questions_commentService;
import com.service.Questions_tagService;
import com.util.Result;

@Controller
@RequestMapping("/front")
public class Questions_frontController {
	@Autowired
	private QuestionsService questionsService;
	@Autowired
	private Questions_commentService questions_commentService;
	@Autowired
	private Questions_tagService questions_tagService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ArticleService articleService;
	@RequestMapping("/questions/{flag}")
	public ModelAndView listAll(@PathVariable("flag") int flag){
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap<>();
		map.put("flag", flag);
		List<Questions> questions = questionsService.listAll(map);
		mv.setViewName("/web/questions/questions-list");
		mv.addObject("questions",questions);
		return mv;
	}

	@RequestMapping("/info/{id}")
	public ModelAndView info(@PathVariable("id")int id){
		ModelAndView mv = new ModelAndView();
		Questions question = questionsService.getById(id);
		questionsService.addBrowse_count(id);
		mv.setViewName("/web/questions/questions-info");
		mv.addObject("question", question);
		return mv;
	}

	@RequestMapping("/praise/ajax/add")
	@ResponseBody
	public Result updatePraise(int targetId,int type) {
		Result result = new Result();
		boolean b =false;
		if (type==1) {
			b=true;
			questionsService.updatePraise(targetId);
			result.setSuccess(b);
		}else if (type==2){
			questions_commentService.updatePraise(targetId);
			b=true;
			result.setSuccess(b);
		}else if (type==3) {
		    articleService.praiseEdit(targetId);
		    b=true;
		    result.setSuccess(b);
		}else if (type==4) {
			commentService.praiseEdit(targetId);
			b=true;
			result.setSuccess(b);
		}
		return result;
	}

	@RequestMapping("/questions/ajax/hotRecommend")
	@ResponseBody
	public Result hotRecommend(){
		Result result = new Result();
		boolean b = true;
		int flag = 6;
		Map map = new HashMap<>();
		map.put("flag", flag);
		List<Questions> questions = questionsService.listAll(map);
		result.setEntity(questions);
		result.setSuccess(b);
		return result;
	}

	@RequestMapping("/questionscomment/ajax/list")
	public ModelAndView list(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("questionsComment.questionId"));
		ModelAndView mv=new ModelAndView();
		List<Questions_comment> comments1 = questions_commentService.getById2(id);
		List<Questions_comment> comments2 = questions_commentService.getById3(id);
		mv.addObject("comments1", comments1);
		mv.addObject("comments2", comments2);
		mv.setViewName("/web/questionscomment/questionscomment-ajax-list");
		return mv;
	}

	@RequestMapping("/jump")
	public ModelAndView jump(){
		ModelAndView mv=new ModelAndView();
		List<Questions_tag> tags = questions_tagService.listAll();
		mv.addObject("tags", tags);
		mv.setViewName("/web/questions/questions-add");
		return mv;
	}

	@RequestMapping("/questions/ajax/add")
	@ResponseBody
	public Result add(HttpSession session,HttpServletRequest request){
	int type=Integer.parseInt(request.getParameter("type"));
	String a[]= request.getParameter("questionsTag").split(",");
	int b[] = new int [a.length];
	for(int i=1;i<a.length;i++){
		b[i]=Integer.parseInt(a[i]);	
	}
		Result result = new Result();
		boolean bool = true;
		result.setSuccess(bool);
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		Questions questions = new Questions();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date add_time = null;
		try {
			add_time = df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		questions.setEdu_user(user);
		questions.setTitle(request.getParameter("title"));
		questions.setContent(request.getParameter("content"));
		questions.setType(type);
		questions.setStatus(0);
		questions.setReply_count(0);
		questions.setBrowse_count(0);
		questions.setPraise_count(0);
		questions.setAdd_time(add_time);
		questionsService.save(questions);
		int qid =questionsService.getMaxId();
		for (int i = 1; i < b.length; i++) {
			Map map = new HashMap<>();
			int tid = b[i];
			map.put("qid", qid);
			map.put("tid", tid);
			questionsService.saveRelation(map);
		}
		result.setEntity(qid);
		result.setSuccess(true);
		return result;
	}
	
	@RequestMapping("/questionscomment/ajax/addComment")
	@ResponseBody
	public Result addComment(HttpSession session,HttpServletRequest request){
		Result result = new Result();
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		Questions_comment comment = new Questions_comment();
		Questions questions = new Questions();
		questions.setId(Integer.parseInt(request.getParameter("questionsComment.questionId")));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date add_time = null;
		try {
			add_time = df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    comment.setEdu_user(user);
	    comment.setQuestions(questions);
	    comment.setContent(request.getParameter("questionsComment.content"));
	    comment.setIs_best(0);
	    comment.setReply_count(0);
	    comment.setPraise_count(0);
	    comment.setAdd_time(add_time);
	    comment.setComment_id(0);
	    questions_commentService.save(comment);
	    questionsService.addReply_count(Integer.parseInt(request.getParameter("questionsComment.questionId")));
	    Boolean b=true;
	    result.setSuccess(b);
		return result;
	}
	
	@RequestMapping("/questionscomment/ajax/addReply")
	@ResponseBody
	public Result addReply(HttpServletRequest request,HttpSession session){
		Result result = new Result();
		Edu_User  user=	(Edu_User) session.getAttribute("login_success");
		Questions_comment comment = new Questions_comment();
		Questions questions = new Questions();
		questions.setId(0);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date add_time = null;
		try {
			add_time = df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		comment.setEdu_user(user);
		comment.setQuestions(questions);
		comment.setContent(request.getParameter("questionsComment.content"));
		comment.setIs_best(0);
		comment.setReply_count(0);
		comment.setPraise_count(0);
		comment.setAdd_time(add_time);
		comment.setComment_id(Integer.parseInt(request.getParameter("questionsComment.commentId")));
		questions_commentService.save(comment);
		questions_commentService.addReply_count(Integer.parseInt(request.getParameter("questionsComment.commentId")));
		Boolean b=true;
		result.setSuccess(b);
		return result;
	}
	
	@RequestMapping("/questionscomment/ajax/getCommentById/{commentId}")
	@ResponseBody
	public ModelAndView getCommentById(@PathVariable("commentId")int commentId){
		ModelAndView mv = new ModelAndView();
		List<Questions_comment> comments = questions_commentService.getListById(commentId);
		mv.addObject("comments", comments);
		mv.setViewName("web/questionscomment/questionscomment-ajax-listreply");
		return mv;
	}
}
