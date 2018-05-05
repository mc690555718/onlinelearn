package com.controller.support;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Questions;
import com.service.QuestionsService;

@Controller
@RequestMapping("/questions")
public class Questions_frontendController {
	@Autowired
	private QuestionsService questionsService;

	@RequestMapping("/getByType/{type}")
	public ModelAndView listById(@PathVariable("type")int type) {
		Questions questionss=new Questions();
		questionss.setType(type);
		ModelAndView mv=new ModelAndView();
		List<Questions> questions = questionsService.getByType(questionss);
		mv.setViewName("/web/questions/questions-list");
		mv.addObject("questions", questions);
		return mv;
	}
}
