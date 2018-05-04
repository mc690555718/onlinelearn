package com.controller.support;

import java.io.UnsupportedEncodingException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Questions;
import com.service.QuestionsService;

@Controller
@RequestMapping("/admin/questions")
public class QuestionsController {

	@Autowired
	private QuestionsService questionsService;
	
	@RequestMapping("/listAll")
	public ModelAndView listAll(HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map = initMap(request, map);
		List<Questions> questions = questionsService.listAll(map);
		mv.setViewName("/back/question/questionsList");
		mv.addObject("questions",questions);
		return mv;
	}
	
	private Map initMap(HttpServletRequest request,Map map) throws UnsupportedEncodingException {
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		if (title!=null && title.length() > 0) {
			title = new String(title.getBytes("ISO-8859-1"), "utf8");
			map.put("title", title);
			request.setAttribute("title", title);
		}
		if (type != null && type.length() > 0) {
			map.put("type", Integer.valueOf(type));
			request.setAttribute("type", Integer.valueOf(type));
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
		questionsService.delete(id);
		return "redirect:/admin/questions/listAll";
	}
}
