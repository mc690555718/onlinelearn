package com.controller.support;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bean.SysSubject;
import com.service.SysSubjectService;

@RequestMapping(value="/admin/subj")
@Controller
public class SysSubjectController {
	
	@Autowired
	private SysSubjectService ss;
	
	@RequestMapping("/subjectadd")
	public ModelAndView subjectAdd(ModelAndView mv,String subject_name){
		ss.save(subject_name);
		mv.setViewName("redirect:/admin/subj/toSubjectList");
		return mv;
	}
	
	
	@RequestMapping("/subjectupdate")
	public ModelAndView SubjectUpdate(ModelAndView mv,String subject_name,String sort,String subject_id){
		ss.update(subject_name,sort,subject_id);
		mv.setViewName("redirect:/admin/subj/toSubjectList");
		return mv;
	}
	
	
	@RequestMapping("/toSubjectList")
	public ModelAndView toSubjectList(ModelAndView mv,String qname){
		mv.addObject("subjects",ss.query(qname));
		mv.setViewName("/back/subject/listSubject");
		return mv;
	}
	
	
	@RequestMapping("/deletesubject/{subject_id}")
	public ModelAndView deleteSubject(ModelAndView mv,@PathVariable("subject_id")int subject_id){
		ss.remove(subject_id);
		mv.setViewName("redirect:/admin/subj/toSubjectList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/loadSubjectById/{subject_id}")
	public SysSubject toSubjectList(@PathVariable("subject_id")int subject_id){
		return ss.getById(subject_id);
	}
	
}
