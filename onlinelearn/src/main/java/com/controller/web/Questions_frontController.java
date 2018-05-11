package com.controller.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Questions;
import com.bean.Questions_comment;
import com.service.QuestionsService;
import com.service.Questions_commentService;
import com.util.Result;

@Controller
@RequestMapping("/front")
public class Questions_frontController {
	@Autowired
	private QuestionsService questionsService;
	@Autowired
    private Questions_commentService questions_commentService;
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
		}else {
			questions_commentService.updatePraise(targetId);
			b=true;
		}
		return result;
	}
	
	@RequestMapping("/questions/ajax/hotRecommend")
	@ResponseBody
	public Result hotRecommend(){
		Result result = new Result();
		boolean b = true;
		int flag = 2;
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
	    List<Questions_comment> comments = questions_commentService.getById1(id);
	    System.out.println(comments);
		mv.addObject("comments", comments);
		mv.setViewName("/web/comment/comment1");
		return mv;
	}
	
	
}
