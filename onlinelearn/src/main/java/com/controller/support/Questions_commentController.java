package com.controller.support;

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
import org.springframework.web.servlet.ModelAndView;

import com.bean.Questions_comment;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.Questions_commentService;

@Controller
@RequestMapping("/admin/questions_comment")
public class Questions_commentController {

	@Autowired
	private Questions_commentService questions_commentService;
	
	@RequestMapping("listAll")
	public ModelAndView listAll(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model md) throws UnsupportedEncodingException {
		PageHelper.startPage(page, 5);
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map = initMap(request, map);
		List<Questions_comment> comments = questions_commentService.listAll(map);
		PageInfo<Questions_comment>  pageInfo = new PageInfo<Questions_comment>(comments);
		mv.setViewName("/back/question/commentsList");
		mv.addObject("page", pageInfo);
		mv.addObject("comments", comments);
		return mv;
	}

	private Map initMap(HttpServletRequest request,Map map) throws UnsupportedEncodingException {
		String question_id = request.getParameter("question_id");
		String is_best = request.getParameter("is_best");
		String name = request.getParameter("name");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		if (question_id != null && question_id.length() > 0) {
			map.put("question_id", Integer.valueOf(question_id));
			request.setAttribute("question_id", Integer.valueOf(question_id));
		}
		if (is_best != null && is_best.length() > 0 && !is_best.equals("-1")) {
			map.put("is_best", Integer.valueOf(is_best));
			request.setAttribute("is_best", Integer.valueOf(is_best));
		}
		if (name!=null && name.length() > 0) {
			name = new String(name.getBytes("ISO-8859-1"), "utf8");
			map.put("name", name);
			request.setAttribute("name", name);
		}
		if (start != null && start.length() > 0) {
			map.put("start", start);
			request.setAttribute("start", start);
		}
		if (end !=null && end.length() > 0) {
			map.put("end", end);
			request.setAttribute("end", end);
		}
		return map;
	}
	
	@RequestMapping("delete/{id}")
	public String delete(@PathVariable("id")int id) {
		questions_commentService.delete(id);
		return "redirect:/admin/questions_comment/listAll";
	}
	
	@RequestMapping("getById/{id}")
	public ModelAndView getById(@PathVariable("id")int id){
		ModelAndView mv = new ModelAndView();
		Questions_comment comment = questions_commentService.getById(id);
		mv.setViewName("/back/question/commentsDetails");
		mv.addObject("comment", comment);
		return mv;
	}
	
	@RequestMapping("update/{id}")
	public String update(@PathVariable("id")int id) {
		return "redirect:/admin/questions_comment/listAll";
	}
	
	@RequestMapping("getById1/{id}")
	public ModelAndView getById1(@PathVariable("id")int id){
		ModelAndView mv = new ModelAndView();
		List<Questions_comment> comments = questions_commentService.getById1(id);
		mv.setViewName("/back/question/commentsList");
		mv.addObject("comments", comments);
		return mv;
	}
}
