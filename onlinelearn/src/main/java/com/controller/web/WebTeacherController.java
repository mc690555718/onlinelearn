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

import com.bean.Edu_User;
import com.bean.SubjectBean;
import com.bean.SysSubject;
import com.bean.TeacherBean;
import com.bean.WebTeacherBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.SubjectService;
import com.service.TeacherService;
import com.service.WebTeacherService;

@Controller
public class WebTeacherController {
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private WebTeacherService webTeacherService;
	
	@RequestMapping("/front/teacher/list")
	public ModelAndView teacherlist(@RequestParam(required=true,defaultValue="1") Integer page, HttpServletRequest request) {
		PageHelper.startPage(page,8);
		Map map=new HashMap();
		ModelAndView mv =new ModelAndView();
		List<TeacherBean> list= teacherService.listAll(map);
		List<SubjectBean> list2=subjectService.listAll();
		PageInfo<TeacherBean> pageInfo =new PageInfo<TeacherBean>(list);
		mv.setViewName("web/teacher/teacher_list");
		mv.addObject("list", list);
		mv.addObject("list2", list2);
		mv.addObject("page", pageInfo);
		return mv;
	}


	@RequestMapping("/front/teacher/{id}")
	public ModelAndView getById(@PathVariable("id") int id) {
		ModelAndView mv =new ModelAndView();
		TeacherBean tB = teacherService.getById(id);
		List<WebTeacherBean> list2=webTeacherService.list(id);
		mv.addObject("teacher", tB);
		mv.addObject("courseList",list2);
		mv.setViewName("/web/teacher/teacher_info");
		return mv;
	}

	@RequestMapping("/front/teacher/getByIdSM/{id}")
	public ModelAndView getSubId(@PathVariable("id")int id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", teacherService.listTea(id));
		mav.addObject("list2", subjectService.listAll());
		mav.setViewName("web/teacher/teacher_list");
		return mav;
	}
}

