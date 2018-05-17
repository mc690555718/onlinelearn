package com.controller.support;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Questions_tag;
import com.bean.ZtreeNode;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.Questions_tagService;
import com.util.JsonUtils;

@Controller
@RequestMapping("/admin/questions_tag")
public class Questions_tagController {
	
	@Autowired
	private Questions_tagService Questions_tagService;

	@RequestMapping("/listAll")
	public ModelAndView listAll() {
		ModelAndView mv=new ModelAndView();
		List<ZtreeNode> list=Questions_tagService.listAll1();
		String json=JsonUtils.objectToJson(list);
		mv.addObject("json", json);
		mv.setViewName("/back/question/tagList");
		return mv;
	}
	
	@RequestMapping("/updateStatus")
	@ResponseBody
	public String updateStatus(int qtid) {
	    Questions_tagService.updateStatus(qtid);
		return "redirect:/admin/questions_tag/listAll";
	}
	
	/*@RequestMapping("/init/{id}")
	public String init(@PathVariable("id")int id,Model model) {
		Questions_tag tag = Questions_tagService.getById(id);
		model.addAttribute("tag", tag);
		return "/back/question/updateTag";
	}*/
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(@RequestParam(value = "id", defaultValue = "0") int qtid,@RequestParam(value = "name", defaultValue = "null")String tagName){
		Questions_tag tag = new Questions_tag();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date create_time = null;
		try {
			create_time = df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		tag.setQuestions_tag_id(qtid);
		tag.setQuestions_tag_name(tagName);
		tag.setCreate_time(create_time);
		Questions_tagService.update(tag);
		return "redirect:/admin/questions_tag/listAll";
	}
	
	@RequestMapping("/save")
	public String save(Questions_tag tag){
		if (!tag.getQuestions_tag_name().equals("")) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date create_time = null;
			try {
				create_time = df.parse(df.format(new Date()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			tag.setCreate_time(create_time);
			tag.setParent_id("0");
			Questions_tagService.save(tag);
		}
		return "redirect:/admin/questions_tag/listAll";
	}
}
