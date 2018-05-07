//package com.controller.support;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.bean.Edu_User;
//import com.bean.SubjectBean;
//import com.bean.TeacherBean;
//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
//import com.service.SubjectService;
//import com.service.TeacherService;
//
//@Controller
//@RequestMapping("/front")
//public class WebTeacherController {
//	@Autowired
//	private TeacherService teacherService;
//	@Autowired
//	private SubjectService subjectService;
//	@RequestMapping("/teacher")
//	public ModelAndView list(HttpServletRequest request) {
//		Map map=new HashMap();
//		ModelAndView mv =new ModelAndView();
//		List<TeacherBean> list= teacherService.listAll(map);
//		List<SubjectBean> list2=subjectService.listAll();
//		mv.setViewName("web/teacher/teacher_list");
//		mv.addObject("list", list);
//		mv.addObject("list2", list2);
//		return mv;
//	}
//	
//	@RequestMapping("/teacher/getById/getByIdSM{getByIdSM}")
//	public ModelAndView getById(@PathVariable("id") int id) {
//		ModelAndView mv =new ModelAndView();
//		TeacherBean tB = teacherService.getById(id);
//		List<SubjectBean> sb=subjectService.listAll();
//		mv.addObject("tB", tB);
//		mv.addObject("sb",sb);
//		mv.setViewName("web/teacher/teacher_info");
//		return mv;
//		
//	}
//
//}
