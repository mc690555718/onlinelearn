package com.controller.support;

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

import com.bean.img;
import com.bean.imgType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.imgTypeService;


@Controller
@RequestMapping("/admin/img")
public class imgTypeController {
	@Autowired
	private imgTypeService imgTypeService;
	//	查询
	@RequestMapping("/listimgType")
	public ModelAndView listimg(@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request) {
		PageHelper.startPage(page,5);
		ModelAndView mv=new ModelAndView();   
		List<imgType> list=imgTypeService.listtype();
		PageInfo<imgType> pageInfo=new PageInfo<imgType>(list);
		mv.addObject("list", list);
		mv.addObject("page", pageInfo);
		mv.setViewName("/back/img/imgType");
		return mv;
	}
	//    删除
	@RequestMapping("/delete/{typeId}")  
	public String delete(@PathVariable("typeId") int typeId) {
		imgTypeService.delete(typeId);
		return "redirect:/admin/img/listimgType";
	}
//	添加
	@RequestMapping("/save")
	public ModelAndView save(imgType imgType) {
		ModelAndView mv=new ModelAndView();
		imgTypeService.save(imgType);
		mv.setViewName("redirect:/admin/img/listimgType");
		return mv;
	}
	


	
//	修改
	@RequestMapping("/update")
	public String update(imgType imgType) {
		imgTypeService.update(imgType);
		return "redirect:/admin/img/listimgType";
	}
	
	
	
//	根据ID查
	@RequestMapping("/getById/{typeId}")
	public ModelAndView  getById(@PathVariable (value="typeId") int typeId) {
		ModelAndView mv=new ModelAndView();
		imgType imgType= imgTypeService.getById(typeId);
		mv.addObject("imgType", imgType);
		List<imgType> types=imgTypeService.listtype();
		mv.addObject("types",types);
		mv.setViewName("/back/img/imgType");
		return mv;
	}
}
