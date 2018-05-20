package com.controller.support;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.EduCourse;
import com.bean.SysSubject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.SysSubjectService;
import com.util.CharTool;

@RequestMapping(value="/admin/subj")
@Controller
public class SysSubjectController {
	
	@Autowired
	private SysSubjectService ss;
	
	@RequestMapping("/subjectadd")
	public ModelAndView subjectAdd(ModelAndView mv,String subject_name,String parentId){
		SysSubject subject = new SysSubject();
		if (parentId != null && parentId.trim().length() != 0) {
			SysSubject sub = new SysSubject();
			sub.setSubject_id(Integer.valueOf(parentId));
			subject.setSub(sub);
		}
		if (subject_name != null && subject_name.trim().length() != 0) {
            subject.setSubject_name(CharTool.setCharEncoding(subject_name));
		}
		ss.save(subject);
		mv.setViewName("redirect:/admin/subj/toSubjectList");
		return mv;
	}
	
	
	@RequestMapping("/subjectupdate")
	public ModelAndView SubjectUpdate(ModelAndView mv,String subject_name,String sort,String subject_id,String parentId){
		SysSubject subject = new SysSubject();
		if (subject_name != null && subject_name.trim().length() != 0) {
			String name = CharTool.setCharEncoding(subject_name);
			subject.setSubject_name(name);
		}
		if (sort == null || sort.trim().length() == 0) {
			sort = "0";
		}
		subject.setSort(Integer.valueOf(sort));
		if (subject_id != null && subject_id.trim().length() != 0) {
			subject.setSubject_id(Integer.valueOf(subject_id));
		}
		if (parentId != null && parentId.trim().length() != 0) {
			SysSubject sub = new SysSubject();
			sub.setSubject_id(Integer.valueOf(parentId));
			subject.setSub(sub);
		}
		ss.update(subject);
		mv.setViewName("redirect:/admin/subj/toSubjectList");
		return mv;
	}
	
	
	@RequestMapping("/toSubjectList")
	public ModelAndView toSubjectList(ModelAndView mv,String qname,String parent_id,String check
			,@RequestParam(required=true,defaultValue="1")Integer currentPage){
		//设置每页显示10调数据
		PageHelper.startPage(currentPage, 10);
		Map< Object, Object> map = new HashMap<>();
		if (qname != null && qname.trim().length() != 0) {
			map.put("qname", qname);
			mv.addObject("qname", qname);
		}
		if (parent_id != null && parent_id.trim().length() != 0) {
			if (Integer.parseInt(parent_id) >= 0) {
				map.put("parent_id", Integer.valueOf(parent_id));
				mv.addObject("parentId", parent_id);
			}
		}
		List<SysSubject> subjects = ss.query(map);
		//将数据加载为页面信息
		PageInfo<SysSubject> info = new PageInfo<>(subjects);
		//分页信息加入mv
		mv.addObject("info", info);
		mv.addObject("subjects",subjects);
		mv.addObject("subs",ss.queryParent(null));
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
