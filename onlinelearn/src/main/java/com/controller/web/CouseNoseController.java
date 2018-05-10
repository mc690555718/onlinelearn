package com.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.EduCourse;
import com.bean.SysSubject;
import com.bean.TeacherBean;
import com.service.ConurseNoseService;
import com.service.KpointNoseService;
import com.service.SubjectNoseService;
import com.service.TeacherNoseService;

@Controller
@RequestMapping("/front")
public class CouseNoseController {

	@Autowired
	private ConurseNoseService conurseNoseService;
	@Autowired
	private KpointNoseService kpointNoseService;
	@Autowired
	private SubjectNoseService subjectNoseService;
	@Autowired
	private TeacherNoseService teacherNoseService;
	
	@RequestMapping("/toCourseslist")
	public String toCourseslist(Model model,EduCourse course){
		model.addAttribute("courseList",conurseNoseService.listbyCourse(course));
		model.addAttribute("teacherList",teacherNoseService.listbyTeacher());
		model.addAttribute("subjectList",subjectNoseService.listbySubject());
		return "web/course/courses-list";
	}
	@RequestMapping("/tocourseinfor")
	public String tocourseinfor(Model model,int courseid){
		model.addAttribute("course",conurseNoseService.byIdcourse(courseid));
		model.addAttribute("teacherList",teacherNoseService.bysubjectTeacher(conurseNoseService.byIdcourse(courseid).getSubject_id()));
		model.addAttribute("parentKpointList",kpointNoseService.listbyKpoint(courseid));
		return "web/course/course-infor";
	}
	@RequestMapping("/tovedioplay")
	public String tovedioplay(Model model,int courseid){
		model.addAttribute("course",conurseNoseService.byIdcourse(courseid));
		model.addAttribute("teacherList",teacherNoseService.bysubjectTeacher(conurseNoseService.byIdcourse(courseid).getSubject_id()));
		model.addAttribute("parentKpointList",kpointNoseService.listbyKpoint(courseid));
		return "web/course/player-video";
	}
}
