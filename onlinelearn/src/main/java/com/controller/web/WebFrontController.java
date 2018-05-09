package com.controller.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.img;
import com.service.imgService;

@Controller
public class WebFrontController {

	@Autowired
	private imgService imgService;
	@RequestMapping("/front")
	public ModelAndView websiteImagesList(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		List<img> websiteImagesList=imgService.listAll(new HashMap<>());
		System.out.println("0:"+websiteImagesList.size());
		mv.addObject("websiteImagesList", websiteImagesList);
		mv.setViewName("/web/index/index");
		return mv;
	}
	
	@RequestMapping("/front/article")
	public String article(){
		return "web/article/article-list";
	}

	@RequestMapping("/front/course")
	public String course(){
		return "web/course/courses-list";
	}
	
//	@RequestMapping("/front/teacher")
//	public String teacher(){
//		return "web/teacher/teacher_list";
//	}

	@RequestMapping("/front/question")
	public String question(){
		return "web/questions/questions-list";
	}
}
