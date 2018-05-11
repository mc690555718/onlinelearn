package com.controller.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Questions;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
	
	
}
