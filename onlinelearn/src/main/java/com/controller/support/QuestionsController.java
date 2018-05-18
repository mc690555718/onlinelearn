package com.controller.support;

import java.io.UnsupportedEncodingException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Questions;
import com.bean.Questions_comment;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.Questions_commentMapper;
import com.service.QuestionsService;
import com.service.Questions_commentService;

@Controller
@RequestMapping("/admin/questions")
public class QuestionsController {

	@Autowired
	private QuestionsService questionsService;
	@Autowired
	private Questions_commentMapper questions_commentService;

	@RequestMapping("/listAll")
	public ModelAndView listAll(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model md) throws UnsupportedEncodingException {
		PageHelper.startPage(page, 5);
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map = initMap(request, map);
		List<Questions> questions = questionsService.listAll(map);
		PageInfo<Questions>  pageInfo = new PageInfo<Questions>(questions);
		mv.setViewName("/back/question/questionsList");
		mv.addObject("page", pageInfo);
		mv.addObject("pageNum", page);
		mv.addObject("questions",questions);
		return mv;
	}

	private Map initMap(HttpServletRequest request,Map map) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		if (title!=null && title.length() > 0) {
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

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id")int id) {
		questionsService.delete(id);
		Questions questions = new Questions();
		questions.setId(id);
		Questions_comment comment = new Questions_comment();
		comment.setQuestions(questions);
		questionsService.deleteById(id);
		List<Questions_comment> comments= questions_commentService.getId(comment);
		if(comments!=null&&comments.size()>0){
			int a[]=new int[comments.size()];
			for(int i=0;i<comments.size();i++){
				a[i]=comments.get(i).getId();
			}
			for (int j = 0; j <a.length ; j++) {
				int id2 = a[j];
				questions_commentService.deleteSubreview(id2);
			}
		}
		questions_commentService.deleteAll(comment);
		return "redirect:/admin/questions/listAll";
	}
}
